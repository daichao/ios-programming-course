//
//  SimpleTableCellTableViewCell.h
//  SimpleTable
//
//  Created by daichao on 15/4/24.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCellTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@end
