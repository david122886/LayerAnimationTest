//
//  OpacityLayer.m
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "OpacityLayer.h"

@interface OpacityLayer()
@property (strong,nonatomic) UIBezierPath *startPath;
@end

@implementation OpacityLayer

-(UIBezierPath *)startPath{
    if (!_startPath) {
        _startPath = [UIBezierPath bezierPathWithOvalInRect:(CGRect){100,100,200,200}];
    }
    return _startPath;
}

-(void)startAnimating{
//    ///决定画布大小和位置
//    self.frame = (CGRect){100,100,100,100};
//    self.backgroundColor = [UIColor greenColor].CGColor;
    
    self.path = self.startPath.CGPath;
    self.fillColor = [UIColor redColor].CGColor;
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.beginTime = 0.0;
    animation.duration = 2.0;
    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    [self addAnimation:animation forKey:@""];
}
@end
