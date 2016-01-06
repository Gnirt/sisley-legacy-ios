//
//  WelcomeProductSelectionViewController.m
//  Sisley
//
//  Created by Philippe Tring on 01/12/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "WelcomeProductSelectionViewController.h"
#import "MomSelectionViewController.h"
@interface WelcomeProductSelectionViewController ()

@end

@implementation WelcomeProductSelectionViewController

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
    MomSelectionViewController *MomSelection = [[MomSelectionViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:MomSelection animated:YES completion:nil];
}

@end
