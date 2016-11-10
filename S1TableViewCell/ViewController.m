//
//  ViewController.m
//  S1TableViewCell
//
//  Created by maxplus on 2016/10/31.
//  Copyright © 2016年 mpl123. All rights reserved.
//

#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "TableViewCell.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc]init];
    AVQuery *query = [AVQuery queryWithClassName:@"news"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        for (AVObject *news in objects) {
            AVFile *file = [news valueForKey:@"pic"];
            [self.dataArray addObject:file.url];
            [self.tableView reloadData];
        }
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    cell.urlStr = self.dataArray[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (cell.canAnimate) {
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = [NSNumber numberWithFloat:0.8f];
        scaleAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        scaleAnimation.duration = 0.5f;
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [cell.layer addAnimation:scaleAnimation forKey:@"scale"];
        cell.canAnimate=NO;
    }
    [cell loadPhoto];
}


-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.canAnimate=YES;
    [cell stopLoadPhoto];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
