//
//  Trace.m
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "TraceLayer.h"

@interface TraceLayer()

@property (strong,nonatomic) UIBezierPath *startPath;

@end

@implementation TraceLayer
-(UIBezierPath *)startPath{
    if (!_startPath) {
        _startPath = [UIBezierPath bezierPathWithRect:(CGRect){100,200,100,100}];
    }
    return _startPath;
}


-(void)startAnimating{
    ///决定画布大小和位置
    //    self.backgroundColor = [UIColor redColor].CGColor;
    //    self.frame = (CGRect){300,10,320,500};
    
    self.path = self.startPath.CGPath;///通过path指定形状
    
    self.strokeColor = [UIColor greenColor].CGColor;
    self.fillColor = [UIColor clearColor].CGColor;
    self.lineWidth = 2;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.5);
    animation.toValue = @(1.0);
    animation.beginTime = 0.0;
    animation.duration = 2.0;
    animation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation2.fromValue = @(0.5);
    animation2.toValue = @(0);
    animation2.beginTime = 0.0;
    animation2.duration = 2.0;
    animation2.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    [self addAnimation:animation forKey:@""];
    [self addAnimation:animation2 forKey:@""];
}

@end
