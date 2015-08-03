//
//  RecipeCollectionViewController.h
//  RecipePhoto
//
//  Created by daichao on 15/8/1.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
@interface RecipeCollectionViewController : UICollectionViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *shareButton;
- (IBAction)shareButtonTouched:(id)sender;


@end
