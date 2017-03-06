//
//  UserModel.h
//  MasonryDemo
//
//  Created by pzj on 2017/3/3.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SexMale,
    SexFemale
}Sex;

@interface UserModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,copy) NSString *height;
@property (nonatomic,assign) double money;
@property (nonatomic,assign,getter=isGay) BOOL gay;

@end
