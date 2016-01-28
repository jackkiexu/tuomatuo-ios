//
//  BaseTabBarViewController.m
//  tuomatuo
//
//  Created by xjk on 1/12/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "UserDynamicViewController.h"
#import "SearchViewController.h"
#import "PlusViewController.h"
#import "FriendViewController.h"
#import "MeViewController.h"

@interface BaseTabBarViewController() {
    UINavigationController *_userDynamicNC;
    UINavigationController *_searchNC;
    UINavigationController *_plusNC;
    UINavigationController *_friendNC;
    UINavigationController *_meNC;
    
}
@property (nonatomic) NSTimer *refreshUnreadCountTimer;
@end

@implementation BaseTabBarViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNoticeCount:) name:UpdateNoticeCount object:nil];
    
    self.delegate = self;
    self.view.backgroundColor = RGB(242, 242, 242);
    
    [self setUpTabBarItems];
    [self setUpTabBarStyle];
}

- (void)createRefreshUnreadCounterTimer{
    if (!self.refreshUnreadCountTimer) {
        self.refreshUnreadCountTimer = [NSTimer scheduledTimerWithTimeInterval:30.0 target:self selector:@selector(checkNoticeCount) userInfo:nil repeats:YES];
    }
}

- (void)updateNoticeCount:(NSNotification *)notification{
    
}

- (void)checkNoticeCount{
    
}

- (void)setUpTabBarStyle{
    // for shouldSelectViewController, enabling animation for tabbar item clicked
    [self setDelegate:self];
    
    // White background
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
}

- (void)setUpTabBarItems{
    UIEdgeInsets insets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    
    UserDynamicViewController *userDynamicVC = [[UserDynamicViewController alloc] init];
    _userDynamicNC = [[UINavigationController alloc] initWithRootViewController:userDynamicVC];
    UIImage *dynamicImg = [[UIImage imageNamed:@"dynamic"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _userDynamicNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"动态" image:dynamicImg selectedImage:dynamicImg];
    _userDynamicNC.tabBarItem.imageInsets = insets;
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    _searchNC = [[UINavigationController alloc] initWithRootViewController:searchVC];
    UIImage *searchImg = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _searchNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"搜索" image:searchImg selectedImage:searchImg];
    _searchNC.tabBarItem.imageInsets = insets;
    
    PlusViewController *plusVC = [[PlusViewController alloc] init];
    _plusNC = [[UINavigationController alloc] initWithRootViewController:plusVC];
    UIImage *plusImg = [[UIImage imageNamed:@"plus"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _plusNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:plusImg selectedImage:plusImg];
    _plusNC.tabBarItem.imageInsets = UIEdgeInsetsMake(6.0, 0.0, -6.0, 0.0);;
    
    
    FriendViewController *friendVC = [[FriendViewController alloc] init];
    _friendNC = [[UINavigationController alloc] initWithRootViewController:friendVC];
    UIImage *friendImg = [[UIImage imageNamed:@"friend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _friendNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"朋友" image:friendImg selectedImage:friendImg];
    _friendNC.tabBarItem.imageInsets = insets;
    
    MeViewController *meVC = [[MeViewController alloc] init];
    _meNC = [[UINavigationController alloc] initWithRootViewController:meVC];
    UIImage *ownImg = [[UIImage imageNamed:@"own"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _meNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:ownImg selectedImage:ownImg];
    _meNC.tabBarItem.imageInsets = insets;
    
    self.tabBar.backgroundColor = BGColor_Tabbar;
    
    NSArray *controllers = @[_userDynamicNC, _searchNC,_plusNC, _friendNC, _meNC];
    [self setViewControllers:controllers];
}

#pragma mark - Delegate - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [animation setDuration:0.25];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [self.view.window.layer addAnimation:animation forKey:@"fadeTransition"];
    return YES;
}

- (void)pushToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if([self.selectedViewController isKindOfClass:[UINavigationController class]]){
        UINavigationController *navigation = (UINavigationController *)self.selectedViewController;
        [navigation pushViewController:viewController animated:animated];
    }
}

- (void)presentToViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion{
    if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigation = (UINavigationController *)self.selectedViewController;
        [navigation presentViewController:viewController animated:animated completion:completion];
    }
}

@end
