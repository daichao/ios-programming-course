//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by bokeadmin on 15/7/31.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DeviceDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;


- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end
