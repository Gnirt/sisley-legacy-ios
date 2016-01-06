//
//  MomSelectionProductEndViewController.m
//  Sisley
//
//  Created by Philippe Tring on 04/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import "MomSelectionProductEndViewController.h"
#import "MomSendDaughterInvitationViewController.h"

@interface MomSelectionProductEndViewController ()

@end

@implementation MomSelectionProductEndViewController

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
    MomSendDaughterInvitationViewController *MomSendDaughterInvitation = [[MomSendDaughterInvitationViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:MomSendDaughterInvitation animated:YES completion:nil];
}

@end
