//
//  FBTheme.m
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import "FBTheme.h"
#import "FBConfig.h"
@implementation FBTheme
+ (UIColor *)mainTheme{
    return [UIColor redColor];
}
+ (UIColor *)mainImage{
    return [UIColor whiteColor];
}
+ (UIColor *)mainText{
    return [UIColor whiteColor];
}
+ (UIColor *)mainNavigation{
    return [FBConfig colorFromRGB:0xf1f1f1];
}
@end
