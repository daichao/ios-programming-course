//
//  DocumentViewController.h
//  AirDropDemo
//
//  Created by Simon on 28/10/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentViewController : UIViewController
- (IBAction)share:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSString *documentName;
@end
