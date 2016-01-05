//
//  MomRegistrationViewController.h
//  Sisley
//
//  Created by Philippe Tring on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomRegistrationViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end
