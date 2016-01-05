//
//  SIFaceView.h
//  Sisley
//
//  Created by ZIIW on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIFaceItem.h"

@interface SIFaceView : UIView

@property (strong, nonatomic) SIFaceItem *face;

@property (strong, nonatomic) UIImage *imageFace;
@property (strong, nonatomic) CALayer *eyeRightAsset;
@property (strong, nonatomic) CALayer *eyeLeftAsset;
@property (strong, nonatomic) CALayer *lipAssetUp;
@property (strong, nonatomic) CALayer *lipAssetDown;

@property (nonatomic) CGSize imageSize;

@end
