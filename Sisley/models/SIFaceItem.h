//
//  SIFace.h
//  Sisley
//
//  Created by ZIIW on 09/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIFaceItem : NSObject

@property (nonatomic) NSArray *faceItems;

// property global a tout les subclass

-(id)initWithDictionary:(NSDictionary *)json_dictionary;

@end
