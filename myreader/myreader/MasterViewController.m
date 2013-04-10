//
//  MasterViewController.m
//  myreader
//
//  Created by m0r1 on 13/04/10.
//  Copyright (c) 2013年 m0r1. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

static NSString * const FEED_URL = @"http://feeds.feedburner.com/hatena/b/hotentry";

@interface MasterViewController () {
    NSMutableArray *_items;
    Item *_item;
    NSXMLParser *_parser;
    NSString *_elementName;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget: self action: @selector(startDownload) forControlEvents: UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"Cell" forIndexPath:indexPath];
    
    Item *item = _items[indexPath.row];
    cell.textLabel.text = [item title];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Item *item = _items[indexPath.row];
        [[segue destinationViewController] setDetailItem: item];
    }
}

- (void) startDownload
{
    _items = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString: FEED_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    [NSURLConnection
        sendAsynchronousRequest: request
        queue: queue
        completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error) {
            _parser = [[NSXMLParser alloc] initWithData: data];
            _parser.delegate = self;
            [_parser parse];
        }];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    _elementName = elementName;
    if ([_elementName isEqualToString: @"item"]) {
        _item = [[Item alloc] init];
        _item.title = @"";
        _item.description = @"";
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([_elementName isEqualToString: @"title"]) {
        _item.title = [_item.title stringByAppendingString: string];
    } else if ([_elementName isEqualToString: @"description"]){
        _item.description = [_item.description stringByAppendingString: string];
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString: @"item"]) {
        [_items addObject: _item];
    }
}

- (void) parserDidEndDocument:(NSXMLParser *)parser
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    });
}

@end
