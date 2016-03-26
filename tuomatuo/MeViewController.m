//
//  MeViewController.m
//  tuomatuo
//
//  Created by xjk on 1/17/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"

@interface MeViewController()

@property (nonatomic, strong) UIImageView *uImageView;
@property (nonatomic, strong) UILabel *userNameLab;
@property (nonatomic, strong) UILabel *seeTotalLab;

@property (nonatomic, strong) UILabel *dynamicLab;
@property (nonatomic, strong) UILabel *dynamicLabNum;
@property (nonatomic, strong) UILabel *followLab;
@property (nonatomic, strong) UILabel *followLabNum;
@property (nonatomic, strong) UILabel *fanLab;
@property (nonatomic, strong) UILabel *fanLabNum;

@end

@implementation MeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"我";
    
    NSLog(@"MeViewController");
    
    [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"own"]];
    [self.tabBarItem setImage:[UIImage imageNamed:@"own"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style: UIBarButtonItemStylePlain target:self action:@selector(barBtnClick)];
    [self layoutSubViews];
}

- (void)barBtnClick{
    NSLog(@"barBtnClick");
    SettingViewController *setVC = [[SettingViewController alloc] init];
    setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVC animated:YES];
}

- (void)layoutSubViews{
    
    UIView *backGr = [UIView new];
    backGr.frame = CGRectMake(0, 0, self.view.frame.size.width, 207.0*PERCENT_HEIGH);
    backGr.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backGr];
    
    
    [self.view addSubview:self.uImageView];
    [self.uImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(154*PERCENT_WIDTH);
        make.top.equalTo(self.view).offset(32*PERCENT_WIDTH);
        make.width.height.equalTo(67*PERCENT_WIDTH);
    }];
    
    [self.view addSubview:self.userNameLab];
    [self.userNameLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.uImageView).offset(58);
        make.width.equalTo(63);
        make.height.equalTo(19);
    }];
    
    [self.view addSubview:self.seeTotalLab];
    [self.seeTotalLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.userNameLab).offset(60);
        make.bottom.equalTo(self.userNameLab);
        make.width.equalTo(45);
        make.height.equalTo(9);
    }];
    
    UILabel *line = [UILabel new];
    line.backgroundColor = [UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:0.39];
    [self.view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(27);
        make.right.equalTo(self.view);
        make.height.equalTo(1.0);
        make.top.equalTo(self.seeTotalLab.bottom).offset(7);
    }];
    
    [self.view addSubview:self.dynamicLab];
    [self.dynamicLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(-77);
        make.top.equalTo(self.view).offset(175);
        make.width.equalTo(26);
        make.height.equalTo(13);
    }];
    
    [self.view addSubview:self.dynamicLabNum];
    [self.dynamicLabNum makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.dynamicLab);
        make.top.equalTo(self.view).offset(161);
        make.width.equalTo(12);
        make.height.equalTo(10);
    }];
    
    [self.view addSubview:self.followLab];
    [self.followLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(175);
        make.width.equalTo(26);
        make.height.equalTo(13);
    }];
    
    [self.view addSubview:self.followLabNum];
    [self.followLabNum makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(161);
        make.width.equalTo(23);
        make.height.equalTo(10);
    }];
    
    [self.view addSubview:self.fanLab];
    [self.fanLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(77);
        make.top.equalTo(self.view).offset(175);
        make.width.equalTo(26);
        make.height.equalTo(13);
    }];
    
    [self.view addSubview:self.fanLabNum];
    [self.fanLabNum makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.fanLab);
        make.top.equalTo(self.view).offset(161);
        make.width.equalTo(17);
        make.height.equalTo(10);
    }];
}

- (UIImageView *)uImageView{
    if (!_uImageView) {
        _uImageView = [UIImageView new];
        _uImageView.layer.masksToBounds = YES;
        NSURL *URL = [NSURL URLWithString:@"http://7u2k3q.com2.z0.glb.qiniucdn.com/avatar/4/5/4/1/131454.jpeg?imageMogr2/auto-orient/crop/!480x480a75a39/thumbnail/148x148/1457963931"];
        [_uImageView sd_setImageWithURL:URL];
        _uImageView.layer.cornerRadius = 33.5*PERCENT_WIDTH;
    }
    return _uImageView;
}

- (UILabel *)userNameLab{
    if (!_userNameLab) {
        _userNameLab = [UILabel new];
        _userNameLab.text = @"邓旺旺";
        _userNameLab.font = [UIFont fontWithName:FontName size:18];
        _userNameLab.textColor = [UIColor colorWithRed:102/255.0 green:94/255.0 blue:94/255.0 alpha:1.0];
    }
    return _userNameLab;
}

- (UILabel *)seeTotalLab{
    if (!_seeTotalLab) {
        _seeTotalLab = [UILabel new];
        _seeTotalLab.text = @"2368瞄过";
        _seeTotalLab.font = [UIFont fontWithName:FontName size:9];
        _seeTotalLab.textColor = [UIColor colorWithRed:136/255.0 green:140/255.0 blue:145/255.0 alpha:1.0];
    }
    return _seeTotalLab;
}

- (UILabel *)dynamicLab{
    if (!_dynamicLab) {
        _dynamicLab = [UILabel new];
        _dynamicLab.text = @"动态";
        _dynamicLab.font = [UIFont fontWithName:FontName size:13];
        _dynamicLab.textColor = [UIColor colorWithRed:116/255.0 green:126/255.0 blue:137/255.0 alpha:1.0];

    }
    return _dynamicLab;
}
- (UILabel *)dynamicLabNum{
    if (!_dynamicLabNum) {
        _dynamicLabNum = [UILabel new];
        _dynamicLabNum = [UILabel new];
        _dynamicLabNum.text = @"13";
        _dynamicLabNum.font = [UIFont fontWithName:FontName size:10];
        _dynamicLabNum.textColor = [UIColor colorWithRed:65/255.0 green:71/255.0 blue:78/255.0 alpha:1.0];

    }
    return _dynamicLabNum;
}

- (UILabel *)followLab{
    if (!_followLab) {
        _followLab = [UILabel new];
        _followLab.text = @"关注";
        _followLab.font = [UIFont fontWithName:FontName size:13];
        _followLab.textColor = [UIColor colorWithRed:116/255.0 green:126/255.0 blue:137/255.0 alpha:1.0];
    }
    return _followLab;
}

- (UILabel *)followLabNum{
    if (!_followLabNum) {
        _followLabNum = [UILabel new];
        _followLabNum.text = @"3573";
        _followLabNum.font = [UIFont fontWithName:FontName size:10];
        _followLabNum.textColor = [UIColor colorWithRed:65/255.0 green:71/255.0 blue:78/255.0 alpha:1.0];

    }
    return _followLabNum;
}

- (UILabel *)fanLab{
    if (!_fanLab) {
        _fanLab = [UILabel new];
        _fanLab.text = @"粉丝";
        _fanLab.font = [UIFont fontWithName:FontName size:13];
        _fanLab.textColor = [UIColor colorWithRed:116/255.0 green:126/255.0 blue:137/255.0 alpha:1.0];

    }
    return _fanLab;
}

- (UILabel *)fanLabNum{
    if (!_fanLabNum) {
        _fanLabNum = [UILabel new];
        _fanLabNum = [UILabel new];
        _fanLabNum.text = @"135";
        _fanLabNum.font = [UIFont fontWithName:FontName size:10];
        _fanLabNum.textColor = [UIColor colorWithRed:65/255.0 green:71/255.0 blue:78/255.0 alpha:1.0];

    }
    return _fanLabNum;
}




@end
