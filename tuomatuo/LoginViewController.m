//
//  LoginViewController.m
//  tuomatuo
//
//  Created by xjk on 1/10/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseTabBarViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIImageView *loginBackGroundView;
@property (nonatomic, strong) UIButton *weixinBtn;
@property (nonatomic, strong) UIButton *qqBtn;
@property (nonatomic, strong) UIImageView *wechat;
@property (nonatomic, strong) UIImageView *QQ;
@property (nonatomic, strong) UILabel *weichatLable;
@property (nonatomic, strong) UILabel *QQLable;

@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toTabBarControllor{
    BaseTabBarViewController *baseTabBarControllor = [[BaseTabBarViewController alloc] init];
    [self presentViewController:baseTabBarControllor animated:YES completion:^{
        NSLog(@"login go to baseTabBarControllor");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)layoutSubViews{
    [self.view addSubview:self.loginBackGroundView];
    [self.loginBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
//    self.loginBackGroundView.
    
    CGFloat offset = 32.0; // 左右间距
    
    
    [self.view addSubview:self.weixinBtn];
    [self.weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(offset);
        make.top.equalTo(self.view).offset(482*PERCENT_HEIGH);
        make.right.equalTo(self.view).offset(-offset);
        make.height.mas_equalTo(50*PERCENT_HEIGH);
    }];
    
    [self.view addSubview:self.qqBtn];
    [self.qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(offset);
        make.bottom.equalTo(self.view).offset(-45*PERCENT_HEIGH);
        make.right.equalTo(self.view).offset(-offset);
        make.height.mas_equalTo(50*PERCENT_HEIGH);
    }];
    
    [self.weixinBtn addSubview:self.wechat];
    [self.wechat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.weixinBtn).offset(28);
        make.top.equalTo(self.weixinBtn).offset(6);
        make.bottom.equalTo(self.weixinBtn).offset(-5);
        make.height.mas_equalTo(39*PERCENT_HEIGH);
        make.width.mas_equalTo(39*PERCENT_HEIGH);
    }];
    
    [self.qqBtn addSubview:self.QQ];
    [self.QQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.qqBtn).offset(28);
        make.top.equalTo(self.qqBtn).offset(6);
        make.bottom.equalTo(self.qqBtn).offset(-5);
        make.height.mas_equalTo(39*PERCENT_HEIGH);
        make.width.mas_equalTo(39*PERCENT_HEIGH);
    }];
    
    [self.weixinBtn addSubview:self.weichatLable];
    [self.weichatLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.weixinBtn).offset(107);
        make.top.equalTo(self.weixinBtn).offset(13);
        make.bottom.equalTo(self.weixinBtn).offset(-12);
        make.width.mas_equalTo(96*PERCENT_HEIGH);
    }];
    
    [self.qqBtn addSubview:self.QQLable];
    [self.QQLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.qqBtn).offset(107);
        make.top.equalTo(self.qqBtn).offset(13);
        make.bottom.equalTo(self.qqBtn).offset(-12);
        make.width.mas_equalTo(96*PERCENT_HEIGH);
    }];
    
}

- (UIImageView *)loginBackGroundView{
    if(!_loginBackGroundView){
        UIImage *image = [UIImage imageNamed:@"loginBackground"];
         _loginBackGroundView = [[UIImageView alloc] initWithImage:image];
    }
    return _loginBackGroundView;
}

- (UIButton *)weixinBtn{
    if (!_weixinBtn) {
        _weixinBtn = [[UIButton alloc] init];
        [_weixinBtn addTarget:self action:@selector(toTabBarControllor) forControlEvents:UIControlEventTouchUpInside];
        _weixinBtn.layer.cornerRadius = 4;
        _weixinBtn.layer.borderWidth = 1;
        _weixinBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _weixinBtn.layer.shadowColor = [UIColor clearColor].CGColor;
    }
    return _weixinBtn;
}

- (UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [[UIButton alloc] init];
        [_weixinBtn addTarget:self action:@selector(toTabBarControllor) forControlEvents:UIControlEventTouchUpInside];
        _qqBtn.layer.cornerRadius = 4;
        _qqBtn.layer.borderWidth = 1;
        _qqBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _qqBtn.layer.shadowColor = [UIColor clearColor].CGColor;
    }
    return _qqBtn;
}

- (UIView *)wechat{
    if (!_wechat) {
        _wechat = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"weichat"]];
    }
    return _wechat;
}

- (UIView *)QQ{
    if (!_QQ) {
        _QQ = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ"]];
    }
    return _QQ;
}

- (UILabel *)weichatLable{
    if (!_weichatLable) {
        _weichatLable = [[UILabel alloc] init];
        _weichatLable.font = [UIFont fontWithName:FontName size:24];
        _weichatLable.textColor = [UIColor whiteColor];
        _weichatLable.text = @"微信登陆";
    }
    return _weichatLable;
}

- (UILabel *)QQLable{
    if (!_QQLable) {
        _QQLable = [[UILabel alloc] init];
        _QQLable.font = [UIFont fontWithName:FontName size:24];
        _QQLable.textColor = [UIColor whiteColor];
        _QQLable.text = @"QQ登陆";
    }
    return _QQLable;
}


@end
