//
//  JumpToOtherVCHandler.m
//  tuomatuo
//
//  Created by xjk on 3/15/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "JumpToOtherVCHandler.h"
#import "BaseTabBarViewController.h"
#import "AppDelegate.h"

@implementation JumpToOtherVCHandler


+ (UIViewController *)getTabbarViewController {
    BaseTabBarViewController *tabbar = [(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarViewController];
    return tabbar;
}

+ (void)pushToOtherView:(UIViewController *)vc animated:(BOOL)animated {
    BaseTabBarViewController *tabbar = [(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarViewController];
    [tabbar pushToViewController:vc animated:YES];
}

+ (void)presentToOtherView:(UIViewController *)vc animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    BaseTabBarViewController *tabbar = [(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    [tabbar presentViewController:navigationController animated:animated completion:completion];
}

//+ (void)jumpToTopicDetailWithTopic:(TopicEntity *)topic {
//    TopicDetailViewController *topicDetailVC = [[UIStoryboard storyboardWithName:@"Topic" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"topic"];
//    topicDetailVC.topic = topic;
//    [self pushToOtherView:topicDetailVC animated:YES];
//}

//+ (void)jumpToTopicDetailWithTopicId:(NSNumber *)topicId {
//    TopicDetailViewController *topicDetailVC = [[UIStoryboard storyboardWithName:@"Topic" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"topic"];
//    TopicEntity *topic = [TopicEntity new];
//    topic.topicId = topicId;
//    topicDetailVC.topic = topic;
//    [self pushToOtherView:topicDetailVC animated:YES];
//}

//+ (void)jumpToUserProfileWithUserId:(NSNumber *)userId {
//    UserProfileViewController *userProfileVC = [[UIStoryboard storyboardWithName:@"UserProfile"
//                                                                          bundle:[NSBundle mainBundle]]
//                                                instantiateViewControllerWithIdentifier:@"userprofile"];
//    UserEntity *user = [UserEntity new];
//    user.userId = userId;
//    userProfileVC.userEntity = user;
//    [self pushToOtherView:userProfileVC animated:YES];
//}

//+ (void)jumpToCommentListVCWithTopic:(TopicEntity *)topic {
//    CommentListViewController *commentListVC = [[CommentListViewController alloc] init];
//    commentListVC.hidesBottomBarWhenPushed = YES;
//    commentListVC.topic = topic;
//    [self pushToOtherView:commentListVC animated:YES];
//}

//+ (void)jumpToWebVCWithUrlString:(NSString *)url {
//    TOWebViewController *webVC = [[TOWebViewController alloc] initWithURLString:url];
//    webVC.hidesBottomBarWhenPushed = YES;
//    [self pushToOtherView:webVC animated:YES];
//}
//
//+ (void)jumpToLoginVC:(void (^)(void))completion {
//    LoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"Passport"
//                                                              bundle:[NSBundle mainBundle]]
//                                    instantiateViewControllerWithIdentifier:@"login"];
//    loginVC.completeLoginBlock = completion;
//    [self presentToOtherView:loginVC animated:YES completion:nil];
//}

@end
