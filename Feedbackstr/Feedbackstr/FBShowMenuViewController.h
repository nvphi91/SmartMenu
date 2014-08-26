//
//  FBShowMenuViewController.h
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConstants.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
@interface FBShowMenuViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *show_Webview;
@property (weak, nonatomic) IBOutlet UIImageView *test;

@end



