//
//  ViewController.h
//  RecipeBook
//
//  Created by daichao on 15/7/22.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)IBOutlet UITableView *tbView;

@end

