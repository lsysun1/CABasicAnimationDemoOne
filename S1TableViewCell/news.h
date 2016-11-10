//
//  news.h
//  S1TableViewCell
//
//  Created by maxplus on 2016/11/10.
//  Copyright © 2016年 mpl123. All rights reserved.
//

#import "AVObject.h"
#import <AVOSCloud/AVOSCloud.h>


@interface news : AVObject<AVSubclassing>
@property (nonatomic,strong) AVFile *pic;

@end
