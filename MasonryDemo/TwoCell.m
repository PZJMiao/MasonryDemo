//
//  TwoCell.m
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import "TwoCell.h"

@interface TwoCell ()

@end

@implementation TwoCell
- (void)setBiaoStr:(NSString *)biaoStr
{
    _biaoStr = biaoStr;
    [self logoImage];
    [self nameLabel];
    [self descLabel];
    //实现图文混排：
//   NSString *str = [NSString stringWithFormat:@"@spRenIcon  %@　　@bankcard  %@",@"111",@"222"];
//    NSString *str = [NSString stringWithFormat:@"@bankcard/ %@  @spRenIcon/ %@  @spRenIcon/  %@ @spRenIcon/  %@ @bankcard/ %@",@"111",@"222",@"333",@"555",@"444"];
//   NSMutableAttributedString *desc= [CommonLibs getSpannableString:str];
//    [self.nameLabel setAttributedText:desc];
    
    NSMutableAttributedString *desc = [CommonLibs getAttributeTextAndImageStringText:@"图文混排" image:@"spRenIcon" imageFrame:CGRectMake(0, 0, 15, 15) isLocal:YES isHeader:YES];
    self.nameLabel.attributedText = desc;
    
    self.descLabel.text = _biaoStr;
}
#pragma mark - getters and setters          - Method -
- (UIImageView *)logoImage
{
    if (_logoImage == nil) {
        _logoImage = [[UIImageView alloc] init];
        _logoImage.image = [UIImage imageNamed:@"bankcard"];
        [self.contentView addSubview:_logoImage];
        
        [_logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(73/2, 51/2));
        }];
    }
    return _logoImage;
}
- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_nameLabel];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(self.logoImage.right).offset(10);
            make.right.mas_equalTo(-8);
        }];
    }
    return _nameLabel;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:11];
        _descLabel.numberOfLines = 0;
        [self.contentView addSubview:_descLabel];
        
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLabel.bottom).offset(10);
            make.left.mas_equalTo(self.nameLabel.left);
            make.right.mas_equalTo(-8);
            make.bottom.mas_equalTo(-4);
        }];
    }
    return _descLabel;
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
