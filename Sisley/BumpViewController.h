//
//  BumpViewController.h
//  Sisley
//
//  Created by ZIIW on 06/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface BumpViewController : UIViewController <MCBrowserViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIView *overlay;

@end
