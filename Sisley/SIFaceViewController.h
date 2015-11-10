//
//  SIFaceViewController.h
//  Sisley
//
//  Created by ZIIW on 04/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIFaceViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UIImageView *pointImageView;

@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSDictionary *faceData;

@end
