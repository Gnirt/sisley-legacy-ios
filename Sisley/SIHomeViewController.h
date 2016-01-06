//
//  SIHomeViewController.h
//  Sisley
//
//  Created by ZIIW on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameMotherLabel;
@property (weak, nonatomic) IBOutlet UILabel *motherSubLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameKidLabel;
@property (weak, nonatomic) IBOutlet UILabel *kidSubLabel;
@property (weak, nonatomic) IBOutlet UIView *overlay;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *textOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *textTwoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bumpImageView;

@property (weak, nonatomic) IBOutlet UIImageView *homeLinkImage;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (nonatomic) BOOL bump;

@end
