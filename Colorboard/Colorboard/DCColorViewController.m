//
//  DCColorViewController.m
//  Colorboard
//
//  Created by bokeadmin on 15/7/8.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import "DCColorViewController.h"

@interface DCColorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation DCColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *color=self.colorDescription.color;
    double red,green,blue;
    [color getRed:&red green:&green blue:&blue alpha:nil];
    
    self.redSlider.value=red;
    self.greenSlider.value=green;
    self.blueSlider.value=blue;
    
    
    self.view.backgroundColor=color;
    self.textField.text=self.colorDescription.name;
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.colorDescription.name=self.textField.text;
    self.colorDescription.color=self.view.backgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)dismiss:(id)sender{
    //关闭viewcontroller
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)changeColor:(id)sender{
    float red=self.redSlider.value;
    float green=self.greenSlider.value;
    float blue=self.blueSlider.value;
    UIColor *newColor=[UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.view.backgroundColor=newColor;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if(self.existingColor){
        self.navigationItem.rightBarButtonItem=nil;
    }
}
@end
