//
//  AnimationView.m
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "AnimationView.h"
@interface AnimationView()
@property (strong,nonatomic) DRLayer *drLayer;
@end

@implementation AnimationView
-(instancetype)init{
    @throw [NSException exceptionWithName:@"不能使用init方法初始化" reason:@"需要定义一些变量" userInfo:nil];
    return nil;
}


-(IBAction)repeatTapGesture:(UITapGestureRecognizer*)tagGesture{
    if (self.drLayer) {
        [self.drLayer startAnimating];
    }
}

-(void)replaceDRLayer:(DRLayer *)layer{
    if (self.drLayer) {
        [self.drLayer removeFromSuperlayer];
    }
    self.drLayer = layer;
    [self.layer addSublayer:layer];
    
    [layer startAnimating];
}
@end
