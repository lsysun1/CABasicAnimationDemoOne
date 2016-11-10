//
//  TableViewCell.h
//  S1TableViewCell
//
//  Created by maxplus on 2016/11/10.
//  Copyright © 2016年 mpl123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic,assign) BOOL canAnimate;
@property (nonatomic,copy) NSString *urlStr;
+(instancetype) cellWithTableView:(UITableView *)tableView;
-(void)loadPhoto;
-(void)stopLoadPhoto;

@end
