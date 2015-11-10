//
//  SIFace.h
//  Sisley
//
//  Created by ZIIW on 09/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIFace : NSObject

@property (nonatomic) NSMutableArray *array;

// Left Eye
@property (nonatomic) float leftEyeCornerLeftX;
@property (nonatomic) float leftEyeCornerLeftY;

@property (nonatomic) float leftEyeCenterX;
@property (nonatomic) float leftEyeCenterY;

@property (nonatomic) float leftEyeCornerRightX;
@property (nonatomic) float leftEyeCornerRightY;

@property (nonatomic) float leftEyeBrowLeftX;
@property (nonatomic) float leftEyeBrowLeftY;

@property (nonatomic) float leftEyeBrowMiddleX;
@property (nonatomic) float leftEyeBrowMiddleY;

@property (nonatomic) float leftEyeBrowRightX;
@property (nonatomic) float leftEyeBrowRightY;



// Nose btw Eye
@property (nonatomic) float noseBtwEyesX;
@property (nonatomic) float noseBtwEyesY;



// Right Eye

@property (nonatomic) float rightEyeCornerLeftX;
@property (nonatomic) float rightEyeCornerLeftY;

@property (nonatomic) float rightEyeCenterX;
@property (nonatomic) float rightEyeCenterY;

@property (nonatomic) float rightEyeCornerRightX;
@property (nonatomic) float rightEyeCornerRightY;

@property (nonatomic) float rightEyeBrowLeftX;
@property (nonatomic) float rightEyeBrowLeftY;

@property (nonatomic) float rightEyeBrowMiddleX;
@property (nonatomic) float rightEyeBrowMiddleY;

@property (nonatomic) float rightEyeBrowRightX;
@property (nonatomic) float rightEyeBrowRightY;


// Lip

@property (nonatomic) float lipCornerLeftX;
@property (nonatomic) float lipCornerLeftY;

@property (nonatomic) float lipLineMiddleX;
@property (nonatomic) float lipLineMiddleY;

@property (nonatomic) float lipCornerRightX;
@property (nonatomic) float lipCornerRightY;



-(id)initWithDictionary:(NSDictionary *)json_dictionary;

@end
