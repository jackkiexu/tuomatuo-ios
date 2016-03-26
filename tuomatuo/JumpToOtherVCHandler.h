//
//  JumpToOtherVCHandler.h
//  tuomatuo
//
//  Created by xjk on 3/15/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JumpToOtherVCHandler : NSObject
+ (UIViewController *)getTabbarViewController;
+ (void)pushToOtherView:(UIViewController *)vc animated:(BOOL)animated;
+ (void)presentToOtherView:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion;
//+ (void)jumpToTopicDetailWithTopic:(TopicEntity *)topic;
+ (void)jumpToLoginVC:(void (^)(void))completion;
+ (void)jumpToTopicDetailWithTopicId:(NSNumber *)topicId;
+ (void)jumpToUserProfileWithUserId:(NSNumber *)userId;
//+ (void)jumpToCommentListVCWithTopic:(TopicEntity *)topic;
+ (void)jumpToWebVCWithUrlString:(NSString *)url;
@end
