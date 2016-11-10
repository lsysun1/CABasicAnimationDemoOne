//
//  TableViewCell.m
//  S1TableViewCell
//
//  Created by maxplus on 2016/11/10.
//  Copyright © 2016年 mpl123. All rights reserved.
//

#import "TableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end


@implementation TableViewCell


+(instancetype) cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        //  从xib加载Cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.canAnimate = YES;
    }
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)loadPhoto{
    if(self.urlStr){
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.urlStr]];
    }
}

-(void)stopLoadPhoto{
    [self.imgView sd_cancelCurrentImageLoad];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
