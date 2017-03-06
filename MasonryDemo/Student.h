//
//  Student.h
//  MasonryDemo
//
//  Created by pzj on 2017/3/3.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bag;

@interface Student : NSObject

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *nowName;
@property (nonatomic,copy) NSString *oldName;
@property (nonatomic,copy) NSString *nameChangedTime;

//bag
//@property (nonatomic,copy) NSString *name;
//@property (nonatomic,copy) NSString *price;
@property (nonatomic,strong) Bag *bag;

@end
