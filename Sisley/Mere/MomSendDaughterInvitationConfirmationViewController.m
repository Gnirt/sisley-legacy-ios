//
//  MomSendDaughterInvitationConfirmationViewController.m
//  Sisley
//
//  Created by Philippe Tring on 05/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import "MomSendDaughterInvitationConfirmationViewController.h"
#import "MomPostSendInvitationViewController.h"

@interface MomSendDaughterInvitationConfirmationViewController ()

@end

@implementation MomSendDaughterInvitationConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)goToNextScreen:(id)sender {
    MomPostSendInvitationViewController *MomPostSendInvitation = [[MomPostSendInvitationViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:MomPostSendInvitation animated:YES completion:nil];
}

@end
