//
//  DisplayView.m
//  DrawCirCle
//
//  Created by administrator_CH on 15/9/18.
//  Copyright (c) 2015年 administrator_CH. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _progress = 0;
        [self initWithInterface];
        
    }
    return self;
}

-(void) initWithInterface
{
    CGFloat width = self.frame.size.height;
    CGFloat height = self.frame.size.height;
    
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    _circleView = [[AnimationCircleView alloc] init];
    _circleView.bounds = CGRectMake(0, 0, width, height);
    _circleView.center = centerPoint;
    _circleView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_circleView];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"蒙板"]];
    imageView.bounds = CGRectMake(0, 0, width, height);
    imageView.center = centerPoint;
    [self addSubview:imageView];
    
    _displayLabel = [[DisplayLabel alloc] init];
    _displayLabel.bounds = CGRectMake(0, 0, width * 2 / 3, height * 2 / 3);
    _displayLabel.center = centerPoint;
    _displayLabel.layer.cornerRadius = width * 1 / 3;
    
    [_displayLabel initializeUserface];
    
    [self insertSubview:_displayLabel aboveSubview:_displayLabel];
    
    
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    _circleView.persentage = progress;
//    NSLog(@"%.2f",progress);

}


@end
