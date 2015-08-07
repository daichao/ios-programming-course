//
//  ViewController.h
//  VideoApp
//
//  Created by daichao on 15/8/7.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)NSURL *videoUrl;
@property(nonatomic,strong)MPMoviePlayerController *videoController;

- (IBAction)captureVideo:(id)sender;

@end

