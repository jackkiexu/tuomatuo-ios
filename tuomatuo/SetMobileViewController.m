//
//  SetMobileViewController.m
//  tuomatuo
//
//  Created by xjk on 3/16/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "SetMobileViewController.h"

@interface SetMobileViewController ()

@property (nonatomic,strong) UILabel *textLab;
@property (nonatomic,strong) UILabel *mobileLab;
@property (nonatomic,strong) UIButton *changeBtn;
@property (nonatomic,strong) UILabel *infoLab;

@end

@implementation SetMobileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改手机号";
    
    
    
}

- (void)changeMobileClick
{
    [self performSegueWithIdentifier:@"changeMobile" sender:self];
}



- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.view addSubview:self.textLab];
    [self.textLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(75);
    }];
    
    [self.view addSubview:self.mobileLab];
    [self.mobileLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textLab.bottom).offset(20);
    }];
    
    [self.view addSubview:self.changeBtn];
    [self.changeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).with.offset(45);
        make.right.equalTo(self.view).with.offset(-45);
        make.top.equalTo(self.mobileLab.bottom).offset(30);
        make.height.mas_equalTo(@45);
    }];
    
    [self.view addSubview:self.infoLab];
    [self.infoLab makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).with.offset(45+3);
        make.right.equalTo(self.view).with.offset(-45+3);
        make.bottom.equalTo(self.view).with.offset(-45);
    }];
    
}



- (UILabel *)textLab
{
    if (!_textLab) {
        _textLab = [UILabel new];
        _textLab.text = @"当前绑定的手机号";
        _textLab.textColor = FTColor_Black_1;
        _textLab.font = [UIFont fontWithName: FontName size:14];
    }
    return _textLab;
}
- (UILabel *)mobileLab
{
    if (!_mobileLab) {
        _mobileLab = [UILabel new];
        _mobileLab.text = @"15221884515";
        _mobileLab.textColor = [UIColor blackColor];
        _mobileLab.font = [UIFont fontWithName: FontName size:30];
    }
    return _mobileLab;
}

- (UIButton *)changeBtn
{
    if (!_changeBtn) {
        _changeBtn = [UIButton new];
        [_changeBtn setTitle:@"更改" forState:UIControlStateNormal];
        _changeBtn.layer.cornerRadius = 8;
        _changeBtn.clipsToBounds = YES;
        [_changeBtn addTarget:self action:@selector(changeMobileClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}


- (UILabel *)infoLab
{
    if (!_infoLab) {
        _infoLab = [UILabel new];
        _infoLab.text = @"请确保更改后的手机号码为本机号码，并且该号码已经完成实名认证，否则密号有权随时取消您的服务，每月限更改1次。";
        _infoLab.numberOfLines = 0;
        _infoLab.font = [UIFont fontWithName: FontName size:14];
        _infoLab.textColor = [UIColor grayColor];
    }
    return _infoLab;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
