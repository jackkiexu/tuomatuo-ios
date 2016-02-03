//
//  UIImage+Extend.m
//  mhao
//
//  Created by Alex on 5/5/15.
//  Copyright (c) 2015 ailami. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)cutImage:(NSString *)imgName
{
    UIImage* img=[UIImage imageNamed:imgName];
    UIEdgeInsets edge=UIEdgeInsetsMake(0, 10, 0,10);
    
    img = [img resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
    
    return img;
}

+ (NSData*)compressionImageWithImage:(UIImage *)curentImage
{
    NSData *data = UIImageJPEGRepresentation(curentImage, 1);
    
    if ([data length]/1024 >= 100) {
        //NSLog(@"init data:%ld",[data length]/1024);
        for (int i = 0; i < 10; i ++) {
            
            data = UIImageJPEGRepresentation([UIImage imageWithData:data], 0.3);
            //NSLog(@"for data:%ld",[data length]/1024);
            if ([data length]/1024 < 100) {
                //NSLog(@"compression2:%ld",[data length]/1024);
                return data;
            }
        }
        
    }
    //NSLog(@"compression1:%ld",[data length]/1024);
    return data;
}


@end
