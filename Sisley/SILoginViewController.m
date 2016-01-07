//
//  SILoginViewController.m
//  Sisley
//
//  Created by ZIIW on 11/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "SILoginViewController.h"
#import "Parse/Parse.h"

@interface SILoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *mdpText;

@end

@implementation SILoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loginAction:(id)sender {
//    [PFUser logInWithUsernameInBackground:self.emailText.text password:self.mdpText.text
//                                    block:^(PFUser *user, NSError *error) {
//                                        if (user) {
//                                            NSLog(@"%@", user.);
//                                        } else {
//                                            // The login failed. Check error to see why.
//                                            NSString *errorString = [error userInfo][@"error"];
//                                            NSLog(@"%@", errorString);
//                                        }
//                                    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
