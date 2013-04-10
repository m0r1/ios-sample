//
//  DetailViewController.m
//  myreader
//
//  Created by m0r1 on 13/04/10.
//  Copyright (c) 2013年 m0r1. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void)configureView
{
    if (self.detailItem) {
        self.title = [self.detailItem title];
        self.textView.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
