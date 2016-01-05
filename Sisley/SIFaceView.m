//
//  SIFaceView.m
//  Sisley
//
//  Created by ZIIW on 12/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "SIFaceView.h"
#import "SIEye.h"
#import "SILip.h"
#import "SINose.h"

@interface SIFaceView ()
{
    BOOL dragging;
}
@end

@implementation SIFaceView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    for (SIFaceItem *face in self.face.faceItems) {
        
        if ([face isKindOfClass:[SIEye class]]) {
            SIEye *eye = (SIEye *)face;
            
            CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
            
//            [self drawArc:ctx fromPoint:eye.cornerLeft];
//            [self drawArc:ctx fromPoint:eye.center];
//            [self drawArc:ctx fromPoint:eye.cornerRight];
//            
//            [self drawArc:ctx fromPoint:eye.browLeft];
//            [self drawArc:ctx fromPoint:eye.browMiddle];
//            [self drawArc:ctx fromPoint:eye.browRight];
            
            
            if(eye.isLeft){
                UIImage *eyeLeftImage = [UIImage imageNamed:@"eyelash-up-0"];
                
                self.eyeLeftAsset = [[CALayer alloc] init];
                self.eyeLeftAsset.contents = (__bridge id _Nullable)(eyeLeftImage.CGImage);
                CGRect rect = CGRectMake([self makeRatio:eye.cornerLeft].x - 5, [self makeRatio:eye.cornerLeft].y - 28, [self makeRatio:eye.cornerRight].x - [self makeRatio:eye.cornerLeft].x + 10, 35);
                self.eyeLeftAsset.frame = rect;
                self.eyeLeftAsset.opacity = 0.8f;
                self.eyeLeftAsset.contentsGravity = kCAGravityResizeAspect;
                [self.layer addSublayer:self.eyeLeftAsset];
                
//                [self.eyeLeftAsset setFrame:CGRectMake([self makeRatio:eye.cornerLeft].x - 5, [self makeRatio:eye.cornerLeft].y - 28, [self makeRatio:eye.cornerRight].x - [self makeRatio:eye.cornerLeft].x + 10, 35)];
                
//                self.eyeLeftAsset.contentMode = UIViewContentModeScaleAspectFit;
                
//                [self addSubview:self.eyeLeftAsset];
                
            }else{
                UIImage *eyeRightImage = [UIImage imageNamed:@"eyelash-up-inverse-0"];
                
                self.eyeRightAsset = [[CALayer alloc] init];
                self.eyeRightAsset.contents = (__bridge id _Nullable)(eyeRightImage.CGImage);
                CGRect rect = CGRectMake([self makeRatio:eye.cornerLeft].x, [self makeRatio:eye.cornerLeft].y - 28, [self makeRatio:eye.cornerRight].x + 10 - [self makeRatio:eye.cornerLeft].x, 35);
                self.eyeRightAsset.frame = rect;
                self.eyeRightAsset.opacity = 0.8f;
                self.eyeRightAsset.contentsGravity = kCAGravityResizeAspect;
                [self.layer addSublayer:self.eyeRightAsset];
                
//                self.eyeRightAsset = (SIDragView *)[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"eyelash-up-inverse"]];
//                [self.eyeRightAsset setFrame:CGRectMake([self makeRatio:eye.cornerLeft].x, [self makeRatio:eye.cornerLeft].y - 28, [self makeRatio:eye.cornerRight].x + 10 - [self makeRatio:eye.cornerLeft].x, 35)];
//                
//                self.eyeRightAsset.contentMode = UIViewContentModeScaleAspectFit;
//                
//                [self addSubview:self.eyeRightAsset];
            }
            
        } else if ([face isKindOfClass:[SILip class]]){
            SILip *lip = (SILip *)face;
            
            UIImage *lipImageUp = [UIImage imageNamed:@"mouth-up-6f323d"];
            
            self.lipAssetUp = [[CALayer alloc] init];
            self.lipAssetUp.contents =(__bridge id _Nullable)(lipImageUp.CGImage);
            CGRect rectUp = CGRectMake([self makeRatio:lip.cornerLeft].x, [self makeRatio:lip.cornerRight].y - 25 , [self makeRatio:lip.cornerRight].x - [self makeRatio:lip.cornerLeft].x + 15, 35);
            self.lipAssetUp.frame = rectUp;
            self.lipAssetUp.contentsGravity = kCAGravityResizeAspect;
            CGContextSetBlendMode(ctx, kCGBlendModeDifference);
            self.lipAssetUp.opacity = 0.5f;
            [self.lipAssetUp drawInContext:ctx];
            [self.layer addSublayer:self.lipAssetUp];
            
            
            UIImage *lipImageDown = [UIImage imageNamed:@"mouth-down-6f323d"];
            
            self.lipAssetDown = [[CALayer alloc] init];
            self.lipAssetDown.contents =(__bridge id _Nullable)(lipImageDown.CGImage);
            CGRect rectDown = CGRectMake([self makeRatio:lip.cornerLeft].x, [self makeRatio:lip.cornerRight].y - 10, [self makeRatio:lip.cornerRight].x - [self makeRatio:lip.cornerLeft].x + 15, 35);
            self.lipAssetDown.frame = rectDown;
            self.lipAssetDown.contentsGravity = kCAGravityResizeAspect;
            CGContextSetBlendMode(ctx, kCGBlendModeDifference);
            self.lipAssetDown.opacity = 0.5f;
            [self.lipAssetDown drawInContext:ctx];
            [self.layer addSublayer:self.lipAssetDown];
            
//            CGContextDrawImage(ctx, rect, lipImage.CGImage);
            
//                        [self drawArc:ctx fromPoint:lip.cornerLeft];
//                        [self drawArc:ctx fromPoint:lip.lineMiddle];
//                        [self drawArc:ctx fromPoint:lip.cornerRight];
            
            
//            self.lipAsset = (SIDragView *)[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouth-up"]];
            //            CGImageRef image =
            //
            //            CGRect rect = CGRectMake([self makeRatio:lip.cornerLeft].x, [self makeRatio:lip.cornerRight].y - 28, [self makeRatio:lip.cornerRight].x + 10 - [self makeRatio:lip.cornerLeft].x, 35);
            //
            ////            [self.lipAsset setFrame:CGRectMake([self makeRatio:lip.cornerLeft].x, [self makeRatio:lip.cornerRight].y - 28, [self makeRatio:lip.cornerRight].x + 10 - [self makeRatio:lip.cornerLeft].x, 35)];
            //
            ////            self.lipAsset.contentMode = UIViewContentModeScaleAspectFit;
            //
            //            CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
            //            CGContextDrawImage(ctx, rect, image);
            //
            ////            [self addSubview:self.lipAsset];
            //
            //            CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
            //
            
        } else{
            // Prepare a coffee.
        }
    }
    
}

- (void)drawArc:(CGContextRef)ctx fromPoint:(CGPoint)point {
    CGContextAddArc(ctx, (point.x * self.frame.size.width) / self.imageSize.width, (point.y * self.frame.size.height) / self.imageSize.height, 2, 0.0, M_PI * 2.0, YES);
    CGContextFillPath(ctx);
}

- (CGPoint)makeRatio:(CGPoint)point {
    return CGPointMake((point.x * self.frame.size.width) / self.imageSize.width, (point.y * self.frame.size.height) / self.imageSize.height);
}


@end
