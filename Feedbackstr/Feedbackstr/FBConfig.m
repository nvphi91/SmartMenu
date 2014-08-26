//
//  FBConfig.m
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import "FBConfig.h"

@implementation FBConfig
+ (UIColor *)colorFromRGB:(long)rgbValue {
    return [self colorFromRGB:rgbValue alpha:1.0];
}
+ (UIColor *)colorFromRGB:(long)rgbValue alpha:(float)alpha {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0
                            blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpha];
}
@end
