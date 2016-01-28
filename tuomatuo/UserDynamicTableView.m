//
//  UserDynamicTableView.m
//  tuomatuo
//
//  Created by xjk on 1/15/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#import "UserDynamicTableView.h"
#import "UIScrollView+EmptyDataSet.h"
#import "UserDynamicTableViewCell.h"

static NSString *userDynamicIdentifier = @"userDynamicIdentifier";

@interface UserDynamicTableView() <UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@end

@implementation UserDynamicTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        [self setup];
    }
    return self;
}

- (void)setup{
    [self registerClass:[UserDynamicTableViewCell class] forCellReuseIdentifier:userDynamicIdentifier];
    self.backgroundColor = RGB(239, 239, 239);
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = self;
    self.delegate = self;
    self.userDynamicEntities = [NSMutableArray array];
    
    [self reloadData];
}

@end
