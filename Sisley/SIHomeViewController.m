//
//  SIHomeViewController.m
//  Sisley
//
//  Created by ZIIW on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "SIHomeViewController.h"

@interface SIHomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameMotherLabel;
@property (weak, nonatomic) IBOutlet UILabel *motherSubLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameKidLabel;
@property (weak, nonatomic) IBOutlet UILabel *kidSubLabel;
@property (weak, nonatomic) IBOutlet UIView *overlay;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *textOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *textTwoLabel;

@end

@implementation SIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.nameMotherLabel setFont:[UIFont fontWithName:@"didot" size:28]];
    [self.motherSubLabel setFont:[UIFont fontWithName:@"Montserrat-Light" size:12]];
}

- (IBAction)validTuto:(id)sender {
    [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlay.alpha = 0.0f;
                     }
                     completion:nil];
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
