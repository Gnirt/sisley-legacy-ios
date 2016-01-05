//
//  SIEye.h
//  Sisley
//
//  Created by ZIIW on 10/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SIFaceItem.h"

@interface SIEye : SIFaceItem

@property (nonatomic) CGPoint cornerLeft;
@property (nonatomic) CGPoint center;
@property (nonatomic) CGPoint cornerRight;
@property (nonatomic) CGPoint browLeft;
@property (nonatomic) CGPoint browMiddle;
@property (nonatomic) CGPoint browRight;
@property (nonatomic) BOOL isLeft;

@end
