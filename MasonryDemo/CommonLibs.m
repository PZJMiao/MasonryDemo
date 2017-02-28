//
//  CommonLibs.m
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import "CommonLibs.h"

@implementation CommonLibs

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
+ (NSMutableAttributedString *)getAttributeTextAndImageStringText:(NSString *)text image:(NSString *)image imageFrame:(CGRect)imageFrame isLocal:(BOOL)isLocal isHeader:(BOOL)isHeader
{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@ ",text]];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    
    //本地图片or网络图片
    if (isLocal) {
        attch.image = [UIImage imageNamed:image];
    }else{
        UIImage *urlImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image]]];
        attch.image = urlImage;
    }
    attch.bounds = imageFrame;
    
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    
    //图片与文字的位置（前后）
    if (isHeader) {
        [attri insertAttributedString:string atIndex:0];
    }else{
        [attri appendAttributedString:string];
    }
    return attri;
}

/**
 * 通过AttributedString实现图文混排
 * string格式：文字描述 @图片名称 ，文字描述 @图片名称
 */
+ (NSMutableAttributedString *)getSpannableString:(NSString *)string{
    
    NSInteger strLen=[string length];
    //【我是一张图片@图片名称 ,我是另一张图片@图片名称】 解析@图片名称 显示图文混排
    // Added By Plucky 2016-11-29 11:44
    NSString *regexStr=@"@\\w+";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0,strLen)];
    
    NSMutableArray *matchArr=[[NSMutableArray alloc]init];
    
    for (NSTextCheckingResult *match in matches) {
        NSInteger num=[match numberOfRanges];
        for (NSInteger i = 0; i < num; i++) {
            //以正则中的@,划分成不同的匹配部分
            NSRange aRange=[match rangeAtIndex:i];
            NSString *component = [string substringWithRange:aRange];
            [matchArr addObject:component];
        }
    }
    
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]init];
    
    NSInteger count=matchArr.count;
    NSInteger lastIndex=0;
    for (NSInteger i=0; i<count; i++) {
        NSString *str=matchArr[i];
        NSRange range=[string rangeOfString:str];
        
        NSArray *a = [self rangeOfSubString:str inString:string];
        NSLog(@"%@",a);
        
        //取前面的字符串
        if (lastIndex>0) {
//            if (range.location<lastIndex) {
//                NSArray *array = [self rangeOfSubString:str inString:string];
//                if (i < array.count) {
//                    range = NSRangeFromString(array[i-1]);
//                }else{
//                    range = NSRangeFromString(array[i]);
//                }
//            }
            NSArray *array = [self rangeOfSubString:str inString:string];
            NSString *preStr=[string substringWithRange:NSMakeRange(lastIndex, (NSInteger)range.location-lastIndex)];
            [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:preStr]];
        }
        
        //记录上个图片的结尾位置
        lastIndex=range.location+range.length;
        
        NSInteger clen=str.length;
        NSString *imageStr=[str substringWithRange:NSMakeRange(1, clen-1)];
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image = [UIImage imageNamed:imageStr];
        //attch.bounds = CGRectMake(0, 0, 20, 14);
        NSAttributedString *attchString = [NSAttributedString attributedStringWithAttachment:attch];
        [attributedString appendAttributedString:attchString];
        
        //获取结尾的字符串
        if (i==count-1&&lastIndex<strLen) {
            NSString *affStr=[string substringWithRange:NSMakeRange(lastIndex, strLen-lastIndex)];
            [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:affStr]];
        }
    }
    
    NSLog(@" -- SpannableString:%@",attributedString);
    return attributedString;
}

+ (NSArray *)rangeOfSubString:(NSString *)subStr inString:(NSString *)string {
    
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSString *string1 = [string stringByAppendingString:subStr];
    NSString *temp;
    for (int i = 0; i < string.length; i ++) {
        temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject:NSStringFromRange(range)];
        }
    }
    return rangeArray;
}



+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
{
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:20];
    if (findText == nil && [findText isEqualToString:@""]) {
        return nil;
    }
    NSRange rang = [text rangeOfString:findText];
    if (rang.location != NSNotFound && rang.length != 0) {
        [arrayRanges addObject:[NSNumber numberWithInteger:rang.location]];
        NSRange rang1 = {0,0};
        NSInteger location = 0;
        NSInteger length = 0;
        for (int i = 0;; i++)
        {
            if (0 == i) {
                location = rang.location + rang.length;
                length = text.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            }else
            {
                location = rang1.location + rang1.length;
                length = text.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            rang1 = [text rangeOfString:findText options:NSCaseInsensitiveSearch range:rang1];
            if (rang1.location == NSNotFound && rang1.length == 0) {
                break;
            }else
            [arrayRanges addObject:[NSNumber numberWithInteger:rang1.location]];
        }
        return arrayRanges;
    }
    return nil;
}

@end
