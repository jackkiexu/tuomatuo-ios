//
//  UIImage+Extend.h
//  mhao
//
//  Created by Alex on 5/5/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)

+ (UIImage *)cutImage:(NSString *)imgName;
+ (NSData*)compressionImageWithImage:(UIImage *)curentImage;


@end
