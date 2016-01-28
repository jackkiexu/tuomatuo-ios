//
//  Header.h
//  tuomatuo
//
//  Created by xjk on 1/11/16.
//  Copyright © 2016 tuomatuo. All rights reserved.
//

#ifndef Header_h
#define Header_h

#if DEBUG
#define APIBaseURL                           @"https://api.phphub.org/v1"
#else
#define APIBaseURL                           @"https://api.phphub.org/v1"
#endif

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#endif /* Header_h */
