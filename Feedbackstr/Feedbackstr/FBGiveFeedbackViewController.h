//
//  FBGiveFeedbackViewController.h
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConstants.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
@interface FBGiveFeedbackViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *giveFeedback_webView;

@end
