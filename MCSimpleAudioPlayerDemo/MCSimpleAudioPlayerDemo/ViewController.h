//
//  ViewController.h
//  MCSimpleAudioPlayerDemo
//
//  Created by bokeadmin on 15/8/20.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *pause;
@property (weak, nonatomic) IBOutlet UIButton *stop;
@property (weak, nonatomic) IBOutlet UISlider *slider;

- (IBAction)pause:(id)sender;

- (IBAction)stop:(id)sender;

- (IBAction)slider:(id)sender;

@end

