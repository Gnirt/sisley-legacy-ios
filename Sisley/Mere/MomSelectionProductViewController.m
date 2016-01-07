//
//  MomSelectionProductViewController.m
//  Sisley
//
//  Created by Philippe Tring on 03/12/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "MomSelectionProductViewController.h"
#import "iCarousel.h"
#import "MomSelectionProductPreviewViewController.h"
@interface MomSelectionProductViewController ()<UIScrollViewDelegate>
{
    UIScrollView *myScrollView;
    UIImageView *imgView1;
    UIImageView *imgView2;
    UIImageView *imgView3;
    NSString *currentSelection;
}

@end

@implementation MomSelectionProductViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addScrollView];
    NSLog(@"%@", [self.productTypeSelected description]);
    
    //configure carousel
    self.carousel.type = iCarouselTypeLinear;
    self.carousel.delegate = self;
    self.carousel.dataSource = self;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return self.productTypeSelected.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300.0f, 300.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeScaleAspectFit;
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
//    label.text = self.productTypeSelected[index];
    ((UIImageView *)view).image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", self.productTypeSelected[index]]];
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if (index == self.carousel.currentItemIndex) {
        NSString *intString = self.cartButton.currentTitle;
        int value = [intString intValue] + 1;
        [self.cartButton setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
//        self.productTypeSelected[self.carousel.currentItemIndex];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)addScrollView{
    imgView1 = [[UIImageView alloc]initWithImage:
                [UIImage imageNamed:@"selection-mom-eyes"]];
    imgView2 = [[UIImageView alloc]initWithImage:
                [UIImage imageNamed:@"selection-mom-lips.png"]];
//    imgView3 = [[UIImageView alloc]initWithImage:
//                [UIImage imageNamed:@"selection-mom-eyes.png"]];
    [imgView1 setFrame:CGRectMake(self.view.frame.size.width, 20, imgView1.frame.size.width, imgView1.frame.size.height)];
    [imgView2 setFrame:CGRectMake(self.view.frame.size.width + 20 + imgView1.frame.size.width, 20, imgView2.frame.size.width, imgView2.frame.size.height)];
//    [imgView3 setFrame:CGRectMake(self.view.frame.size.width/2 + 40 + imgView1.frame.size.width + imgView2.frame.size.width, 30, imgView3.frame.size.width, imgView3.frame.size.height)];
    myScrollView = [[UIScrollView alloc]initWithFrame:
                    CGRectMake(0, 20, self.view.frame.size.width, 80)];
    myScrollView.scrollEnabled = YES;
    myScrollView.directionalLockEnabled = YES;
    myScrollView.showsHorizontalScrollIndicator = NO;
    
    [myScrollView addSubview:imgView1];
    [myScrollView addSubview:imgView2];
//    [myScrollView addSubview:imgView3];
    myScrollView.contentSize = CGSizeMake(self.view.frame.size.width + imgView1.frame.size.width + imgView2.frame.size.width + imgView3.frame.size.width, imgView1.frame.size.height);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
    currentSelection = @"eyes";
    imgView1.alpha = 1;
    imgView2.alpha = 0.3;
//    imgView3.alpha = 1;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //    NSLog(@"Did end decelerating");
    [self changeImgViewAlpha];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    NSLog(@"Did scroll");
    [self changeImgViewAlpha];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    [self changeImgViewAlpha];
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //    NSLog(@"Did begin decelerating");
    [self changeImgViewAlpha];
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //    NSLog(@"Did begin dragging");
    [self changeImgViewAlpha];
}

-(void) changeImgViewAlpha{
    if (myScrollView.contentOffset.x < 50) {
        currentSelection = @"eyes";
        imgView1.alpha = 1;
        imgView2.alpha = 0.3;
//        imgView3.alpha = 1;
        
    } else {
        currentSelection = @"lips";
        imgView1.alpha = 0.3;
        imgView2.alpha = 1;
        
//        imgView3.alpha = 0.3;
    }
}

- (IBAction)goToCartPreview:(id)sender {
    NSLog(@"go to cart preview");
    MomSelectionProductPreviewViewController *MomSelectionProductPreview = [[MomSelectionProductPreviewViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:MomSelectionProductPreview animated:YES completion:nil];
    
}
@end
