//
//  SIFaceViewController.h
//  Sisley
//
//  Created by ZIIW on 04/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIFaceView.h"

@interface SIFaceViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *OverlayTextOne;
@property (weak, nonatomic) IBOutlet UILabel *overlayTextTwo;
@property (weak, nonatomic) IBOutlet UIView *overlayView;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet SIFaceView *faceView;

@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSDictionary *faceData;
@property (strong, nonatomic) UIColor *strokeColor;

@property (strong, nonatomic) CALayer *draggedItem;

@property (weak, nonatomic) IBOutlet UIView *switchProductView;
@property (weak, nonatomic) IBOutlet UIButton *levreBtn;
@property (weak, nonatomic) IBOutlet UIButton *yeuxBtn;
@property (weak, nonatomic) IBOutlet UIButton *prevBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *crossOverlay;
@property (weak, nonatomic) IBOutlet UIButton *checkOverlay;
@property (weak, nonatomic) IBOutlet UIButton *closeOverlay;
@property (weak, nonatomic) IBOutlet UIButton *validBtn;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;

@end
