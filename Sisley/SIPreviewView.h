//
//  SIPreviewView.h
//  Sisley
//
//  Created by ZIIW on 03/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVCaptureSession;

@interface SIPreviewView : UIView

@property (nonatomic) AVCaptureSession *session;

@end
