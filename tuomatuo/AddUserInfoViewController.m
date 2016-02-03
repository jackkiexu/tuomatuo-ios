//
//  AddUserInfoViewController.m
//  tuomatuo
//
//  Created by xjk on 2/3/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "AddUserInfoViewController.h"
#import "LMPlaceField.h"
#import "GreenButtn.h"

@interface AddUserInfoViewController()

@property (nonatomic, strong) UIButton *uImgBtn;
@property (nonatomic, strong) LMPlaceField *nickTf;
@property (nonatomic, strong) LMPlaceField *ageTf;

@property (nonatomic, strong) UILabel *ageLab;
@property (nonatomic, strong) UIButton *boyBtn;
@property (nonatomic, strong) UIButton *girlBtn;
@property (nonatomic, strong) UIButton *tickBtn;

@property (nonatomic, strong) UIButton *finshBtn;

@end

@implementation AddUserInfoViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"wrong"] style: UIBarButtonItemStylePlain target:self action:@selector(barBtnClick)];
    [self layoutSubViews];
}

- (void)barBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btnClick:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _nickTf) {
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
    
    if (textField == _ageTf) {
        
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
    [self.view addSubview:self.uImgBtn];
    [self.uImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(57*PERCENT_HEIGH);
        make.width.equalTo(57*PERCENT_WIDTH);
        make.left.equalTo((self.view.frame.size.width - 57*PERCENT_WIDTH)/2);
        make.top.equalTo(self.view).offset(95*PERCENT_HEIGH);
    }];
    
    CGFloat offset = 47; // 左右间距
    CGFloat topPadding = 221*PERCENT_HEIGH; // 上下间距
    
    [self.view addSubview:self.nickTf];
    [self.nickTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(offset);
        make.top.equalTo(self.view).offset(topPadding);
        make.right.equalTo(self.view).offset(-offset);
        make.height.mas_equalTo(40*PERCENT_HEIGH);
    }];
    
    [self.view addSubview:self.ageTf];
    [self.ageTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nickTf);
        make.top.equalTo(self.nickTf).offset(50*PERCENT_HEIGH);
        make.height.mas_equalTo(40*PERCENT_HEIGH);
    }];
    
    for (int i = 0; i < 2; i++) {
        UILabel *lable = [UILabel new];
        lable.backgroundColor = FTColor_LightGray;
        [self.view addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.nickTf);
            make.top.equalTo(self.view).offset((topPadding + 45)*PERCENT_HEIGH+i*(50*PERCENT_HEIGH));
            make.height.equalTo(@1);
        }];
    }
    
    [self.view addSubview:self.ageLab];
    [self.ageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickTf);
        make.top.equalTo(self.ageTf).offset(50*PERCENT_HEIGH);
        make.height.mas_equalTo(40);
        make.width.equalTo(50);
    }];
    
    [self.view addSubview:self.boyBtn];
    [self.boyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.ageLab);
        make.centerX.equalTo(self.view).offset(-43*PERCENT_WIDTH);
        make.width.equalTo(30);
        make.height.equalTo(18);
    }];
    
    [self.view addSubview:self.girlBtn];
    [self.girlBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.ageLab);
        make.centerX.equalTo(self.view).offset(43*PERCENT_WIDTH);
        make.width.equalTo(30);
        make.height.equalTo(18);
    }];
    
    [self.view addSubview:self.finshBtn];
    [self.finshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.ageTf);
        make.top.equalTo(self.view).offset(415*PERCENT_HEIGH);
        make.height.mas_equalTo(44*PERCENT_HEIGH);
    }];
}

- (UIButton *)uImgBtn{
    if (!_uImgBtn) {
        _uImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_uImgBtn setBackgroundImage:[UIImage imageNamed:@"uImgEmpty"] forState:UIControlStateNormal];
        [_uImgBtn setBackgroundImage:[UIImage imageNamed:@"uImgEmpty"] forState:UIControlStateSelected];
    }
    return _uImgBtn;
}

- (LMPlaceField *)nickTf{
    if (!_nickTf) {
        _nickTf = [LMPlaceField new];
        _nickTf.placeholder = @"输入你的手机号码";
        _nickTf.keyboardType = UIKeyboardTypeNumberPad;
        _nickTf.delegate = self;
        _nickTf.textColor = FTColor_Black_1;
        _nickTf.font = [UIFont fontWithName:FontName size:20];
    }
    return _nickTf;
}

- (LMPlaceField *)ageTf{
    if (!_ageTf) {
        _ageTf = [LMPlaceField new];
        _ageTf.placeholder = @"验证码";
        _ageTf.keyboardType = UIKeyboardTypeNumberPad;
        _ageTf.delegate = self;
        _ageTf.textColor = FTColor_Black_1;
        _ageTf.font =[UIFont fontWithName:FontName size:20];
    }
    return _ageTf;
}

- (UILabel *)ageLab{
    if (!_ageLab) {
        _ageLab = [UILabel new];
        _ageLab.font = [UIFont fontWithName:FontName size:20];
        _ageLab.textColor = FTColor_Black_4;
        _ageLab.text = @"性别:";
    }
    return _ageLab;
}

- (UIButton *)boyBtn{
    if (!_boyBtn) {
        _boyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _boyBtn.layer.borderWidth = 1;
        _boyBtn.layer.borderColor = FTColor_Black_4.CGColor;
        _boyBtn.titleLabel.font = [UIFont fontWithName:FontName size:12];
        [_boyBtn setTitle:@"男" forState:UIControlStateNormal];
        [_boyBtn setTitleColor:FTColor_Black_4 forState:UIControlStateNormal];
    }
    return _boyBtn;
}

- (UIButton *)girlBtn{
    if (!_girlBtn) {
        _girlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _girlBtn.layer.borderWidth = 1;
        _girlBtn.layer.borderColor = FTColor_Black_4.CGColor;
        _girlBtn.titleLabel.font = [UIFont fontWithName:FontName size:12];
        [_girlBtn setTitle:@"女" forState:UIControlStateNormal];
        [_girlBtn setTitleColor:FTColor_Black_4 forState:UIControlStateNormal];
    }
    return _girlBtn;
}

- (UIButton *)finshBtn{
    if (!_finshBtn) {
        _finshBtn = [GreenButtn buttonWithType:UIButtonTypeCustom];
        [_finshBtn setTitle:@"完成" forState:UIControlStateNormal];
        _finshBtn.layer.cornerRadius = 5;
        _finshBtn.clipsToBounds = YES;
        _finshBtn.tag = 2;
        [_finshBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _finshBtn.enabled = NO;
    }
    return _finshBtn;
}

@end
