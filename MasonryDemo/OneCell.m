//
//  OneCell.m
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import "OneCell.h"

@implementation OneCell

- (void)setBiaoStr:(NSString *)biaoStr
{
    _biaoStr = biaoStr;
    _descLabel.text = biaoStr;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
