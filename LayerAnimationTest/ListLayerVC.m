//
//  ListLayerVC.m
//  LayerAnimationTest
//
//  Created by liudavid on 16/6/20.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "ListLayerVC.h"
#import "AppDelegate.h"
@interface ListLayerVC()

@property (strong,nonatomic) NSArray *listLayers;
@end

@implementation ListLayerVC

-(void)viewDidLoad{
    [super viewDidLoad];
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.listLayers = del.listLayers;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark --

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary *value = self.listLayers[indexPath.row];
    cell.textLabel.text = value[@"name"];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listLayers.count;
}

#pragma mark --

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        UIViewController *vc = segue.destinationViewController;
        [vc setValue:[self.listLayers objectAtIndex:path.row] forKey:@"selectedDic"];
    }
}
@end
