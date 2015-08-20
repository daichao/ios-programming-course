//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by bokeadmin on 15/8/20.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;

@end
