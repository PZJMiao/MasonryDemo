//
//  GoodsModel.h
//  MasonryDemo
//
//  Created by pzj on 2017/3/3.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import <Foundation/Foundation.h>

#define URL @"https://www.fenhongshop.com/api/index.php?act=common_goods&op=get_goods_list&flag=ios"


//请求参数
@interface GoodsListParameter : NSObject

@property (nonatomic,copy) NSString *num;
@property (nonatomic,copy) NSString *curpage;
@property (nonatomic,copy) NSString *bid;
@property (nonatomic,copy) NSString *key;
@property (nonatomic,copy) NSString *gc_deep;
@property (nonatomic,copy) NSString *sort;
@property (nonatomic,copy) NSString *scid;

@end

//网络请求
@interface GoodsListApi : NSObject

@end

//返回数据
@interface GoodsModel : NSObject

@end
