//
//  OneCell.h
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneCell : UITableViewCell

@property (nonatomic,copy)NSString *biaoStr;

@property (weak, nonatomic) IBOutlet UIImageView *logoImg;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
