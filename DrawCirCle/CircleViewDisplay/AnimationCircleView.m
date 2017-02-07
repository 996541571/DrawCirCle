//
//  AnimationCircleView.m
//  DrawCirCle
//
//  Created by administrator_CH on 15/9/18.
//  Copyright (c) 2015年 administrator_CH. All rights reserved.
//

#import "AnimationCircleView.h"

@interface AnimationCircleView ()
@property (nonatomic,retain) CAShapeLayer *colorLayer;
@property (nonatomic,retain) CAShapeLayer *colorMaskLayer;
@property (nonatomic,retain) CAShapeLayer *trackLayer;
@end

@implementation AnimationCircleView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


-(void)layoutSubviews
{
    
}

-(void)drawRect:(CGRect)rect
{
    [self setupColorLayer];
    [self setupColorMaskLayer];
    [self setupTrackLayer];
}

-(void)setupColorLayer
{
    self.colorLayer = [CAShapeLayer layer];
    self.colorLayer.frame = self.bounds;
    [self.layer addSublayer:self.colorLayer];
    
    CAGradientLayer *leftLayer1 = [CAGradientLayer layer];
    leftLayer1.frame = CGRectMake(0, 0, CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    leftLayer1.locations = @[@0.4,@0.95,@1];
    leftLayer1.colors = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,(id)[UIColor yellowColor].CGColor, nil];
    [self.colorLayer addSublayer:leftLayer1];
    
    CAGradientLayer *leftLayer2 = [CAGradientLayer layer];
    leftLayer2.frame = CGRectMake(0, CGRectGetMidY(self.bounds), CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    leftLayer2.locations = @[@0.7,@0.95,@1];
    leftLayer2.colors = [NSArray arrayWithObjects:(id)[UIColor yellowColor].CGColor,(id)[UIColor redColor].CGColor, nil];
    [self.colorLayer addSublayer:leftLayer2];
    
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(CGRectGetMidX(self.bounds), 0, CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
//    rightLayer.locations = @[@0.3,@0.8,@1];
    rightLayer.colors = [NSArray arrayWithObjects:(id)[UIColor redColor].CGColor,(id)[UIColor redColor].CGColor, nil];
    [self.colorLayer addSublayer:rightLayer];
}
-(CAShapeLayer *)trackLayer
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:CGRectGetMidX(self.bounds) - 15 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 0, 1);
    
    layer.path = path.CGPath;
    layer.lineWidth = 30;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor whiteColor].CGColor;
//    layer.lineCap = kCALineCapRound;
    return layer;
}


-(void)setupColorMaskLayer
{
    CAShapeLayer *layer = [self trackLayer];
    layer.lineWidth = 30.5;
    layer.strokeStart = 0;
    layer.strokeEnd = _persentage;
    layer.speed = 0.1;
    self.colorLayer.mask = layer;
    
    self.colorMaskLayer = [CAShapeLayer layer];
    self.colorMaskLayer = layer;
}

-(void)setupTrackLayer
{
    CAShapeLayer *layer = [self trackLayer];
    self.layer.mask = layer;
    self.trackLayer = layer;
    
}

-(void)setPersentage:(CGFloat)persentage
{
    _persentage = persentage;
    self.colorMaskLayer.strokeEnd = persentage;
}

@end
