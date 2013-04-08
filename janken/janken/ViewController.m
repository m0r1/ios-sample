//
//  ViewController.m
//  janken
//
//  Created by m0r1 on 13/03/13.
//  Copyright (c) 2013年 m0r1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

UIImage *guuImage;
UIImage *chokiImage;
UIImage *paaImage;

NSArray *jankenMap;
NSArray *guuMap;
NSArray *chokiMap;
NSArray *paaMap;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.retry.hidden = YES;
    self.aiteImage.hidden = YES;
    self.resultMessage.text = @"";
    guuImage = [UIImage imageNamed:@"guu.png"];
    chokiImage = [UIImage imageNamed:@"choki.png"];
    paaImage = [UIImage imageNamed:@"paa.png"];

    guuMap = @[@"", @"あいこで……！", @"勝ち！", @"負け！"];
    chokiMap = @[@"", @"負け！", @"あいこで……！", @"勝ち！"];
    paaMap = @[@"", @"勝ち！", @"負け！", @"あいこで……！"];
    jankenMap = @[@"", guuMap, chokiMap, paaMap];

    [self.resultMessage setFont:[UIFont boldSystemFontOfSize:24.0f]];
    [self.resultMessage setTextColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnGuu:(id)sender {
    self.introMessage.text = @"ぽんっ！！";
    self.choki.hidden = YES;
    self.paa.hidden = YES;
    self.aiteImage.hidden = NO;
    
    NSInteger aite = 1 + arc4random() % 3;
    [self janken: GUU andAite: aite];
    if (aite == GUU) {
        [self.aiteImage setImage:guuImage];
    } else if (aite == CHOKI) {
        [self.aiteImage setImage:chokiImage];
    } else if (aite == PAA) {
        [self.aiteImage setImage:paaImage];
    }
}

- (IBAction)btnChoki:(id)sender {
    self.introMessage.text = @"ぽんっ！！";
    self.guu.hidden = YES;
    self.paa.hidden = YES;
    self.aiteImage.hidden = NO;

    
    NSInteger aite = 1 + arc4random() % 3;
    [self janken: CHOKI andAite: aite];
    if (aite == GUU) {
        [self.aiteImage setImage:guuImage];
    } else if (aite == CHOKI) {
        [self.aiteImage setImage:chokiImage];
    } else if (aite == PAA) {
        [self.aiteImage setImage:paaImage];
    }
}

- (IBAction)btnPaa:(id)sender {
    self.introMessage.text = @"ぽんっ！！";
    self.guu.hidden = YES;
    self.choki.hidden = YES;
    self.aiteImage.hidden = NO;
    
    NSInteger aite = 1 + arc4random() % 3;
    [self janken: PAA andAite: aite];
    if (aite == GUU) {
        [self.aiteImage setImage:guuImage];
    } else if (aite == CHOKI) {
        [self.aiteImage setImage:chokiImage];
    } else if (aite == PAA) {
        [self.aiteImage setImage:paaImage];
    }
}

- (IBAction)btnRetry:(id)sender {
    self.introMessage.text = @"じゃーんけーん……";
    self.resultMessage.text = @"";
    [self.resultMessage setTextColor:[UIColor blackColor]];
    self.aiteImage.hidden = YES;
    [self.aiteImage setImage:nil];
    self.guu.hidden = NO;
    self.choki.hidden = NO;
    self.paa.hidden = NO;
    
}

- (void) janken: (int) jibun andAite: (int) aite
{
    id msg = jankenMap[jibun][aite];
    self.resultMessage.text = msg;

    if (jibun == aite) {
        [self.resultMessage setTextColor:[UIColor blackColor]];
        self.guu.hidden = NO;
        self.choki.hidden = NO;
        self.paa.hidden = NO;
        self.retry.hidden = YES;
    } else {
        self.retry.hidden = NO;
        if ([msg isEqual: @"勝ち！"]){
            [self.resultMessage setTextColor:[UIColor blueColor]];
        } else {
            [self.resultMessage setTextColor:[UIColor redColor]];
        }

    }
}

@end
