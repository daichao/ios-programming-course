//
//  DetailViewController.h
//  RSSreader
//
//  Created by daichao on 15/8/4.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (copy, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

