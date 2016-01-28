//
//  BaseTabBarViewController.h
//  tuomatuo
//
//  Created by xjk on 1/12/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarViewController : UITabBarController<UITabBarControllerDelegate>

- (void)setUpTabBarItems;
- (void)pushToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)presentToViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion;

@end
