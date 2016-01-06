//
//  SIFaceViewController.m
//  Sisley
//
//  Created by ZIIW on 04/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "SIFaceViewController.h"
#import "CameraViewController.h"
#import "SIFaceItem.h"
#import "SIFaceView.h"
#import "SIEye.h"
#import "SILip.h"
#import "SIHomeViewController.h"

@interface SIFaceViewController ()
{
    BOOL dragging;
    CGPoint direction;
    
    CGFloat distanceEyeLeft;
    CGFloat distanceEyeRight;
    CGFloat distanceLipUp;
    CGFloat distanceLipDown;
    
    CGPoint startingPoint;
    CGPoint currentPoint;
    
    BOOL isLikable;
    BOOL isLevre;
    
    NSArray *eyeAssets;
    NSArray *lipAssets;
    
    int iEye;
    int iLip;
}
@end

@implementation SIFaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isLikable = NO;
    isLevre = YES;
    
    eyeAssets = [NSArray arrayWithObjects: @"0", @"1936", @"31171f", nil];
    lipAssets = [NSArray arrayWithObjects: @"6f323d", @"8d4c3a", @"923a54", @"994e65", @"b96466", @"c03c60", @"d29c8b", @"e8b1b4", @"e87780", @"eb5e4a", @"ed7f85", @"f9c5c3", @"fc9482", @"ff5148", nil];
    iEye = 0;
    iLip = 0;
    
    [self.checkOverlay setEnabled:NO];
    [self.crossOverlay setEnabled:NO];
    
    self.switchProductView.alpha = 0.0f;
    
    self.photoImageView.image = [self decodeBase64ToImage:self.imageString];
//    self.faceView.imageFace = [self decodeBase64ToImage:self.imageString];
    
    NSDictionary *faceAttributes = [[[[self.faceData objectForKey:@"images"] objectAtIndex:0] objectForKey:@"faces"] objectAtIndex:0];
    self.faceView.face = [[SIFaceItem alloc] initWithDictionary:faceAttributes];
    self.faceView.imageSize = self.photoImageView.image.size;
    
}

#pragma mark Touch Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    startingPoint = [touch locationInView:self.view];
    
    if(!isLikable){
        // Get distance from touch to face assets
        distanceEyeLeft = [self distanceBetweenRect:self.faceView.eyeLeftAsset.frame andPoint:startingPoint];
        distanceEyeRight = [self distanceBetweenRect:self.faceView.eyeRightAsset.frame andPoint:startingPoint];
        distanceLipUp = [self distanceBetweenRect:self.faceView.lipAssetUp.frame andPoint:startingPoint];
        distanceLipDown = [self distanceBetweenRect:self.faceView.lipAssetDown.frame andPoint:startingPoint];
        
        if(distanceEyeLeft < distanceEyeRight && distanceEyeLeft < distanceLipUp && distanceEyeLeft < distanceLipDown)
        {
            // Eye left
            self.draggedItem = self.faceView.eyeLeftAsset;
            
        }else if(distanceEyeRight < distanceEyeLeft && distanceEyeRight < distanceLipUp && distanceEyeRight < distanceLipDown)
        {
            // Eye right
            self.draggedItem = self.faceView.eyeRightAsset;
            
        }else if(distanceLipUp < distanceEyeLeft && distanceLipUp < distanceEyeRight && distanceLipUp < distanceLipDown)
        {
            // Lip up
            self.draggedItem = self.faceView.lipAssetUp;
        }else{
            // Lip down
            self.draggedItem = self.faceView.lipAssetDown;
        }
        
        
        if ([touches count] == 1)
        {
            dragging = YES;
        }else{
            dragging = NO;
        }

    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    if(dragging){
        currentPoint = [touch locationInView:self.view];
        
        direction = [self detectDirection:startingPoint withCurrentPoint:currentPoint];
        
        CGFloat deltaX = fabs(startingPoint.x - currentPoint.x) / 100;
        CGFloat deltaY = fabs(startingPoint.y - currentPoint.y) / 100;
        
        self.draggedItem.frame = CGRectMake(self.draggedItem.frame.origin.x + (deltaX * direction.x), self.draggedItem.frame.origin.y + (deltaY * direction.y), self.draggedItem.frame.size.width, self.draggedItem.frame.size.height);
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    dragging = NO;
//    NSLog(@"old x: %f, new x: %f", self.draggedItem.frame.origin.x, self.faceView.eyeLeftAsset.frame.origin.x);
}

#pragma mark Utils

-(CGPoint)detectDirection:(CGPoint)start withCurrentPoint:(CGPoint)current {
    CGPoint p;
    
    if(start.x < current.x && start.y < current.y)
    {
        p.x = 1;
        p.y = 1;
    }else if(start.x < current.x && start.y > current.y)
    {
        p.x = 1;
        p.y = -1;
    }else if(start.x > current.x && start.y > current.y)
    {
        p.x = -1;
        p.y = -1;
    }else
    {
        p.x = -1;
        p.y = 1;
    }
    
    return p;
}


- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (CGFloat)distanceBetweenRect:(CGRect)rect andPoint:(CGPoint)point
{
    // first of all, we check if point is inside rect. If it is, distance is zero
    if (CGRectContainsPoint(rect, point)) return 0.f;
    
    // next we see which point in rect is closest to point
    CGPoint closest = rect.origin;
    if (rect.origin.x + rect.size.width < point.x)
        closest.x += rect.size.width; // point is far right of us
    else if (point.x > rect.origin.x)
        closest.x = point.x; // point above or below us
    if (rect.origin.y + rect.size.height < point.y)
        closest.y += rect.size.height; // point is far below us
    else if (point.y > rect.origin.y)
        closest.y = point.y; // point is straight left or right
    
    // we've got a closest point; now pythagorean theorem
    // distance^2 = [closest.x,y - closest.x,point.y]^2 + [closest.x,point.y - point.x,y]^2
    // i.e. [closest.y-point.y]^2 + [closest.x-point.x]^2
    CGFloat a = powf(closest.y-point.y, 2.f);
    CGFloat b = powf(closest.x-point.x, 2.f);
    return sqrtf(a + b);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeOverlay:(id)sender {
    // Information overlay fade Out
    [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlayView.alpha = 0.0f;
                     }
                     completion:nil];
}

#pragma mark Boutons Actions

- (IBAction)backToCam:(id)sender {
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    
    if (numberOfViewControllers < 2){
        return;
    }
    else{
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2] animated:YES];
    }
}

- (IBAction)valid:(id)sender {
    
    if(isLikable){
        [self.closeOverlay setEnabled:NO];
        
        [self.checkOverlay setEnabled:YES];
        [self.crossOverlay setEnabled:YES];
        
        // Show final validation
        [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.overlayView.alpha = 1.0f;
                             self.likeBtn.alpha = 0.0f;
                             self.switchProductView.alpha = 0.0f;
                             self.prevBtn.alpha = 0.0f;
                             self.nextBtn.alpha = 0.0f;
                             self.overlayTextTwo.alpha = 0.0f;
                             self.checkOverlay.alpha = 1.0f;
                             self.crossOverlay.alpha = 1.0f;
                             self.validBtn.alpha = 0.0f;
                             self.photoBtn.alpha = 0.0f;
                             
                             self.OverlayTextOne.text = @"As-tu terminé la séléction de tes produits ?";
                         }
                         completion:nil];
        
    }else{
        // Show tuto and activate swipe
        
        [self.OverlayTextOne setText:@"Swipe de droite à gauche pour tester les produits."];
        [self.overlayTextTwo setText:@"Tu peux choisir un produit qui te plait en likant avec ce bouton."];
        
        [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.overlayView.alpha = 1.0f;
                             self.likeBtn.alpha = 1.0f;
                             self.switchProductView.alpha = 1.0f;
                             self.prevBtn.alpha = 1.0f;
                             self.nextBtn.alpha = 1.0f;
                         }
                         completion:nil];
        
        [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                         animations:^{

                         }
                         completion:nil];
        
        // Disable touching
        isLikable = YES;
    }
}

- (IBAction)likeItem:(id)sender {
    if(isLikable){
        // Fake
    }
}

- (IBAction)crossBtn:(id)sender {
    [UIView animateWithDuration:0.5f delay:0.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.overlayView.alpha = 0.0f;
                         self.likeBtn.alpha = 1.0f;
                         self.switchProductView.alpha = 1.0f;
                         self.prevBtn.alpha = 1.0f;
                         self.nextBtn.alpha = 1.0f;
                         self.checkOverlay.alpha = 0.0f;
                         self.crossOverlay.alpha = 0.0f;
                         self.validBtn.alpha = 1.0f;
                         self.photoBtn.alpha = 1.0f;
                     }
                     completion:nil];
}


#pragma mark Switch products

- (IBAction)levreBtn:(id)sender {
    if(!isLevre){
        
        [UIView animateWithDuration:0.25f delay:0.0 options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.switchProductView.center = CGPointMake(self.switchProductView.center.x + 65, self.switchProductView.center.y);
                             self.levreBtn.alpha = 1.0f;
                             self.yeuxBtn.alpha = 0.3f;
                         }
                         completion:nil];
        isLevre = YES;
    }
}

- (IBAction)yeuxBtn:(id)sender {
    if(isLevre){
        [UIView animateWithDuration:0.25f delay:0.0 options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.switchProductView.center = CGPointMake(self.switchProductView.center.x - 65, self.switchProductView.center.y);
                             self.levreBtn.alpha = 0.3f;
                             self.yeuxBtn.alpha = 1.0f;
                         }
                         completion:nil];
        isLevre = NO;
    }
}

- (IBAction)prevAsset:(id)sender {
    if(isLikable){
        if(isLevre){
            if(iLip == 0){
                iLip = (int)lipAssets.count + 1;
            }
            
            iLip --;
        }else{
            if(iEye == 0){
                iEye = (int)eyeAssets.count + 1;
            }
            
            iEye --;
        }
        
        [self changeAsset];
        
    }
}

- (IBAction)nextAsset:(id)sender {
    if(isLikable){
        NSLog(@"next");
        
        if(isLevre){
            if(iLip == lipAssets.count -1){
                iLip = -1;
            }
            
            iLip ++;
        }else{
            if(iEye == eyeAssets.count -1){
                iEye = -1;
            }
            
            iEye ++;
        }
        
        [self changeAsset];
    }
}

-(void)changeAsset {
    if(isLevre){
        
        UIImage *lipImageUp = [UIImage imageNamed:[NSString stringWithFormat:@"mouth-up-%@", lipAssets[iLip]]];
        self.faceView.lipAssetUp.contents = (__bridge id _Nullable)(lipImageUp.CGImage);
        
        UIImage *lipImageDown = [UIImage imageNamed:[NSString stringWithFormat:@"mouth-down-%@", lipAssets[iLip]]];
        self.faceView.lipAssetDown.contents = (__bridge id _Nullable)(lipImageDown.CGImage);
    }else{
        
        UIImage *eyeLeftImage = [UIImage imageNamed:[NSString stringWithFormat:@"eyelash-up-%@", eyeAssets[iEye]]];
        self.faceView.eyeLeftAsset.contents = (__bridge id _Nullable)(eyeLeftImage.CGImage);
        
        UIImage *eyeRigthImage = [UIImage imageNamed:[NSString stringWithFormat:@"eyelash-up-inverse-%@", eyeAssets[iEye]]];
        self.faceView.eyeRightAsset.contents = (__bridge id _Nullable)(eyeRigthImage.CGImage);
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"backHome"]) {
        NSLog(@"asds");
        SIHomeViewController *homeVC = segue.destinationViewController;
        homeVC.bump = YES;
    }
}


@end
