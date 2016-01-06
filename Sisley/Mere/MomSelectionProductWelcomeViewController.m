//
//  MomSelectionProductWelcomeViewController.m
//  Sisley
//
//  Created by Philippe Tring on 03/12/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "MomSelectionProductWelcomeViewController.h"
#import "MomSelectionProductViewController.h"
@interface MomSelectionProductWelcomeViewController ()

@end

@implementation MomSelectionProductWelcomeViewController

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
    MomSelectionProductViewController *MomSelectionProduct = [[MomSelectionProductViewController alloc] initWithNibName:nil bundle:nil];
    MomSelectionProduct.productTypeSelected = self.productTypeSelected;
    [self presentViewController:MomSelectionProduct animated:YES completion:nil];
}

@end
