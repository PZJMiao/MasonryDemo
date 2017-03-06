//
//  StatusModel.h
//  MasonryDemo
//
//  Created by pzj on 2017/3/3.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

@interface StatusModel : NSObject

@property (nonatomic,copy) NSString *text;
@property (nonatomic,strong) UserModel *userModel;
@property (nonatomic,strong) StatusModel *retweetedStatus;

@end
