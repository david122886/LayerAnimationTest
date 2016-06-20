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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *leftBt;
@property (weak, nonatomic) IBOutlet UIButton *rightBt;
@property (weak, nonatomic) IBOutlet AnimationView *animationView;
- (IBAction)leftClicked:(id)sender;
- (IBAction)rightClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.animationView replaceDRLayer:[RockLayer new]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftClicked:(id)sender {
    
}

- (IBAction)rightClicked:(id)sender {
    
}
@end
