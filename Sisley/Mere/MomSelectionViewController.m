//
//  MomSelectionViewController.m
//  Sisley
//
//  Created by Philippe Tring on 01/12/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "MomSelectionViewController.h"
#import "MomSelectionProductWelcomeViewController.h"

@interface MomSelectionViewController ()<UIScrollViewDelegate>
{
    UIScrollView *myScrollView;
    UIImageView *imgView1;
    UIImageView *imgView2;
    UIImageView *imgView3;
    NSMutableArray *selectedProductType;
    NSString *currentSelection;
}

@end

@implementation MomSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addScrollView];
    UITapGestureRecognizer *singleTapProduct1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetectedProduct1)];
    singleTapProduct1.numberOfTapsRequired = 1;
    self.imageProduct1.userInteractionEnabled = YES;
    [self.imageProduct1 addGestureRecognizer:singleTapProduct1];
    
    UITapGestureRecognizer *singleTapProduct2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetectedProduct2)];
    singleTapProduct2.numberOfTapsRequired = 1;
    self.imageProduct2.userInteractionEnabled = YES;
    [self.imageProduct2 addGestureRecognizer:singleTapProduct2];
    
    UITapGestureRecognizer *singleTapProduct3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetectedProduct3)];
    singleTapProduct3.numberOfTapsRequired = 1;
    self.imageProduct3.userInteractionEnabled = YES;
    [self.imageProduct3 addGestureRecognizer:singleTapProduct3];
    selectedProductType = [[NSMutableArray alloc] init];
    
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
               [UIImage imageNamed:@"selection-mom-complexion.png"]];
    imgView2 = [[UIImageView alloc]initWithImage:
                [UIImage imageNamed:@"selection-mom-lips.png"]];
    imgView3 = [[UIImageView alloc]initWithImage:
                [UIImage imageNamed:@"selection-mom-eyes.png"]];
    [imgView1 setFrame:CGRectMake(self.view.frame.size.width/2, 20, imgView1.frame.size.width, imgView1.frame.size.height)];
    [imgView2 setFrame:CGRectMake(self.view.frame.size.width/2 + 20 + imgView1.frame.size.width, 30, imgView2.frame.size.width, imgView2.frame.size.height)];
    imgView2.alpha = 0.3;
    [imgView3 setFrame:CGRectMake(self.view.frame.size.width/2 + 40 + imgView1.frame.size.width + imgView2.frame.size.width, 30, imgView3.frame.size.width, imgView3.frame.size.height)];
    imgView3.alpha = 0.3;
    myScrollView = [[UIScrollView alloc]initWithFrame:
                    CGRectMake(0, 20, self.view.frame.size.width, 80)];
    myScrollView.scrollEnabled = YES;
    myScrollView.directionalLockEnabled = YES;
    myScrollView.showsHorizontalScrollIndicator = NO;

    [myScrollView addSubview:imgView1];
    [myScrollView addSubview:imgView2];
    [myScrollView addSubview:imgView3];
    myScrollView.contentSize = CGSizeMake(self.view.frame.size.width + imgView1.frame.size.width + imgView2.frame.size.width + imgView3.frame.size.width, imgView1.frame.size.height);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
    currentSelection = @"complexion";
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
        currentSelection = @"complexion";
        imgView1.alpha = 1;
        imgView2.alpha = 0.3;
        imgView3.alpha = 0.3;
        [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-a1.jpg"]];
        [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-b1.jpg"]];
        [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-c1.jpg"]];
        for (NSString *productType in selectedProductType) {
            if ([productType  isEqual: @"powder"]) {
                [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-a2.jpg"]];
            } else if ([productType  isEqual: @"foundation"]) {
                [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-b2.jpg"]];
            } else if ([productType  isEqual: @"blush"]) {
                [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-c2.jpg"]];
            }
        }
        [self fadeIn:self.imageProduct3];
    } else if (myScrollView.contentOffset.x > 100) {
        currentSelection = @"eyes";
        imgView1.alpha = 0.3;
        imgView2.alpha = 0.3;
        imgView3.alpha = 1;
        
        [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-f1.jpg"]];
        [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-g1.jpg"]];
        [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-h1.jpg"]];
        for (NSString *productType in selectedProductType) {
            if ([productType  isEqual: @"eyeliner"]) {
                [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-f2.jpg"]];
            } else if ([productType  isEqual: @"mascara"]) {
                [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-g2.jpg"]];
            } else if ([productType  isEqual: @"eyeshadow"]) {
                [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-h2.jpg"]];
            }
        }
        [self fadeIn:self.imageProduct3];
    } else {
        currentSelection = @"lips";
        imgView1.alpha = 0.3;
        imgView2.alpha = 1;
        imgView3.alpha = 0.3;
        [self fadeOut:self.imageProduct3];
        [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-d1.jpg"]];
        [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-e1.jpg"]];
        for (NSString *productType in selectedProductType) {
            if ([productType  isEqual: @"redstick"]) {
                [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-d2.jpg"]];
            } else if ([productType  isEqual: @"gloss"]) {
                [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-e2.jpg"]];
            }
        }
    }
}

-(void)fadeOut:(UIImageView *) img{
    //Fade in
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1];
    img.alpha = 0;
    [UIView commitAnimations];
}

-(void)fadeIn:(UIImageView *) img{
    //Fade in
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1];
    img.alpha = 1;
    [UIView commitAnimations];
}

-(void)tapDetectedProduct1{
    if ([currentSelection  isEqual: @"complexion"]) {
        if ([selectedProductType indexOfObject:@"powder"]) {
            [selectedProductType addObject:@"powder"];
            [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-a2.jpg"]];
        } else {
            [selectedProductType removeObject:@"powder"];
            [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-a1.jpg"]];
        }
    } else if ([currentSelection  isEqual: @"lips"]) {
        if ([selectedProductType indexOfObject:@"redstick"]) {
            [selectedProductType addObject:@"redstick"];
            [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-d2.jpg"]];
        } else {
            [selectedProductType removeObject:@"redstick"];
            [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-d1.jpg"]];
        }
    } else if ([currentSelection  isEqual: @"eyes"]) {
        if ([selectedProductType indexOfObject:@"eyeliner"]) {
            [selectedProductType addObject:@"eyeliner"];
            [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-f2.jpg"]];
        } else {
            [selectedProductType removeObject:@"eyeliner"];
            [self.imageProduct1 setImage :[UIImage imageNamed:@"Export-f1.jpg"]];
        }
    }
}
-(void)tapDetectedProduct2{
    if ([currentSelection  isEqual: @"complexion"]) {
        if ([selectedProductType indexOfObject:@"foundation"]) {
            [selectedProductType addObject:@"foundation"];
            [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-b2.jpg"]];
        } else {
            [selectedProductType removeObject:@"foundation"];
            [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-b1.jpg"]];
        }
    } else if ([currentSelection  isEqual: @"lips"]) {
        if ([selectedProductType indexOfObject:@"gloss"]) {
            [selectedProductType addObject:@"gloss"];
            [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-e2.jpg"]];
        } else {
            [selectedProductType removeObject:@"gloss"];
            [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-e1.jpg"]];
        }
    } else if ([currentSelection  isEqual: @"eyes"]) {
        if ([selectedProductType indexOfObject:@"mascara"]) {
            [selectedProductType addObject:@"mascara"];
            [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-g2.jpg"]];
        } else {
            [selectedProductType removeObject:@"mascara"];
            [self.imageProduct2 setImage :[UIImage imageNamed:@"Export-g1.jpg"]];
        }
    }
}
-(void)tapDetectedProduct3{
    if ([currentSelection  isEqual: @"complexion"]) {
        if ([selectedProductType indexOfObject:@"blush"]) {
            [selectedProductType addObject:@"blush"];
            [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-c2.jpg"]];
        } else {
            [selectedProductType removeObject:@"blush"];
            [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-c1.jpg"]];
        }
    } else if ([currentSelection  isEqual: @"eyes"]) {
        if ([selectedProductType indexOfObject:@"eyeshadow"]) {
            [selectedProductType addObject:@"eyeshadow"];
            [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-h2.jpg"]];
        } else {
            [selectedProductType removeObject:@"eyeshadow"];
            [self.imageProduct3 setImage :[UIImage imageNamed:@"Export-h1.jpg"]];
        }
    }
}
- (IBAction)goToNextScreen:(id)sender {
    MomSelectionProductWelcomeViewController *MomSelectionProduct = [[MomSelectionProductWelcomeViewController alloc] initWithNibName:nil bundle:nil];
    MomSelectionProduct.productTypeSelected = selectedProductType;
    [self presentViewController:MomSelectionProduct animated:YES completion:nil];
}
@end
