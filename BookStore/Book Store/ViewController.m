//
//  ViewController.m
//  Book Store
//
//  Created by TAMIM Ziad on 9/6/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buy:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Message"
                                message:NSLocalizedString(@"BOOK_PURCHASE", @"Message")
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}
@end
