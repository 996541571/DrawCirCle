//
//  DisplayLabel.m
//  DrawCirCle
//
//  Created by administrator_CH on 15/9/18.
//  Copyright (c) 2015年 administrator_CH. All rights reserved.
//

#import "DisplayLabel.h"

@implementation DisplayLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        self.appDelegate = [[UIApplication sharedApplication] delegate];
    }
    return self;
}



-(void)initializeUserface
{
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    _displayMark = [self setDisplayLabelWithRect:CGRectMake(0, 0, CGRectGetMaxY(self.bounds) * 2 / 3, 50) textColor:[UIColor greenColor] font:48];
    _displayMark.attributedText = [self attributString:@"85分"];
    _displayMark.center = CGPointMake(centerPoint.x, centerPoint.y - 20);
    [self addSubview:_displayMark];
    
    _titleLabel = [self setDisplayLabelWithRect:CGRectMake(0, 0, CGRectGetMaxY(self.bounds) * 2 / 3, 20) textColor:[UIColor blackColor] font:14];
    _titleLabel.center = CGPointMake(centerPoint.x, centerPoint.y + 25);
    _titleLabel.text = @"护眼小能手";
    [self addSubview:_titleLabel];
    
    _useTime = [self setDisplayLabelWithRect:CGRectMake(0, 0, CGRectGetMaxY(self.bounds) * 2 / 3, 12) textColor:[UIColor redColor] font:11];
    _useTime.center = CGPointMake(centerPoint.x, centerPoint.y + 47);
    _useTime.text = @"今日使用105分钟";
    [self addSubview:_useTime];
    
    [self.appDelegate addObserver:self forKeyPath:@"connectState" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    
}


-(void)dealloc
{
    [self.appDelegate removeObserver:self forKeyPath:@"connectState"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
//    NSLog(@"connectState = %@",[change objectForKey:@"new"]);
    if ([[change objectForKey:@"new"] boolValue] == YES) {
        _titleLabel.backgroundColor = [UIColor redColor];
    }else
    {
        _titleLabel.backgroundColor = [UIColor greenColor];
    }
}

-(UILabel *)setDisplayLabelWithRect:(CGRect)Rect textColor:(UIColor *)textColor font:(CGFloat)font
{
    UILabel *label = [[UILabel alloc] init];
    label.bounds = Rect;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textColor;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

-(NSMutableAttributedString *)attributString:(NSString *)string
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSInteger index = [string length] - 1;
    
    [attributedString beginEditing];
    [attributedString addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:48],NSForegroundColorAttributeName : [UIColor blackColor]} range:NSMakeRange(0, index)];
    [attributedString addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20],NSForegroundColorAttributeName : [UIColor redColor]} range:NSMakeRange(index, 1)];
    [attributedString endEditing];
    
    return attributedString;
}

@end
