//
//  MeViewController.m
//  tuomatuo
//
//  Created by xjk on 1/17/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "MeViewController.h"

@implementation MeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"我";
    
    NSLog(@"MeViewController");
    
    [self.tabBarItem setSelectedImage:[UIImage imageNamed:@"own"]];
    [self.tabBarItem setImage:[UIImage imageNamed:@"own"]];
}

@end
