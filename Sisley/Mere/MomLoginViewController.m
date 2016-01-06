//
//  MomLoginViewController.m
//  Sisley
//
//  Created by Philippe Tring on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "MomLoginViewController.h"
#import "MomRegistrationViewController.h"
#import "Parse/Parse.h"
#import "MomHomeViewController.h"

@interface MomLoginViewController ()

@end

@implementation MomLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.emailTextField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Adresse email" attributes:@{NSForegroundColorAttributeName: color}];
        self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Mot de passe" attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    self.passwordTextField.delegate = self;
    self.emailTextField.delegate = self;
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

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.passwordTextField) {
        [theTextField resignFirstResponder];
    } else if (theTextField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    return YES;
}

- (IBAction)login:(id)sender {
    [PFUser logInWithUsernameInBackground:self.emailTextField.text password:self.passwordTextField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            MomHomeViewController *MomHome = [[MomHomeViewController alloc] initWithNibName:nil bundle:nil];
                                            [self presentViewController:MomHome animated:YES completion:nil];
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSString *errorString = [error userInfo][@"error"];
                                            NSLog(@"%@", errorString);
                                        }
                                    }];
}

- (IBAction)goToRegistration:(id)sender {
    MomRegistrationViewController *MomRegistration = [[MomRegistrationViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:MomRegistration animated:YES completion:nil];
}

@end
