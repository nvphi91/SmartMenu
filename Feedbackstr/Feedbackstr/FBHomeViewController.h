//
//  FBHomeViewController.h
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConfig.h"
#import "FBGiveFeedbackViewController.h"
#import "FBShowMenuViewController.h"
@interface FBHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_feebback;
@property (weak, nonatomic) IBOutlet UIButton *btn_show;
- (IBAction)showMenu:(id)sender;
- (IBAction)giveFeedback:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *homeBg;

@end
