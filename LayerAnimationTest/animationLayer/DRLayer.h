//
//  DRLayer.h
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
@class DRLayer;

@protocol DRLayerDelegate <NSObject>

-(void)animationComplete;

@end
@interface DRLayer : CAShapeLayer

-(void)startAnimating;

@property (assign,nonatomic) id<DRLayerDelegate> drDelegate;
@end
