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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.retry.hidden = YES;
    self.aiteImage.hidden = YES;
    self.resultMessage.text = @"";
    guuImage = [UIImage imageNamed:@"guu.png"];
    chokiImage = [UIImage imageNamed:@"choki.png"];
    paaImage = [UIImage imageNamed:@"paa.png"];

    [self.resultMessage setFont:[UIFont boldSystemFontOfSize:24.0f]];
    [self.resultMessage setTextColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnGuu:(id)sender {
    self.introMessage.text = @"ぽんっ！！";
    self.choki.hidden = YES;
    self.paa.hidden = YES;
    self.aiteImage.hidden = NO;
    
    NSInteger aite = arc4random() % 3;
    if (aite == 1) {
        [self.aiteImage setImage:guuImage];
        self.resultMessage.text = @"あいこで……！";
        self.guu.hidden = NO;
        self.choki.hidden = NO;
        self.paa.hidden = NO;
        self.retry.hidden = YES;
        [self.resultMessage setTextColor:[UIColor blackColor]];
    } else if (aite == 2) {
        [self.aiteImage setImage:chokiImage];
        self.resultMessage.text = @"あなたの勝ちですよっ！";
        self.retry.hidden = NO;
        [self.resultMessage setTextColor:[UIColor blueColor]];
    } else {
        [self.aiteImage setImage:paaImage];
        self.resultMessage.text = @"あなたの負けですねー！";
        self.retry.hidden = NO;
        [self.resultMessage setTextColor:[UIColor redColor]];
    }
}

- (IBAction)btnChoki:(id)sender {
    self.introMessage.text = @"ぽんっ！！";
    self.guu.hidden = YES;
    self.paa.hidden = YES;
    self.aiteImage.hidden = NO;

    
    NSInteger aite = arc4random() % 3;
    if (aite == 1) {
        [self.aiteImage setImage:guuImage];
        self.resultMessage.text = @"あなたの負けですねー！";
        [self.resultMessage setTextColor:[UIColor redColor]];
        self.retry.hidden = NO;
    } else if (aite == 2) {
        [self.aiteImage setImage:chokiImage];
        self.resultMessage.text = @"あいこで……！";
        [self.resultMessage setTextColor:[UIColor blackColor]];
        self.guu.hidden = NO;
        self.choki.hidden = NO;
        self.paa.hidden = NO;
        self.retry.hidden = YES;
    } else {
        [self.aiteImage setImage:paaImage];
        self.resultMessage.text = @"あなたの勝ちですよっ！";
        [self.resultMessage setTextColor:[UIColor blueColor]];
        self.retry.hidden = NO;
    }
}

- (IBAction)btnPaa:(id)sender {
    self.introMessage.text = @"ぽんっ！！";
    self.guu.hidden = YES;
    self.choki.hidden = YES;
    self.aiteImage.hidden = NO;
    
    NSInteger aite = arc4random() % 3;
    if (aite == 1) {
        [self.aiteImage setImage:guuImage];
        self.resultMessage.text = @"あなたの勝ちですよっ！";
        [self.resultMessage setTextColor:[UIColor blueColor]];
        self.retry.hidden = NO;
    } else if (aite == 2) {
        [self.aiteImage setImage:chokiImage];
        self.resultMessage.text = @"あなたの負けですねー！";
        [self.resultMessage setTextColor:[UIColor redColor]];
        self.retry.hidden = NO;
    } else {
        [self.aiteImage setImage:paaImage];
        self.resultMessage.text = @"あいこで……！";
        [self.resultMessage setTextColor:[UIColor blackColor]];
        self.guu.hidden = NO;
        self.choki.hidden = NO;
        self.paa.hidden = NO;
        self.retry.hidden = YES;
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
@end
