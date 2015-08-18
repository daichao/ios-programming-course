//
//  ViewController.m
//  UniversalAppDemo
//
//  Created by daichao on 15/8/18.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    //判断当前设备是iphone还是ipad
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        UIAlertView *playAlert = [[UIAlertView alloc] initWithTitle:@"New Game" message:@"Start Playing..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [playAlert show];
    }
    else if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad){
        UIAlertView *playAlert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:@"Just ended..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [playAlert show];
    }
}


@end
