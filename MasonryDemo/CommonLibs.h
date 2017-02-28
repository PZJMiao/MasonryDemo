//
//  CommonLibs.h
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonLibs : NSObject

/**
 *
 * 图文混排（图片+文字/文字+图片）
 * text:文字
 * image:网络图片地址或本地图片名称
 * imageFrame:图片的frame
 * isLocal:是否是本地图片（YES-->本地，NO-->网络）
 * isHeader:图片位置在文字前面还是后面（YES-->图片+文字，NO-->文字+图片）
 *
 */
+ (NSMutableAttributedString *)getAttributeTextAndImageStringText:(NSString *)text image:(NSString *)image imageFrame:(CGRect)imageFrame isLocal:(BOOL)isLocal isHeader:(BOOL)isHeader;

/**
 * 通过AttributedString实现图文混排
 * string格式：文字描述 @图片名称 ，文字描述 @图片名称
 */
+ (NSMutableAttributedString *)getSpannableString:(NSString *)string;

@end
