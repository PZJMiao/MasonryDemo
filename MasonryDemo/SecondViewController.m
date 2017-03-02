//
//  SecondViewController.m
//  MasonryDemo
//
//  Created by pzj on 2017/3/2.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondCell.h"

@interface SecondViewController ()

@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation SecondViewController

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    
//    UIView *headView = [[UIView alloc] init];
//    headView.backgroundColor = [UIColor purpleColor];
//    headView.alpha = 0.5;
//    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
//    
//    self.tableView.tableHeaderView = headView;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return self.dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (self.dataArray.count>0) {
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld分区:%@",indexPath.section,self.dataArray[indexPath.row]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor purpleColor];
    headView.alpha = 0.5;
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = GaryColor999999;
    label.text = [NSString stringWithFormat:@"分区 --- %ld",section];
    [headView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(5, 10, 5, 10));
    }];
    
    return headView;
}

//利用系统属性设置（separatorInset, layoutMargins）
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //调整iOS7以上表格分割线边距
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    //调整iOS8以上view边距（或者在cell中设置preservesSuperviewLayoutMargins,二者等效）
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
//        _dataArray = [[NSMutableArray alloc] initWithObjects:@"a",@"Override to support rearranging the table view.",@"Override to support conditional rearranging of the table view.",@"In a storyboard-based application, you will often want to do a little preparation before navigation", nil];
        _dataArray = [[NSMutableArray alloc] initWithObjects:@"a",@"b",@"c",@"d", nil];
    }
    return _dataArray;
}

@end
