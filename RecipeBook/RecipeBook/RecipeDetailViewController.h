//
//  RecipeDetailViewController.h
//  RecipeBook
//
//  Created by daichao on 15/7/23.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController
@property(nonatomic,strong)IBOutlet UILabel *recipeLabel;
@property(nonatomic,strong)NSString *recipeName;
@end
