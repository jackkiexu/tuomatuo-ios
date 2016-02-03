//
//  LoginViewController.m
//  tuomatuo
//
//  Created by xjk on 1/10/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseTabBarViewController.h"
#import "LMPlaceField.h"
#import "UIImage+Extend.h"
#import "GreenButtn.h"
#import "AddUserInfoViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIImageView *tuomatuo_icon;
@property (nonatomic, strong) LMPlaceField *mobileTf;
@property (nonatomic, strong) LMPlaceField *codeTf;
@property (nonatomic, strong) UIButton *getCodeBtn;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *leftLab;
@property (nonatomic, strong) UIButton *protocolBtn;

@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登陆";
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

- (void)btnClick:(UIButton *)btn{
    AddUserInfoViewController *vc = [[AddUserInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _mobileTf) {
        NSInteger strLength = textField.text.length - range.length + string.length;
//        
//        if (strLength == 10 && _codeTf.text.length == 4) {
//            [_loginBtn setEnabled:YES];
//        }else{
//            [_loginBtn setEnabled:NO];
//        }
        
        if (strLength > 11){
            return NO;
        }
        //        NSString *text = nil;
        //        //如果string为空，表示删除
        //        if (string.length > 0) {
        //            text = [NSString stringWithFormat:@"%@%@",textField.text,string];
        //        }else{
        //            text = [_mobileTf.text substringToIndex:range.location];
        //        }
    }
    
    if (textField == _codeTf) {
        
        NSInteger strLength = textField.text.length - range.length + string.length;
        if (strLength > 4){
            return NO;
        }
        //        NSString *text = nil;
        //        if (string.length > 0) {
        //            text = [NSString stringWithFormat:@"%@%@",textField.text,string];
        //        }else{
        //            text = [_mobileTf.text substringToIndex:range.location];
        //        }
        //是否符合登录条件
//        if (strLength == 4) {
//            [_loginBtn setEnabled:YES];
//        }else{
//            [_loginBtn setEnabled:NO];
//        }
    }
    return YES;
}

- (void)layoutSubViews{
    
    CGFloat offset = 47; // 左右间距
    CGFloat topPadding = 221*PERCENT_HEIGH; // 上下间距
    
    [self.view addSubview:self.tuomatuo_icon];
    [self.tuomatuo_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(159);
        make.top.equalTo(self.view).offset(95*PERCENT_HEIGH);
        make.width.equalTo(57);
        make.height.equalTo(57);
    }];
    
    [self.view addSubview:self.mobileTf];
    [self.mobileTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(offset);
        make.top.equalTo(self.view).offset(topPadding);
        make.right.equalTo(self.view).offset(-offset);
        make.height.mas_equalTo(40*PERCENT_HEIGH);
    }];
    
    [self.view addSubview:self.codeTf];
    [self.codeTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.mobileTf);
        make.top.equalTo(self.mobileTf).offset(50*PERCENT_HEIGH);
        make.height.mas_equalTo(40*PERCENT_HEIGH);
    }];
    
    [self.view addSubview:self.getCodeBtn];
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.codeTf).offset(5);
        make.right.equalTo(self.codeTf.right);
        make.height.mas_equalTo(19*PERCENT_HEIGH);
        make.width.mas_equalTo(63*PERCENT_WIDTH);
    }];
    
    for (int i = 0; i < 2; i++) {
        UILabel *lable = [UILabel new];
        lable.backgroundColor = FTColor_LightGray;
        [self.view addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.mobileTf);
            make.top.equalTo(self.view).offset((topPadding + 45)*PERCENT_HEIGH+i*(50*PERCENT_HEIGH));
            make.height.equalTo(@1);
        }];
    }
    
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.mobileTf);
        make.top.equalTo(self.view).offset(topPadding+120);
        make.height.mas_equalTo(44*PERCENT_HEIGH);
    }];
    
    int Label_offset = (self.view.frame.size.width - 155 - 98)/2;
    
    [self.view addSubview:self.leftLab];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(Label_offset + 2);
        make.width.equalTo(@155);
        make.height.equalTo(@15);
    }];
    
    [self.view addSubview:self.protocolBtn];
    [self.protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(20);
        make.left.equalTo(self.leftLab.right).offset(-1);
        make.width.equalTo(@98);
        make.height.equalTo(self.leftLab);
    }];
}


- (UIImageView *)tuomatuo_icon{
    if(!_tuomatuo_icon){
        UIImage *image = [UIImage imageNamed:@"tuomatuo_icon"];
        _tuomatuo_icon = [[UIImageView alloc] initWithImage:image];
    }
    return _tuomatuo_icon;
}

- (LMPlaceField *)mobileTf{
    if (!_mobileTf) {
        _mobileTf = [LMPlaceField new];
        _mobileTf.placeholder = @"输入你的手机号码";
        _mobileTf.keyboardType = UIKeyboardTypeNumberPad;
        _mobileTf.delegate = self;
        _mobileTf.textColor = FTColor_Black_1;
        _mobileTf.font = [UIFont fontWithName:FontName size:20];
    }
    return _mobileTf;
}

- (LMPlaceField *)codeTf{
    if (!_codeTf) {
        _codeTf = [LMPlaceField new];
        _codeTf.placeholder = @"验证码";
        _codeTf.keyboardType = UIKeyboardTypeNumberPad;
        _codeTf.delegate = self;
        _codeTf.textColor = FTColor_Black_1;
        _codeTf.font =[UIFont fontWithName:FontName size:20];
    }
    return _codeTf;
}

- (UIButton *)getCodeBtn{
    if (!_getCodeBtn) {
        _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getCodeBtn.titleLabel.font = [UIFont fontWithName:FontName size:12];
        [_getCodeBtn setTitleColor:FTColor_Black_3 forState:UIControlStateNormal];
        [_getCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _getCodeBtn.layer.borderColor = FTColor_Black_3.CGColor;
        _getCodeBtn.layer.borderWidth = 1;
        [_getCodeBtn setBackgroundImage:[UIImage imageWithColor:BGColor_GetCodeBtn_disable] forState:UIControlStateDisabled];

        _getCodeBtn.tag = 1;
        [_getCodeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getCodeBtn;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [GreenButtn buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.clipsToBounds = YES;
        _loginBtn.tag = 2;
        [_loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}

- (UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.text = @"点击登陆, 即表示你同意";
        _leftLab.font = [UIFont fontWithName:FontName size:14];
        _leftLab.textColor = FTColor_Black_3;
    }
    return _leftLab;
}

- (UIButton *)protocolBtn{
    if (!_protocolBtn) {
        _protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_protocolBtn setTitle:@"密号服务协议。" forState:UIControlStateNormal];
        [_protocolBtn setTitleColor:FTColor_Black_3 forState:UIControlStateNormal];
        _protocolBtn.titleLabel.font = [UIFont fontWithName:FontName size:14];
        _protocolBtn.tag = 3;
        _protocolBtn.clipsToBounds = NO;
        [_protocolBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        UIView *view = [UIView new];
        view.backgroundColor = FTColor_Black_3;
        [_protocolBtn addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_protocolBtn);
            make.top.equalTo(_protocolBtn.bottom).offset(-1);
            make.width.equalTo(_protocolBtn).offset(-12);
            make.height.equalTo(@0.5);
        }];
    }
    return _protocolBtn;
}


@end
