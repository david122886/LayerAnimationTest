//
//  ViewController.m
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
#import "PostionLayer.h"
#import "OpacityLayer.h"
#import "ShapeLayer.h"
#import "TraceLayer.h"
#import "RockLayer.h"

#import "AppDelegate.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (strong,nonatomic) NSArray *listLayers;

@property (weak, nonatomic) IBOutlet UIButton *leftBt;
@property (weak, nonatomic) IBOutlet UIButton *rightBt;
@property (weak, nonatomic) IBOutlet AnimationView *animationView;
- (IBAction)leftClicked:(id)sender;
- (IBAction)rightClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listLayers = [(AppDelegate*)[[UIApplication sharedApplication] delegate] listLayers];

    if (!self.selectedDic) {
        self.selectedDic = [self.listLayers firstObject];
    }
    
    [self stepBtStatus];
    self.title = self.selectedDic[@"name"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.animationView replaceDRLayer:[[NSClassFromString(self.selectedDic[@"className"]) alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftClicked:(id)sender {
    self.selectedDic = [self preLayerDic];
    [self.animationView replaceDRLayer:[[NSClassFromString(self.selectedDic[@"className"]) alloc] init]];
    self.title = self.selectedDic[@"name"];

    [self stepBtStatus];
    
}

- (IBAction)rightClicked:(id)sender {
    self.selectedDic = [self nextLayerDic];
    [self.animationView replaceDRLayer:[[NSClassFromString(self.selectedDic[@"className"]) alloc] init]];
    self.title = self.selectedDic[@"name"];

    [self stepBtStatus];
    
}


-(void)stepBtStatus{
    NSDictionary *preDic = [self preLayerDic];
    NSDictionary *nextDic = [self nextLayerDic];

    if (!preDic && !nextDic) {
        [self.leftBt setHidden:YES];
        [self.rightBt setHidden:YES];
        return;
    }
    
    [self.leftBt setHidden:NO];
    [self.rightBt setHidden:NO];
    
    if (preDic) {
        [self.leftBt setTitle:[NSString stringWithFormat:@"<< %@",preDic[@"name"]] forState:UIControlStateNormal];
    }else{
        [self.leftBt setHidden:YES];
    }
    
    if (nextDic) {
        [self.rightBt setTitle:[NSString stringWithFormat:@"%@ >>",nextDic[@"name"]] forState:UIControlStateNormal];
    }else{
        [self.rightBt setHidden:YES];
    }
}

-(NSDictionary*)nextLayerDic{
    if (!self.selectedDic || self.listLayers.count <= 1) {
        return nil;
    }
    NSInteger index = [self.listLayers indexOfObject:self.selectedDic];
    if (index == self.listLayers.count -1) {
        return nil;
    }
    return self.listLayers[index+1];
}

-(NSDictionary*)preLayerDic{
    if (!self.selectedDic || self.listLayers.count <= 1) {
        return nil;
    }
    NSInteger index = [self.listLayers indexOfObject:self.selectedDic];
    if (index == 0) {
        return nil;
    }
    return self.listLayers[index-1];
}

@end
