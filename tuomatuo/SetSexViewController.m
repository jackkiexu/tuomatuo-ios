//
//  SetSexViewController.m
//  tuomatuo
//
//  Created by xjk on 3/16/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "SetSexViewController.h"

@interface SetSexViewController ()

@property (nonatomic,strong) UIButton *boyBtn;
@property (nonatomic,strong) UIButton *girlBtn;

@property (nonatomic,strong) UIButton *lastBtn;

@end

@implementation SetSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"性别";
    self.view.backgroundColor = [UIColor whiteColor];
    
}



- (void)btnClick:(UIButton *)btn
{
    if (btn == _lastBtn) {
        return;
    }
    btn.selected = YES;
    _lastBtn.selected = NO;
//    if (btn.tag == 1) {
//        USER_PROPERTY.userSex = @"0";
//    }else{
//        USER_PROPERTY.userSex = @"1";
//    }
//    
//    
//    NSDictionary *parameter = @{@"phoneVersion":Parameter_systemVersion,@"appversion":Parameter_appversion,@"mobile":USER_BEAN.loginName,@"sign":USER_BEAN.sign,@"nick":USER_PROPERTY.nick,@"userSex":USER_PROPERTY.userSex};
//    
//    [HE uploadFileWithUrl:URL_userPropertyIconUpload withImageData:nil parameters:parameter getResult:^(NSDictionary *dict, NSError *error) {
//        Result *result = [NSDictionary reverseFromDictionaryToObject:dict withClass:[Result class]];
//        if ([dict objectForKey:@"status"] == [NSNumber numberWithInteger:0]) {
//            UserProperty *userProperty = [NSDictionary reverseFromDictionaryToObject:(NSDictionary *)[result value] withClass:[UserProperty class]];
//            [userProperty updateInToFile];
//        }
//        
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = result.msg;
//        //hud.margin = 20.f;
//        hud.removeFromSuperViewOnHide = YES;
//        [hud show:YES];
//        [hud hide:YES afterDelay:1.5];
//        [self performSelector:@selector(popDelayAction) withObject:nil afterDelay:1.0];
//    }];
    
    _lastBtn = btn;
}

- (void)popDelayAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if ([[NSString stringWithFormat:@"%@",@0] isEqualToString:@"0"]) {
        [self.boyBtn setSelected:YES];
        _lastBtn = _boyBtn;
    }else if([[NSString stringWithFormat:@"%@",@1] isEqualToString:@"1"]){
        [self.girlBtn setSelected:YES];
        _lastBtn = _girlBtn;
    }
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.view addSubview:self.boyBtn];
    [self.boyBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
        make.height.mas_equalTo(@45);
    }];
    
    [self.view addSubview:self.girlBtn];
    [self.girlBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.boyBtn.bottom).offset(2);
        make.height.mas_equalTo(@45);
    }];
}



- (UIButton *)boyBtn
{
    if (!_boyBtn) {
        _boyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_boyBtn setBackgroundColor:[UIColor whiteColor]];
        [_boyBtn setTitle:@"男" forState:UIControlStateNormal];
        _boyBtn.titleLabel.font = [UIFont fontWithName:FontName size:17];
        [_boyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_boyBtn setImage:[UIImage imageNamed:@"selected4"] forState:UIControlStateNormal];
        [_boyBtn setImage:[UIImage imageNamed:@"selected3"] forState:UIControlStateHighlighted];
        [_boyBtn setImage:[UIImage imageNamed:@"selected3"] forState:UIControlStateSelected];
        _boyBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -self.view.frame.size.width + 20);
        _boyBtn.titleEdgeInsets = UIEdgeInsetsMake(0, - self.view.frame.size.width + 20, 0, 0);
        
        _boyBtn.tag = 1;
        [_boyBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _boyBtn;
}

- (UIButton *)girlBtn
{
    if (!_girlBtn) {
        _girlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_girlBtn setBackgroundColor:[UIColor whiteColor]];
        [_girlBtn setTitle:@"女" forState:UIControlStateNormal];
        _girlBtn.titleLabel.font = [UIFont fontWithName:FontName size:17];
        [_girlBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_girlBtn setImage:[UIImage imageNamed:@"selected4"] forState:UIControlStateNormal];
        [_girlBtn setImage:[UIImage imageNamed:@"selected3"] forState:UIControlStateHighlighted];
        [_girlBtn setImage:[UIImage imageNamed:@"selected3"] forState:UIControlStateSelected];
        _girlBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -self.view.frame.size.width + 20);
        _girlBtn.titleEdgeInsets = UIEdgeInsetsMake(0, - self.view.frame.size.width + 20, 0, 0);
        
        _girlBtn.tag = 2;
        [_girlBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _girlBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
