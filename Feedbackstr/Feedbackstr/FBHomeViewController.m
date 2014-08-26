//
//  FBHomeViewController.m
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import "FBHomeViewController.h"

@interface FBHomeViewController ()

@end

@implementation FBHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.btn_show setTitle:NSLocalizedString(@"Show Menu", nil) forState:UIControlStateNormal];
    self.btn_show.backgroundColor = [FBConfig colorFromRGB:0xd14125];
    self.btn_show.layer.cornerRadius = 5;
    
    [self.btn_feebback setTitle:NSLocalizedString(@"Give Feedback", nil) forState:UIControlStateNormal];
    self.btn_feebback.backgroundColor = [FBConfig colorFromRGB:0x6ca6c9];
    self.btn_feebback.layer.cornerRadius = 5;

}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    UIInterfaceOrientation statusBarOrientation =[UIApplication sharedApplication].statusBarOrientation;
        if(statusBarOrientation == UIInterfaceOrientationLandscapeLeft ||statusBarOrientation == UIInterfaceOrientationLandscapeRight){
            self.logoImageView.center = CGPointMake(self.view.frame.size.width/2, 200);
            self.btn_show.center = CGPointMake(self.view.frame.size.width/2, 450);
            self.btn_feebback.center = CGPointMake(self.view.frame.size.width/2, 500);
            CGRect frame = self.view.frame;
            UIImage *imageBg = [UIImage imageNamed:@"bgLandscape.jpg"];
            self.homeBg.image = imageBg;
            self.homeBg.frame = frame;
        }
        else
        {
            CGRect frame = self.view.frame;
            UIImage *imageBg = [UIImage imageNamed:@"bgFortrait.jpg"];
            self.homeBg.image = imageBg;
            self.homeBg.frame = frame;
            self.logoImageView.center = CGPointMake(self.view.frame.size.width/2, 200);
            self.btn_show.center = CGPointMake(self.view.frame.size.width/2, 450);
            self.btn_feebback.center = CGPointMake(self.view.frame.size.width/2, 500);
        }
}

- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.logoImageView.center = CGPointMake(self.view.frame.size.width/2, 200);
        self.btn_show.center = CGPointMake(self.view.frame.size.width/2, 450);
        self.btn_feebback.center = CGPointMake(self.view.frame.size.width/2, 500);
        CGRect frame = self.view.frame;
        UIImage *imageBg = [UIImage imageNamed:@"bgLandscape.jpg"];
        self.homeBg.image = imageBg;
        self.homeBg.frame = frame;
    }
    else
    {
        self.logoImageView.center = CGPointMake(self.view.frame.size.width/2, 200);
        self.btn_show.center = CGPointMake(self.view.frame.size.width/2, 450);
        self.btn_feebback.center = CGPointMake(self.view.frame.size.width/2, 500);
        CGRect frame = self.view.frame;
        UIImage *imageBg = [UIImage imageNamed:@"bgFortrait.jpg"];
        self.homeBg.image = imageBg;
        self.homeBg.frame = frame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu:(id)sender {
    FBShowMenuViewController *showViewController = [[FBShowMenuViewController alloc] init];
    [self.navigationController pushViewController:showViewController animated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (IBAction)giveFeedback:(id)sender {
    FBGiveFeedbackViewController *feedbackViewController = [[FBGiveFeedbackViewController alloc] init];
    [self.navigationController pushViewController:feedbackViewController animated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
@end
