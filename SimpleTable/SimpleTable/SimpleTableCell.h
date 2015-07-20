//
//  SimpleTableCellTableViewCell.h
//  SimpleTable
//
//  Created by bokeadmin on 15/7/20.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *nameLabel;
@property(nonatomic,weak)IBOutlet UILabel *prepTimeLabel;
@property(nonatomic,weak)IBOutlet UIImageView *thumbnailImageView;
@end
