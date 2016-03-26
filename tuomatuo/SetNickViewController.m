//
//  SetNickViewController.m
//  tuomatuo
//
//  Created by xjk on 3/16/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "SetNickViewController.h"

@interface SetNickViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UIView *nickBgView;
@property (nonatomic,strong) UITextField *textField;

@end

@implementation SetNickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"昵称";
    self.textField.delegate = self;
    [self.textField becomeFirstResponder];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDone)];
    
}

- (void)rightBarButtonDone
{
//    if ([_textField.text isEqualToString:@""]) {
//        [self showHUDWithMsg:@"昵称不能为空"];
//        return;
//    }
//    
//    
//    NSDictionary *parameter = @{@"phoneVersion":Parameter_systemVersion,@"appversion":Parameter_appversion,@"mobile":USER_BEAN.loginName,@"sign":USER_BEAN.sign,@"nick":_textField.text,@"userSex":USER_PROPERTY.userSex ? [NSString stringWithFormat:@"%@",USER_PROPERTY.userSex] : @""};
//    
//    [HE uploadFileWithUrl:URL_userPropertyIconUpload withImageData:nil parameters:parameter getResult:^(NSDictionary *dict, NSError *error) {
//        NSLog(@"URL_userPropertyIconUpload:%@",dict);
//        Result *result = [NSDictionary reverseFromDictionaryToObject:dict withClass:[Result class]];
//        if (result && [[NSString stringWithFormat:@"%ld",result.status] isEqualToString:@"0"]) {
//            UserProperty *userProperty = [NSDictionary reverseFromDictionaryToObject:(NSDictionary *)[result value] withClass:[UserProperty class]];
//            [userProperty updateInToFile];
//            
//            [self performSelector:@selector(popDelayAction) withObject:nil afterDelay:1.5];
//        }
//        [self showHUDWithMsg:result.msg];
//    }];
    
}


- (void)popDelayAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    if ([NSString exist_emoji:string]) {
//        return NO;
//    }
    return YES;
}

- (void)textFieldDidChange:(UITextField *)textField
{
    NSInteger strLength = textField.text.length;
    NSInteger maxLength = 11;
    if (strLength > maxLength) {
        textField.text = [textField.text substringToIndex:maxLength];
    }
}








- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.view addSubview:self.nickBgView];
    [self.nickBgView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@45);
    }];
    
    [self.nickBgView addSubview:self.textField];
    [self.textField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickBgView).offset(17);
        make.right.equalTo(self.nickBgView);
        make.height.equalTo(self.nickBgView);
    }];
}


- (UIView *)nickBgView
{
    if (!_nickBgView) {
        _nickBgView = [UIView new];
        _nickBgView.backgroundColor = [UIColor whiteColor];
    }
    return _nickBgView;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.text = @"昵称";
        _textField.font = [UIFont fontWithName:FontName size:17];
        _textField.textColor = FTColor_Black_1;
        _textField.placeholder = @"未设置";
        _textField.clearButtonMode = UITextFieldViewModeAlways;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return _textField;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
