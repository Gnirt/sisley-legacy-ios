//
//  SITutoViewController.m
//  Sisley
//
//  Created by ZIIW on 05/01/2016.
//  Copyright © 2016 Ziiw. All rights reserved.
//

#import "SITutoViewController.h"
#import <IFTTTJazzHands.h>
#import <Masonry/Masonry.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MomLoginViewController.h"
#import "SILoginViewController.h"

@interface SITutoViewController ()

@end

@implementation SITutoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.animator = [IFTTTAnimator new];
    
    self.screenRect = [[UIScreen mainScreen] bounds];
    self.screenWidth = self.screenRect.size.width;
    self.screenHeight = self.screenRect.size.height;
    
    [self configureVideo];
    [self configureViewOne];
    [self configureViewTwo];
    [self configureViewThree];
    [self configureViewFour];
    [self configureViewFive];
    
    // INITIALISATION
    [self.pageControl setCenter:CGPointMake(self.screenWidth / 2, self.screenHeight + 10)];
    
    float scale = 1;
    UIImage *logo = [UIImage imageNamed:@"logo"];
    self.logo = [[UIImageView alloc] initWithImage:logo];
    self.logo.frame = CGRectMake((self.screenWidth / 2) - (logo.size.width / 2), self.screenHeight / 2 - (logo.size.height / 2), logo.size.width * scale, logo.size.height * scale);
    
    [self.contentView addSubview:self.logo];
    [self keepView:self.logo onPages:@[@(0), @(1), @(2), @(3), @(4)]];
    [self.logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(70);
    }];
    
    [UIView animateWithDuration:0.75f delay:1.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.logo setFrame:CGRectMake((self.screenWidth / 2) - (logo.size.width / 2), 70, logo.size.width * scale, logo.size.height * scale)];
                     }
                     completion:nil];
}

-(void)configureViewOne {
    self.pageOneLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.screenWidth + 15, self.screenHeight / 2.5, self.screenWidth - 30, 250)];
    [self.pageOneLabel setText: @"Sisley prône les valeurs familiales.\n\nHéritage by Sisley a été conçu spécialement pour vous permettre d’initier un moment de partage privilégié entre mère et fille."];
    self.pageOneLabel.textAlignment = NSTextAlignmentCenter;
    self.pageOneLabel.numberOfLines = 0;
    self.pageOneLabel.textColor = [UIColor whiteColor];
    [self.pageOneLabel setFont: [UIFont fontWithName:@"Montserrat-Light" size:17.0f]];
    [self.contentView addSubview:self.pageOneLabel];
    
    [UIView animateWithDuration:0.75f delay:1.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.pageOneLabel setCenter:CGPointMake((self.pageOneLabel.frame.size.width / 2) + 15, (self.screenHeight / 2.5) + self.pageOneLabel.frame.size.height / 2)];
                     }
                     completion:nil];
    
    [UIView animateWithDuration:0.75f delay:1.0 options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.pageControl setCenter:CGPointMake(self.screenWidth / 2, self.screenHeight - 30)];
                     }
                     completion:nil];
}

-(void)configureViewTwo {
    self.pageTwoLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.screenWidth + 15, self.screenHeight / 2.5, self.screenWidth - 30, 250)];
    [self.pageTwoLabel setText: @"En tant que mère, vous allez pouvoir pré-sélectionner les produits que vous souhaitez faire tester à votre fille."];
    self.pageTwoLabel.textAlignment = NSTextAlignmentCenter;
    self.pageTwoLabel.numberOfLines = 0;
    self.pageTwoLabel.textColor = [UIColor whiteColor];
    [self.pageTwoLabel setFont: [UIFont fontWithName:@"Montserrat-Light" size:17.0f]];
    [self.contentView addSubview:self.pageTwoLabel];
}

-(void)configureViewThree {
    self.pageThreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.screenWidth * 2 + 15, self.screenHeight / 2.5, self.screenWidth - 30, 250)];
    [self.pageThreeLabel setText: @"En tant que fille, tu vas pouvoir tester virtuellement ces produits et sélectionner ceux qui te plaisent."];
    self.pageThreeLabel.textAlignment = NSTextAlignmentCenter;
    self.pageThreeLabel.numberOfLines = 0;
    self.pageThreeLabel.textColor = [UIColor whiteColor];
    [self.pageThreeLabel setFont: [UIFont fontWithName:@"Montserrat-Light" size:17.0f]];
    [self.contentView addSubview:self.pageThreeLabel];
}

-(void)configureViewFour {
    self.pageFourLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.screenWidth * 3 + 15, self.screenHeight / 2.5, self.screenWidth - 30, 250)];
    [self.pageFourLabel setText: @"Enfin, vous vous accorderez et validerez ensemble les produits qui conviennent le mieux."];
    self.pageFourLabel.textAlignment = NSTextAlignmentCenter;
    self.pageFourLabel.numberOfLines = 0;
    self.pageFourLabel.textColor = [UIColor whiteColor];
    [self.pageFourLabel setFont: [UIFont fontWithName:@"Montserrat-Light" size:17.0f]];
    [self.contentView addSubview:self.pageFourLabel];
}

-(void)configureViewFive {
    self.pageFiveLabelOne = [[UIButton alloc] initWithFrame:CGRectMake(self.screenWidth * 4 + self.screenWidth / 2 - 45, (self.screenHeight / 2.5) - 30, 200, 150)];
    [self.pageFiveLabelOne setTitle: @"Je veux initier ma fille au maquillage." forState:UIControlStateNormal];
    self.pageFiveLabelOne.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.pageFiveLabelOne.titleLabel.numberOfLines = 0;
    self.pageFiveLabelOne.titleLabel.textColor = [UIColor whiteColor];
    [self.pageFiveLabelOne.titleLabel setFont: [UIFont fontWithName:@"Montserrat-Light" size:17.0f]];
    [self.pageFiveLabelOne addTarget:self action: @selector(goMom) forControlEvents: UIControlEventTouchUpInside];
    [self.contentView addSubview:self.pageFiveLabelOne];
    
    self.pageFiveLabelTwo = [[UIButton alloc] initWithFrame:CGRectMake(self.screenWidth * 4 + self.screenWidth / 2 - 45, (self.screenHeight / 2.5) + 80, 200, 150)];
    [self.pageFiveLabelTwo setTitle:@"Je veux être initiée par ma mère." forState:UIControlStateNormal];
    self.pageFiveLabelTwo.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.pageFiveLabelTwo.titleLabel.numberOfLines = 0;
    self.pageFiveLabelTwo.titleLabel.textColor = [UIColor whiteColor];
    [self.pageFiveLabelTwo.titleLabel setFont: [UIFont fontWithName:@"Montserrat-Light" size:17.0f]];
    [self.pageFiveLabelTwo addTarget:self action: @selector(goKid) forControlEvents: UIControlEventTouchUpInside];
    [self.contentView addSubview:self.pageFiveLabelTwo];
    
    UIImage *imgMom = [UIImage imageNamed:@"head-mom"];
    self.pageFiveImgOne = [[UIButton alloc] initWithFrame:CGRectMake(self.screenWidth * 4 + self.screenWidth / 2 - 135, (self.screenHeight / 2) - 55, 75, 75)];
    [self.pageFiveImgOne setImage:imgMom forState:UIControlStateNormal];
    [self.pageFiveImgOne addTarget:self action: @selector(goMom) forControlEvents: UIControlEventTouchUpInside];
    [self.contentView addSubview:self.pageFiveImgOne];
    
    UIImage *imgKid = [UIImage imageNamed:@"head-daughter"];
    self.pageFiveImgTwo = [[UIButton alloc] initWithFrame:CGRectMake(self.screenWidth * 4 + self.screenWidth / 2 - 135, (self.screenHeight / 2) + 55, 75, 75)];
    [self.pageFiveImgTwo setImage:imgKid forState:UIControlStateNormal];
    [self.pageFiveImgTwo addTarget:self action: @selector(goKid) forControlEvents: UIControlEventTouchUpInside];
    [self.contentView addSubview:self.pageFiveImgTwo];
}

- (NSUInteger)numberOfPages
{
    // Tell the scroll view how many pages it should have
     self.pageControl.numberOfPages = 5;
    return 5;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSUInteger page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    self.pageControl.currentPage = page;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureVideo {
    // Load the video from the app bundle.
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"bg-intro" withExtension:@"mp4"];
    
    // Create and configure the movie player.
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    
    self.moviePlayer.view.frame = self.view.frame;
    [self.view insertSubview:self.moviePlayer.view atIndex:0];
    
    [self.moviePlayer play];
    
    // Loop video.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loopVideo) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    
}

- (void)loopVideo {
    [self.moviePlayer play];
}

-(void)goMom {
    NSLog(@"Mom");
    
    MomLoginViewController *momVC = [self.storyboard instantiateViewControllerWithIdentifier:@"momVC"];;
    [self.navigationController pushViewController:momVC animated:YES];
}

-(void)goKid {
    NSLog(@"Kid");
    
    SILoginViewController *kidVC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
    [self.navigationController pushViewController:kidVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
