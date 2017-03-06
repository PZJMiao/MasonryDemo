//
//  FirstViewController.m
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import "FirstViewController.h"
#import "OneCell.h"
#import "TwoCell.h"

#import "UserModel.h"
#import "StatusModel.h"
//
#import "StatusResultModel.h"
#import "AdModel.h"
#import "Status.h"
#import "User.h"

#import "Student.h"
#import "Bag.h"


@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation FirstViewController
#pragma mark - lifeCycle                    - Method -
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
    [self loadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - eventResponse                - Method -

#pragma mark - notification                 - Method -

#pragma mark - privateMethods               - Method -
- (void)initViews
{
    self.navigationItem.title = @"111";
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableView];
}
- (void)loadData
{
//    //字典转模型
//    NSDictionary *dict = @{
//                           @"name" : @"Jack",
//                           @"icon" : @"lufy.png",
//                           @"age" : @20,
//                           @"height" : @"1.55",
//                           @"money" : @100.9,
//                           @"sex" : @(SexFemale),
//                           @"gay" : @"true"
//                           //   @"gay" : @"1"
//                           //   @"gay" : @"NO"
//                           };
//    
//    UserModel *uesrModle = [UserModel mj_objectWithKeyValues:dict];
//    NSLog(@"uesrModle = %@/ name=%@,icon=%@,age=%ld,money=%.2f",uesrModle,uesrModle.name,uesrModle.icon,uesrModle.age,uesrModle.money);
    
    
    
//    //json 字符串转模型
//    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
//    UserModel *userModel = [UserModel mj_objectWithKeyValues:jsonString];
//    NSLog(@"userModel = %@/ name=%@,icon=%@,age=%ld",userModel,userModel.name,userModel.icon,userModel.age);

//    //模型中嵌套模型
//    NSDictionary *dict = @{
//                           @"text" : @"111",
//                           @"userModel" : @{
//                                   @"name" : @"p",
//                                   @"icon" : @"aa.png"
//                                   },
//                           @"retweetedStatus" : @{
//                                   @"text" : @"222",
//                                   @"userModel" : @{
//                                           @"name" : @"z",
//                                           @"icon" : @"bb.png"
//                                           }
//                                   }
//                           };
//    StatusModel *statusModel = [StatusModel mj_objectWithKeyValues:dict];
//    NSLog(@"statusModel = %@",statusModel);
//    //获取值 可以一直点点点
    
    
    
//    //模型中有数组，数组里面又有其他模型
//    NSDictionary *dict = @{
//                           @"statuses" : @[
//                                   
//                                   @{
//                                       @"text" : @"11",
//                                       @"user" : @{
//                                               @"name" : @"1",
//                                               @"icon" : @"1.png"
//                                               }
//                                       },
//                                   @{
//                                       @"text" : @"22",
//                                       @"user" : @{
//                                               @"name" : @"2",
//                                               @"icon" : @"2.png"
//                                               }
//                                       }
//                                   
//                                   ],
//                           @"ads" : @[
//                                   
//                                   @{
//                                       @"image" : @"ad01.png",
//                                       @"url" : @"http://www.ad01.com"
//                                       },
//                                   @{
//                                       @"image" : @"ad02.png",
//                                       @"url" : @"http://www.ad02.com"
//                                       }
//                                   
//                                   ],
//                           @"totalNumber" : @"2014"
//                           };
//    
//    //告诉MJExtension 被嵌套的模型，否则的话还是没有转成model
//    [StatusResultModel mj_setupObjectClassInArray:^NSDictionary *{
//        return @{
////                 @"statuses":[Status class],
////                 @"ads":[AdModel class]
//                 //可以是上下两种方法
//                 @"statuses":@"Status",
//                 @"ads":@"AdModel"
//                 };
//    }];
//    
//    //json -> StatusResult
//    StatusResultModel *result = [StatusResultModel mj_objectWithKeyValues:dict];
//    NSLog(@"totalNumber = %@",result.totalNumber);
//    NSArray *statusResult = result.statuses;
//    NSArray *ads = result.ads;
//    //可以遍历上面的数组获得数组里对应的内容
//    for (Status *status in statusResult) {
//        NSString *text = status.text;
//        NSString *name = status.user.name;
//        NSString *icon = status.user.icon;
//        NSLog(@"text = %@ ,name = %@ ,icon = %@",text,name,icon);
//    }
//    for (AdModel *ad in ads) {
//        NSString *image = ad.image;
//        NSString *url = ad.url;
//        NSLog(@"image = %@ ,uel = %@",image,url);
//    }
    
    
//    //模型中属性名和字典中的key不相同（或者需要多级映射）
//    NSDictionary *dict = @{
//                           @"id" : @"20",
//                           @"desciption" : @"kids",
//                           @"name" : @{
//                                   @"newName" : @"lufy",
//                                   @"oldName" : @"kitty",
//                                   @"info" : @[
//                                           @"test-data",
//                                           @{
//                                               @"nameChangedTime" : @"2013-08"
//                                               }
//                                           ]
//                                   },
//                           @"other" : @{
//                                   @"bag" : @{
//                                           @"name" : @"a red bag",
//                                           @"price" : @100.7
//                                           }
//                                   }
//                           };
//    //将属性名换为其他key去字典中取值
//    [Student mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{
//                 @"ID":@"id",
//                 @"desc":@"desciption",
//                 @"oldName":@"name.oldName",
//                 @"nowName":@"name.newName",
//                 @"nameChangedTime":@"name.info[1].nameChangedTime",
//                 @"bag":@"other.bag"
//                 };
//    }];
//    Student *stu = [Student mj_objectWithKeyValues:dict];
//    NSLog(@"stu = %@",stu);
//    NSLog(@"bagName = %@,bagPrice = %@",stu.bag.name,stu.bag.price);
    
    
//    //JSON array -> model array【将一个字典数组转成模型数组】
//    NSArray *dictArray = @[
//                           @{
//                               @"name" : @"Jack",
//                               @"icon" : @"lufy.png"
//                               },
//                           @{
//                               @"name" : @"Rose",
//                               @"icon" : @"nami.png"
//                               }
//                           ];
//    NSArray *userArray = [User mj_objectArrayWithKeyValuesArray:dictArray];
//    NSLog(@"userArray = %@",userArray);
//    for (User *user in userArray) {
//        NSLog(@"name = %@, icon = %@",user.name,user.icon);
//    }
    
    
//    //Model -> JSON【将一个模型转成字典】
//    User *user = [[User alloc] init];
//    user.name = @"1";
//    user.icon = @"1.png";
//    
//    Status *status = [[Status alloc] init];
//    status.user = user;
//    status.text = @"222";
//    
//    NSDictionary *statusDict = status.mj_keyValues;
//    NSLog(@"statusDict = %@",statusDict);
//    
//    Student *stu = [[Student alloc] init];
//    stu.ID = @"123";
//    stu.oldName = @"asd";
//    stu.nowName = @"zxc";
//    stu.desc = @"qazwsx";
//    stu.nameChangedTime = @"2017-03-02";
//    
//    Bag *bag = [[Bag alloc] init];
//    bag.name = @"bagname";
//    bag.price = @"bagprice";
//    stu.bag = bag;
//    
//    NSDictionary *stuDic = stu.mj_keyValues;
//    NSLog(@"stuDic = %@",stuDic);
    
    
    
//    //模型数组->字典数组 Model array ->JSON array
//    User *user1 = [[User alloc] init];
//    user1.name = @"1";
//    user1.icon = @"1.png";
//    
//    User *user2 = [[User alloc] init];
//    user2.name = @"2";
//    user2.icon = @"2.png";
//    
//    NSArray *userArray = @[user1,user2];
//    NSArray *dictArray = [User mj_keyValuesArrayWithObjectArray:userArray];
//    NSLog(@"dictArray = %@",dictArray);
    
    
//    //Core Data
//    NSDictionary *dict = @{
//                           @"name" : @"Jack",
//                           @"icon" : @"lufy.png",
//                           @"age" : @20,
//                           @"height" : @1.55,
//                           @"money" : @"100.9",
//                           @"sex" : @(SexFemale),
//                           @"gay" : @"true"
//                           };
//    NSManagedObjectContext *context = nil;
//    User *user = [User mj_objectWithKeyValues:dict context:context];
//    [context save:nil];
//    NSLog(@"user = %@",user);
    
    
    
    //coding
    
    
    
}
#pragma mark - objective-cDelegate          - Method -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *cellId = @"OneCell";
        OneCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:cellId owner:self options:nil] lastObject];
        }
        if (self.dataArray.count>0) {
            cell.biaoStr = self.dataArray[indexPath.row];
        }
        return cell;
    }else{
        static NSString *cellId = @"TwoCell";
        TwoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[TwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        if (self.dataArray.count>0) {
            cell.biaoStr = self.dataArray[indexPath.row];
        }
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - getters and setters          - Method -
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            //            make.top.mas_equalTo(64);
            //            make.bottom.mas_equalTo(0);
            //            make.left.mas_equalTo(10);
            //            make.right.mas_equalTo(-10);
            //上面的方法可以种，有好几种方法可供使用，我选了我认为最简便的方法
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _tableView;
}
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] initWithObjects:@"tableView高度自适应",@"tableView高度自适应222222Get the new view controller using [segue destinationViewController].",@"In a storyboard-based application, you will often want to do a little preparation before navigation",@"111111222333444555",@"adhuadjshca",@"Masonry是一个轻量级的布局框架，拥有自己的描述语法，采用更优雅的链式语法封装自动布局、简洁明了、 并具有高可读性、 而且同时支持 iOS 和 Max OS X",@"iOS控件布局之Masonry布局框架", nil];
        
//         _dataArray = [[NSMutableArray alloc] initWithObjects:@"tableView高度自适应", nil];
    }
    return _dataArray;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
