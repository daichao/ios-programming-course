//
//  ViewController.h
//  PageViewDemo
//
//  Created by daichao on 15/8/19.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController<UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
@property(strong,nonatomic)UIPageViewController *pageViewController;
@property(strong,nonatomic)NSArray *pageTitles;
@property(strong,nonatomic)NSArray *pageImages;

@end

