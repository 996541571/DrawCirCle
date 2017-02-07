//
//  ViewController.m
//  DrawCirCle
//
//  Created by administrator_CH on 15/9/17.
//  Copyright (c) 2015年 administrator_CH. All rights reserved.
//

#import "ViewController.h"

#import "DisplayView.h"

#import "AppDelegate.h"

@interface ViewController ()

@property(nonatomic,retain) AnimationCircleView *AniView;
@property(nonatomic,retain) DisplayView *playView;
@property(nonatomic,retain) AppDelegate *appDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _playView = [[DisplayView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetMaxX(self.view.frame), 300)];
    _playView.backgroundColor = [UIColor grayColor];

    [self.view addSubview:_playView];
    self.playView.progress = 0.9;
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)valueChange:(CGFloat)value
{
    
}

- (IBAction)decrease:(UIButton *)sender {
    
    [self sdsfsd];
    
    
}

- (IBAction)increase:(UIButton *)sender {
//    self.playView.progress += 0.01;
    [self change];
    self.appDelegate.connectState = !self.appDelegate.connectState;
    
}

-(void)change
{
//    [UIView animateWithDuration:1.5 animations:^{
        self.playView.progress = 1;
    
}

-(void)sdsfsd
{
//    [UIView animateWithDuration:1.5 animations:^{
//        while (self.playView.progress > 0) {
            self.playView.progress -= 0.01;
//        }
//    }];
}

@end
