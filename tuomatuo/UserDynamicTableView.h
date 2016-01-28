//
//  UserDynamicTableView.h
//  tuomatuo
//
//  Created by xjk on 1/15/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserDynamicTableViewDelegate <NSObject>
- (void)headerRefreshing;
- (void)footerRefreshing;
@end

@interface UserDynamicTableView : UITableView
@property (nonatomic, assign) BOOL shouldRemoveHeaderView;
@property (nonatomic, strong) NSMutableArray *userDynamicEntities;
@property (nonatomic, strong) id<UserDynamicTableViewDelegate> useDynamicTableViewDelegate;
- (void)setupFooterView;
@end
