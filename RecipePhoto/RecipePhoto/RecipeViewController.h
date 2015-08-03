//
//  RecipeViewController.h
//  RecipePhoto
//
//  Created by daichao on 15/8/3.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
@property(weak,nonatomic )NSString *recipeImageName;
- (IBAction)close:(id)sender;

@end
