//
//  FBShowMenuViewController.m
//  Feedbackstr
//
//  Created by Nguyen Van Phi on 8/6/14.
//  Copyright (c) 2014 Nguyen Van Phi. All rights reserved.
//

#import "FBShowMenuViewController.h"

@interface FBShowMenuViewController ()

@end

@implementation FBShowMenuViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.title = NSLocalizedString(@"Show Menu", nil);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor redColor];
        label.text = NSLocalizedString(@"Show Menu", nil);
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
    self.show_Webview.delegate = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"feedbackstr" password:@"feedbackstr"];
    [manager GET:@"http://feedbackstr.savvycom.vn/get_menu" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        [self.show_Webview loadHTMLString:string baseURL:nil];
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
   UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:nil message:NSLocalizedString(@"Enter your password!",nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:NSLocalizedString(@"Ok", nil), nil];
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
    self.show_Webview.frame = frame;
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
        self.show_Webview.frame = frame;
    }
    else
    {
        CGRect frame = self.view.frame;
        self.show_Webview.frame = frame;
    }
}
@end
