//
//  DaughterHairPickViewController.m
//  Sisley
//
//  Created by Philippe Tring on 30/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "DaughterHairPickViewController.h"
#import "DaughterComplexionPickerViewController.h"
@interface DaughterHairPickViewController ()

@end

@implementation DaughterHairPickViewController

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
- (IBAction)goToComplexionPick:(id)sender {
    DaughterComplexionPickerViewController *DaughterComplexion = [[DaughterComplexionPickerViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:DaughterComplexion animated:YES completion:nil];
}

@end
