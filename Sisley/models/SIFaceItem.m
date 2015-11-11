//
//  SIFace.m
//  Sisley
//
//  Created by ZIIW on 09/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "SIFaceItem.h"
#import "SIEye.h"
#import "SILip.h"
#import "SINose.h"

@implementation SIFaceItem

-(id)initWithDictionary:(NSDictionary *)json_dictionary
{
    
    // Left eye
    SIEye *eyeLeft = [[SIEye alloc] init];
    eyeLeft.cornerLeft = CGPointMake([json_dictionary[@"leftEyeCornerLeftX"] floatValue], [json_dictionary[@"leftEyeCornerLeftY"] floatValue]);
    eyeLeft.center = CGPointMake([json_dictionary[@"leftEyeCenterX"] floatValue], [json_dictionary[@"leftEyeCenterY"] floatValue]);
    eyeLeft.cornerRight = CGPointMake([json_dictionary[@"leftEyeCornerRightX"] floatValue], [json_dictionary[@"leftEyeCornerRightY"] floatValue]);
    eyeLeft.browLeft = CGPointMake([json_dictionary[@"leftEyeBrowLeftX"] floatValue], [json_dictionary[@"leftEyeBrowLeftY"] floatValue]);
    eyeLeft.browMiddle = CGPointMake([json_dictionary[@"leftEyeBrowMiddleX"] floatValue], [json_dictionary[@"leftEyeBrowMiddleY"] floatValue]);
    eyeLeft.browRight = CGPointMake([json_dictionary[@"leftEyeBrowRightX"] floatValue], [json_dictionary[@"leftEyeBrowRightY"] floatValue]);
    
    // Right eye
    SIEye *eyeRight = [[SIEye alloc] init];
    eyeRight.cornerLeft = CGPointMake([json_dictionary[@"rightEyeCornerLeftX"] floatValue], [json_dictionary[@"rightEyeCornerLeftY"] floatValue]);
    eyeRight.center = CGPointMake([json_dictionary[@"rightEyeCenterX"] floatValue], [json_dictionary[@"rightEyeCenterY"] floatValue]);
    eyeRight.cornerRight = CGPointMake([json_dictionary[@"rightEyeCornerRightX"] floatValue], [json_dictionary[@"rightEyeCornerRightY"] floatValue]);
    eyeRight.browLeft = CGPointMake([json_dictionary[@"rightEyeBrowLeftX"] floatValue], [json_dictionary[@"rightEyeBrowLeftY"] floatValue]);
    eyeRight.browMiddle = CGPointMake([json_dictionary[@"rightEyeBrowMiddleX"] floatValue], [json_dictionary[@"rightEyeBrowMiddleY"] floatValue]);
    eyeRight.browRight = CGPointMake([json_dictionary[@"rightEyeBrowRightX"] floatValue], [json_dictionary[@"rightEyeBrowRightY"] floatValue]);
    
    // Nose
    SINose *nose = [[SINose alloc] init];
    nose.btwEyes = CGPointMake([json_dictionary[@"noseBtwEyesX"] floatValue], [json_dictionary[@"noseBtwEyesY"] floatValue]);
    
    // Lip
    SILip *lip = [[SILip alloc] init];
    lip.cornerLeft = CGPointMake([json_dictionary[@"lipCornerLeftX"] floatValue], [json_dictionary[@"lipCornerLeftY"] floatValue]);
    lip.lineMiddle = CGPointMake([json_dictionary[@"lipLineMiddleX"] floatValue], [json_dictionary[@"lipLineMiddleY"] floatValue]);
    lip.cornerRight = CGPointMake([json_dictionary[@"lipCornerRightX"] floatValue], [json_dictionary[@"lipCornerRightY"] floatValue]);
    
    // Remplir le NSArray
    self.faceItems = [NSArray arrayWithObjects: eyeLeft, eyeRight, nose, lip, nil];
    
    return self;
}

@end

