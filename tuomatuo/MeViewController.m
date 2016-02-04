//
//  MeViewController.m
//  tuomatuo
//
//  Created by xjk on 1/17/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController()

@property (nonatomic, strong) UIButton *uImageBtn;
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
}

- (void)layoutSubViews{
    
}

@end
