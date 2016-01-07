//
//  SIHomeViewController.m
//  Sisley
//
//  Created by ZIIW on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "SIHomeViewController.h"
#import "CameraViewController.h"
#import "BumpViewController.h"

@interface SIHomeViewController ()

@end

@implementation SIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.nameMotherLabel setFont:[UIFont fontWithName:@"didot" size:28]];
    [self.motherSubLabel setFont:[UIFont fontWithName:@"Montserrat-Light" size:12]];
    
    self.bump = YES;
    if(self.bump){
        self.overlay.alpha = 1.0f;
        self.bumpImageView.alpha = 1.0f;
        self.titleView.alpha = 0.0f;
        self.textOneLabel.alpha = 0.0f;
        [self.textTwoLabel setText:@"Merci d’avoir testé les produits ! \nBump ton téléphone avec celui de ta mère pour continuer l’expérience."];
        
        [self.homeLinkImage setImage:[UIImage imageNamed:@"home-link-2"]];
        [self.btnNext setImage:[UIImage imageNamed:@"home-bump"] forState:UIControlStateNormal];
    }
}

- (IBAction)validTuto:(id)sender {
    [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlay.alpha = 0.0f;
                     }
                     completion:nil];
}
- (IBAction)btnNext:(id)sender {
    if(!self.bump){
        // Go to cam
        CameraViewController *camVC = [self.storyboard instantiateViewControllerWithIdentifier:@"cameraVC"];
        [self.navigationController pushViewController:camVC animated:YES];
        
    }else{
        // Go to bump
        BumpViewController *bumpVC = [self.storyboard instantiateViewControllerWithIdentifier:@"bumpVC"];
        [self.navigationController pushViewController:bumpVC animated:YES];
    }
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

@end
