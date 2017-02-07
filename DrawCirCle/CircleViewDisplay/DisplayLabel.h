//
//  DisplayLabel.h
//  DrawCirCle
//
//  Created by administrator_CH on 15/9/18.
//  Copyright (c) 2015年 administrator_CH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface DisplayLabel : UIView
@property (retain, nonatomic) UILabel *displayMark;
@property (retain, nonatomic) UILabel *titleLabel;
@property (retain, nonatomic) UILabel *useTime;
@property (nonatomic,retain) AppDelegate *appDelegate;
-(void)initializeUserface;

-(NSMutableAttributedString *)attributString:(NSString *)string;
@end
