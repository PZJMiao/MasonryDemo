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

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation FirstViewController
#pragma mark - lifeCycle                    - Method -
- (void)dealloc
{
    NSLog(@"VC -> dealloc");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
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

////cell的分割线巨边距
////利用系统属性设置（separatorInset, layoutMargins）
//-(void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    //调整iOS7以上表格分割线边距
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//    }
//    //调整iOS8以上view边距（或者在cell中设置preservesSuperviewLayoutMargins,二者等效）
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
//        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
