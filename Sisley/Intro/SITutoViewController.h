//
//  SITutoViewController.h
//  Sisley
//
//  Created by ZIIW on 05/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTTTJazzHands.h"
#import <MediaPlayer/MediaPlayer.h>

@interface SITutoViewController : IFTTTAnimatedPagingScrollViewController

@property (nonatomic) CGRect screenRect;
@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

@property (nonatomic, strong) UIView *overlay;

@property (nonatomic, strong) UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) UILabel *pageOneLabel;
@property (nonatomic, strong) UILabel *pageTwoLabel;
@property (nonatomic, strong) UILabel *pageThreeLabel;
@property (nonatomic, strong) UILabel *pageFourLabel;
@property (nonatomic, strong) UIButton *pageFiveLabelOne;
@property (nonatomic, strong) UIButton *pageFiveLabelTwo;
@property (nonatomic, strong) UIButton *pageFiveImgOne;
@property (nonatomic, strong) UIButton *pageFiveImgTwo;

@end
