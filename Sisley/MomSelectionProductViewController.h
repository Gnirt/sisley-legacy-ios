//
//  MomSelectionProductViewController.h
//  Sisley
//
//  Created by Philippe Tring on 03/12/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface MomSelectionProductViewController : UIViewController<iCarouselDataSource, iCarouselDelegate>
@property NSMutableArray *productTypeSelected;
@property NSMutableArray *productSelected;
@property (nonatomic) IBOutlet iCarousel *carousel;
@property (weak, nonatomic) IBOutlet UIButton *cartButton;

@end
