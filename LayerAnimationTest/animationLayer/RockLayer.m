//
//  RockLayer.m
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "RockLayer.h"

@interface RockLayer()
@property (strong,nonatomic) UIBezierPath *startPath;
@property (strong,nonatomic) UIBezierPath *endPath;
@property (strong,nonatomic) UIBezierPath *vPath;
@property (strong,nonatomic) UIBezierPath *hPath;
@end

@implementation RockLayer
-(UIBezierPath *)startPath{
    if (!_startPath) {
        _startPath = [UIBezierPath bezierPathWithOvalInRect:(CGRect){150,250,100,100}];
    }
    return _startPath;
}


-(UIBezierPath *)endPath{
    if (!_endPath) {
        _endPath = [UIBezierPath bezierPathWithOvalInRect:(CGRect){150,250,150,150}];
    }
    return _endPath;
}

-(UIBezierPath *)vPath{
    if (!_vPath) {
        _vPath = [UIBezierPath bezierPathWithOvalInRect:(CGRect){175,150,50,200}];
    }
    return _vPath;
}


-(UIBezierPath *)hPath{
    if (!_hPath) {
        _hPath = [UIBezierPath bezierPathWithOvalInRect:(CGRect){100,275,200,50}];

    }
    return _hPath;
}

-(void)startAnimating{
    ///决定画布大小和位置
    //    self.backgroundColor = [UIColor redColor].CGColor;
    //    self.frame = (CGRect){300,10,320,500};
    
//    self.path = self.startPath.CGPath;
    
    self.fillColor = [UIColor greenColor].CGColor;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id )self.startPath.CGPath;
    animation.toValue = (__bridge id )self.hPath.CGPath;
    animation.beginTime = 0.0;
    animation.duration = 1.0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.fromValue = (__bridge id )self.hPath.CGPath;
    animation2.toValue = (__bridge id )self.vPath.CGPath;
    animation2.beginTime = 0.0 +1.0;
    animation2.duration = 0.3;
    animation2.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation3.fromValue = (__bridge id )self.vPath.CGPath;
    animation3.toValue = (__bridge id )self.hPath.CGPath;
    animation3.beginTime = 0.0 +1.0+0.3;
    animation3.duration = 0.3;
    animation3.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation4.fromValue = (__bridge id )self.hPath.CGPath;
    animation4.toValue = (__bridge id )self.startPath.CGPath;
    animation4.beginTime = 0.0 +1.0+0.3 +0.3;
    animation4.duration = 0.5;
    animation4.fillMode = kCAFillModeForwards;
    animation4.removedOnCompletion = NO;

    
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[animation,animation2,animation3,animation4];
    group.repeatCount = 1;
    group.duration = 0.0 +1.0+0.3 +0.3+0.5;
//    animation.removedOnCompletion = NO;
    [self addAnimation:group forKey:@""];
}
@end

