//
//  MomAddDaughterViewController.h
//  Sisley
//
//  Created by Philippe Tring on 30/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomAddDaughterViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;

@end
