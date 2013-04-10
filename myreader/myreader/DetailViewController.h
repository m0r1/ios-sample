//
//  DetailViewController.h
//  myreader
//
//  Created by m0r1 on 13/04/10.
//  Copyright (c) 2013年 m0r1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
