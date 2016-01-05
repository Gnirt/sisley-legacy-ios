//
//  TutoViewController.m
//  Sisley
//
//  Created by Philippe Tring on 09/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "TutoViewController.h"

@interface TutoViewController ()

@end

@implementation TutoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    NSArray *textArray = [NSArray arrayWithObjects:
                          @"Sisley prône les valeurs familiales.\n\nHéritage by Sisley a été conçu spécialement pour vous permettre d’initier un moment de partage privilégié entre mère et fille.",
                          @"En tant que mère, vous allez pouvoir pré-sélectionner les produits que vous souhaitez faire tester à votre fille.",
                          @"En tant que fille, tu vas pouvoir tester virtuellement ces produits et sélectionner ceux qui te plaisent.",
                          @"Enfin, vous vous accorderez et validerez ensemble les produits qui conviennent le mieux.",
                          @"Je veux initier ma fille au maquillage\n\n\n\nJe veux être initiée par ma mère",
                          nil];
    
    self.screenText.text = [textArray objectAtIndex:self.index];
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
