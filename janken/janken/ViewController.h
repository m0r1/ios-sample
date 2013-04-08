//
//  ViewController.h
//  janken
//
//  Created by m0r1 on 13/03/13.
//  Copyright (c) 2013年 m0r1. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GUU 1
#define CHOKI 2
#define PAA 3

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultMessage;
@property (weak, nonatomic) IBOutlet UILabel *introMessage;
@property (weak, nonatomic) IBOutlet UILabel *aiteMessage;
@property (weak, nonatomic) IBOutlet UIImageView *aiteImage;
@property (weak, nonatomic) IBOutlet UIButton *guu;
@property (weak, nonatomic) IBOutlet UIButton *choki;
@property (weak, nonatomic) IBOutlet UIButton *paa;
@property (weak, nonatomic) IBOutlet UIButton *retry;


- (IBAction)btnGuu:(id)sender;
- (IBAction)btnChoki:(id)sender;
- (IBAction)btnPaa:(id)sender;
- (IBAction)btnRetry:(id)sender;

- (void) janken: (int) jibun andAite: (int) aite;

@end
