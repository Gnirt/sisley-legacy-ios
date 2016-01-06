//
//  MomHomeViewController.m
//  Sisley
//
//  Created by Philippe Tring on 30/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "MomHomeViewController.h"
#import "JumelerWelcomeViewController.h"

@interface MomHomeViewController ()

@end

@implementation MomHomeViewController

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
    JumelerWelcomeViewController *JumelerWelcome = [[JumelerWelcomeViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:JumelerWelcome animated:YES completion:nil];
}

@end
