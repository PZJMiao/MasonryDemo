//
//  TwoCell.h
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoCell : UITableViewCell

@property (nonatomic,strong)UIImageView *logoImage;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *descLabel;

@property (nonatomic,copy)NSString *biaoStr;

@end
