//
//  MomSelectionProductPreviewViewController.m
//  Sisley
//
//  Created by Philippe Tring on 04/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import "MomSelectionProductPreviewViewController.h"
#import "MomSelectionProductEndViewController.h"

@interface MomSelectionProductPreviewViewController ()

@end

@implementation MomSelectionProductPreviewViewController

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
- (IBAction)changeAlpha:(id)sender {
    UIButton *button = (UIButton*)sender;
    if (button.alpha == 1) {
        button.alpha = 0.5;
        NSString *intString = self.cartCount.currentTitle;
        int value = [intString intValue] - 1;
        [self.cartCount setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
    } else {
        button.alpha = 1;
        NSString *intString = self.cartCount.currentTitle;
        int value = [intString intValue] + 1;
        [self.cartCount setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
    }
}

- (IBAction)goToNextScreen:(id)sender {
    MomSelectionProductEndViewController *MomSelectionProductEnd = [[MomSelectionProductEndViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:MomSelectionProductEnd animated:YES completion:nil];
}

@end
