//
//  PostionLayer.m
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "PostionLayer.h"

@interface PostionLayer()
@property (strong,nonatomic) UIBezierPath *startPath;
@property (strong,nonatomic) UIBezierPath *endPath;

@end

@implementation PostionLayer
-(UIBezierPath *)startPath{
    if (!_startPath) {
        _startPath = [UIBezierPath bezierPathWithRect:(CGRect){10,50,50,50}];
    }
    return _startPath;
}


-(UIBezierPath *)endPath{
    if (!_endPath) {
        _endPath = [UIBezierPath bezierPathWithRect:(CGRect){200,50,50,50}];
    }
    return _endPath;
}
-(void)startAnimating{
    ///决定画布大小和位置
//    self.backgroundColor = [UIColor redColor].CGColor;
//    self.frame = (CGRect){300,10,320,500};
    
    
    self.fillColor = [UIColor greenColor].CGColor;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id )self.startPath.CGPath;
    animation.toValue = (__bridge id )self.endPath.CGPath;
    animation.beginTime = 0.0;
    animation.duration = 1.0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    [self addAnimation:animation forKey:@""];
}
@end
