//
//  MomRegistrationViewController.m
//  Sisley
//
//  Created by Philippe Tring on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "MomRegistrationViewController.h"
#import "WelcomeMomViewController.h"
#import "Parse/Parse.h"
@interface MomRegistrationViewController ()

@end

@implementation MomRegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.emailTextField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Adresse email" attributes:@{NSForegroundColorAttributeName: color}];
        self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Mot de passe" attributes:@{NSForegroundColorAttributeName: color}];
        self.lastnameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Nom" attributes:@{NSForegroundColorAttributeName: color}];
        self.firstnameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Prénom" attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    self.emailTextField.delegate = self;
    self.firstnameTextField.delegate = self;
    self.lastnameTextField.delegate = self;
    self.passwordTextField.delegate = self;

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.firstnameTextField) {
        [self.lastnameTextField becomeFirstResponder];
    }
    else if (textField == self.lastnameTextField) {
        [self.emailTextField becomeFirstResponder];
    }
    else if (textField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    else if (textField == self.passwordTextField) {
        [self.passwordTextField resignFirstResponder];
        [self registrationMom:nil];
    }
    return true;
}

- (IBAction)registrationMom:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.emailTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;
    
    // other fields can be set just like with PFObject
    user[@"user_type"] = @"mom";
    user[@"firstname"] = self.firstnameTextField.text;
    user[@"lastname"] = self.lastnameTextField.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            WelcomeMomViewController *WelcomeMom = [[WelcomeMomViewController alloc] initWithNibName:nil bundle:nil];
            [self presentViewController:WelcomeMom animated:YES completion:nil];
            
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@", errorString);
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

#define kOFFSET_FOR_KEYBOARD 140.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:self.emailTextField] || [sender isEqual:self.passwordTextField] || [sender isEqual:self.emailTextField])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y = rect.origin.y - kOFFSET_FOR_KEYBOARD;
        rect.size.height = rect.size.height + kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y = rect.origin.y + kOFFSET_FOR_KEYBOARD;
        rect.size.height = rect.size.height - kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

@end
