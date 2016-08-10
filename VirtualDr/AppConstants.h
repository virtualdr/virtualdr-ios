//
//  Constants.h
//  KickRadius
//
//  Created by TL-01 on 4/09/2015.
//  Copyright (c) 2015 TL-01. All rights reserved.


#ifndef Constants_h
#define Constants_h


#define SetImage(image)                      [UIImage imageNamed:(image)]

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)
#define IS_IPADPro ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad && [UIScreen mainScreen].bounds.size.height == 1366)

#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
#define IS_IOS_6 floor(NSFoundationVersionNumber)<=NSFoundationVersionNumber_iOS_6_1

#endif
