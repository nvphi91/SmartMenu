//
//  FBGiveFeedbackViewController.m
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import "FBGiveFeedbackViewController.h"

@interface FBGiveFeedbackViewController ()

@end

@implementation FBGiveFeedbackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.title = NSLocalizedString(@"Give Feedback", nil);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        label.text = NSLocalizedString(@"Give Feedback", nil);
        [label sizeToFit];
        self.navigationItem.titleView = label;
        
        UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnBack setImage:[UIImage imageNamed:@"Image"] forState:UIControlStateNormal];
        btnBack.frame = CGRectMake(0, 0, 20, 20);
        btnBack.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [btnBack addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.giveFeedback_webView.delegate = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"feedbackstr" password:@"feedbackstr"];
    [manager GET:@"http://feedbackstr.savvycom.vn/get_link" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *link = responseObject[@"link"];
        
        NSURL *url = [[NSURL alloc] initWithString:link];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [self.giveFeedback_webView loadRequest:request];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) doBack{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:nil message:@"Enter your password" delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles: nil];
    [alert addButtonWithTitle:NSLocalizedString(@"Ok", nil)];
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    assert(textField);
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        UITextField *password = [alertView textFieldAtIndex:0];
        
        if ([password.text isEqualToString:PASSWORD]) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:nil message:NSLocalizedString(@"Password invalid!",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:NSLocalizedString(@"Ok", nil), nil];
            alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
            UITextField *textField = [alert textFieldAtIndex:0];
            assert(textField);
            textField.keyboardType = UIKeyboardTypeNumberPad;
            [alert show];
        }
    }
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGRect frame = self.view.frame;
    self.giveFeedback_webView.frame = frame;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        CGRect frame = self.view.frame;
        self.giveFeedback_webView.frame = frame;
    }
    else
    {
        CGRect frame = self.view.frame;
        self.giveFeedback_webView.frame = frame;
    }
}
@end
