//
//  ViewController.h
//  CameraApp
//
//  Created by bokeadmin on 15/8/7.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;


@end

