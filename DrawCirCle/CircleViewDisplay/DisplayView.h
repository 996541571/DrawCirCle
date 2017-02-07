//
//  DisplayView.h
//  DrawCirCle
//
//  Created by administrator_CH on 15/9/18.
//  Copyright (c) 2015年 administrator_CH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationCircleView.h"
#import "DisplayLabel.h"

@protocol animationProtocol <NSObject>

-(void)valueChange:(CGFloat)value;

@end

@interface DisplayView : UIView
@property(nonatomic,retain) AnimationCircleView *circleView;
@property(nonatomic,retain) DisplayLabel *displayLabel;
@property(nonatomic,assign) CGFloat progress;

@end
