//
//  ViewController.m
//  MasonryDemo
//
//  Created by 彭昭君 on 17/2/24.
//  Copyright © 2017年 pzj. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"masonry Demo";
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
    [self tableView];
}
#pragma mark - objective-cDelegate          - Method -
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if (self.dataArray.count>0) {
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
            case 0:
        {
            FirstViewController *firstVc = [[FirstViewController alloc] init];
            [self.navigationController pushViewController:firstVc animated:YES];
        }
            break;
            case 1:
        {
            SecondViewController *secondVC = [[SecondViewController alloc] init];
            [self.navigationController pushViewController:secondVC animated:YES];
        }
            break;
        default:
            break;
    }
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
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 10, 0, 10));
        }];
    }
    return _tableView;
}
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    }
    return _dataArray;
}
@end
