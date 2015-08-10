//
//  ViewController.m
//  
//
//  Created by bokeadmin on 15/8/10.
//
//

#import "AppViewController.h"
#import "AppChildViewController.h"
@interface AppViewController ()

@end

@implementation AppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.pageController=[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource=self;
    
    [[self.pageController view]setFrame:[[self view]bounds]];
    AppChildViewController *initialViewController=[self viewControllerAtIndex:0];
    NSArray *viewControllers=[NSArray arrayWithObject:initialViewController];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view]addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index=[(AppChildViewController*)viewController index];
    if (index==0) {
        return nil;
    }
    index--;
    return  [self viewControllerAtIndex:index];
}




- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index=[(AppChildViewController*)viewController index];
    index++;
    if(index==5){
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

-(AppChildViewController*)viewControllerAtIndex:(NSUInteger)index{
    AppChildViewController *childViewController=[[AppChildViewController alloc]initWithNibName:@"AppChildViewController" bundle:nil];
    childViewController.index=index;
    
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
