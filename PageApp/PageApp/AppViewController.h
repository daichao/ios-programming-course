//
//  ViewController.h
//  
//
//  Created by bokeadmin on 15/8/10.
//
//

#import <UIKit/UIKit.h>

@interface AppViewController : UIViewController<UIPageViewControllerDataSource>
@property(strong,nonatomic)UIPageViewController *pageController;
@end
