//
//  UserTypeChoiceViewController.m
//  Sisley
//
//  Created by Philippe Tring on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "UserTypeChoiceViewController.h"
#import "SILoginViewController.h"
#import "MomLoginViewController.h"

@interface UserTypeChoiceViewController ()

@end

@implementation UserTypeChoiceViewController

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
- (IBAction)goToMom:(id)sender {
    // TO DO CHANGE TO MOM PART
    NSLog(@"yolo");
    MomLoginViewController *momVC = [[MomLoginViewController alloc] init];
    [self.navigationController pushViewController:momVC animated:YES];
//    [self.navigationController performSegueWithIdentifier:@"goMom" sender:nil];
}

- (IBAction)goToDaughter:(id)sender {
    // Link to navigation controller
    SILoginViewController *loginVC = [[SILoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

@end
