//
//  SIFace.m
//  Sisley
//
//  Created by ZIIW on 09/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "SIFace.h"

@implementation SIFace

-(id)initWithDictionary:(NSDictionary *)json_dictionary
{
    
    self.leftEyeCornerLeftX = [json_dictionary[@"leftEyeCornerLeftX"] floatValue];
    self.leftEyeCornerLeftY = [json_dictionary[@"leftEyeCornerLeftY"] floatValue];
    
    self.leftEyeCenterX = [json_dictionary[@"leftEyeCenterX"] floatValue];
    self.leftEyeCenterY = [json_dictionary[@"leftEyeCenterY"] floatValue];
    
    self.leftEyeCornerRightX = [json_dictionary[@"leftEyeCornerRightX"] floatValue];
    self.leftEyeCornerRightY = [json_dictionary[@"leftEyeCornerRightY"] floatValue];
    
    self.leftEyeBrowLeftX = [json_dictionary[@"leftEyeBrowLeftX"] floatValue];
    self.leftEyeBrowLeftY = [json_dictionary[@"leftEyeBrowLeftY"] floatValue];
    
    self.leftEyeBrowMiddleX = [json_dictionary[@"leftEyeBrowMiddleX"] floatValue];
    self.leftEyeBrowMiddleY = [json_dictionary[@"leftEyeBrowMiddleY"] floatValue];
    
    self.leftEyeBrowRightX = [json_dictionary[@"leftEyeBrowRightX"] floatValue];
    self.leftEyeBrowRightY = [json_dictionary[@"leftEyeBrowRightY"] floatValue];
    
    self.noseBtwEyesX = [json_dictionary[@"noseBtwEyesX"] floatValue];
    self.noseBtwEyesY = [json_dictionary[@"noseBtwEyesY"] floatValue];
    
    self.rightEyeCornerLeftX = [json_dictionary[@"rightEyeCornerLeftX"] floatValue];
    self.rightEyeCornerLeftY = [json_dictionary[@"rightEyeCornerLeftY"] floatValue];
    
    self.rightEyeCenterX = [json_dictionary[@"rightEyeCenterX"] floatValue];
    self.rightEyeCenterY = [json_dictionary[@"rightEyeCenterY"] floatValue];
    
    self.rightEyeCornerRightX = [json_dictionary[@"rightEyeCornerRightX"] floatValue];
    self.rightEyeCornerRightY = [json_dictionary[@"rightEyeCornerRightY"] floatValue];
    
    self.rightEyeBrowLeftX = [json_dictionary[@"rightEyeBrowLeftX"] floatValue];
    self.rightEyeBrowLeftY = [json_dictionary[@"rightEyeBrowLeftY"] floatValue];
    
    self.rightEyeBrowMiddleX = [json_dictionary[@"rightEyeBrowMiddleX"] floatValue];
    self.rightEyeBrowMiddleY = [json_dictionary[@"rightEyeBrowMiddleY"] floatValue];
    
    self.rightEyeBrowRightX = [json_dictionary[@"rightEyeBrowRightX"] floatValue];
    self.rightEyeBrowRightY = [json_dictionary[@"rightEyeBrowRightY"] floatValue];
    
    self.lipCornerLeftX = [json_dictionary[@"lipCornerLeftX"] floatValue];
    self.lipCornerLeftY = [json_dictionary[@"lipCornerLeftY"] floatValue];
    
    self.lipLineMiddleX = [json_dictionary[@"lipLineMiddleX"] floatValue];
    self.lipLineMiddleY = [json_dictionary[@"lipLineMiddleY"] floatValue];
    
    self.lipCornerRightX = [json_dictionary[@"lipCornerRightX"] floatValue];
    self.lipCornerRightY = [json_dictionary[@"lipCornerRightY"] floatValue];
    
    return self;
}

@end

