//
//  MasterViewController.h
//  RSSreader
//
//  Created by daichao on 15/8/4.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController<NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

