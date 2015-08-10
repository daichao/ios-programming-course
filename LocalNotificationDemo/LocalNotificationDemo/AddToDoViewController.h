//
//  AddToDoViewController.h
//  LocalNotificationDemo
//
//  Created by Simon on 9/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToDoViewController : UIViewController <UITextFieldDelegate>
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *itemText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
