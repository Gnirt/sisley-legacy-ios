//
//  TutoMainViewController.m
//  Sisley
//
//  Created by Philippe Tring on 09/11/2015.
//  Copyright © 2015 Ziiw. All rights reserved.
//

#import "TutoMainViewController.h"
#import "TutoViewController.h"
#import "UserTypeChoiceViewController.h"

@interface TutoMainViewController ()

@end

@implementation TutoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    TutoViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
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


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutoViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutoViewController *)viewController index];
    
    
    index++;
    
    if (index == 5) {
        UserTypeChoiceViewController *UserTypeChoice = [[UserTypeChoiceViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:UserTypeChoice animated:YES completion:nil];
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (TutoViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    TutoViewController *childViewController = [[TutoViewController alloc] initWithNibName:@"TutoViewController" bundle:nil];
    childViewController.index = index;
    
    return childViewController;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

@end
