//
//  UserDynamicViewController.m
//  tuomatuo
//
//  Created by xjk on 1/15/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "UserDynamicViewController.h"
#import "DynamicCell.h"

@interface UserDynamicViewController()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation UserDynamicViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"动态";
    
    [self initFriendCellData];
    [self layoutSubViews];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_plus_white"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClick)];
    NSLog(@"FriendViewController");
}

- (void)initFriendCellData{
    _array = [NSMutableArray array];
    [_array addObject:@"a"];
    [_array addObject:@"b"];
    [_array addObject:@"c"];
}

- (void)rightBarBtnClick{
    
}

- (void)layoutSubViews{
    [self.view addSubview:self.tableView];
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - getter setter
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
        _tableView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0];
    }
    return _tableView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //    return self.array.count;
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"friend_cell_identified";
    DynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[DynamicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    FriendsModel *friendModel = [[FriendsModel alloc] init];
//    friendModel.name = @"邓旺旺";
//    friendModel.fansNum = @10;
//    friendModel.avatarUrl = @"http://resource.iwjw.com/iwjw-pc/img/common/QRcode.jpg";
//    [cell setFriendMobile:friendModel];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 280*PERCENT_WIDTH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

@end
