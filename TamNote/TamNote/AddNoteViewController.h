//
//  AddNoteViewController.h
//  TamNote
//
//  Created by Simon on 10/3/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNoteViewController : UITableViewController
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;

@end
