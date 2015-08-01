//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by bokeadmin on 15/7/31.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import "DeviceDetailViewController.h"

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.device) {
        [self.nameTextField setText:[self.device valueForKey:@"name"]];
        [self.versionTextField setText:[self.device valueForKey:@"version"]];
        [self.companyTextField setText:[self.device valueForKey:@"company"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext*)managedObjectContext{
    NSManagedObjectContext *context=nil;
    id delegate=[[UIApplication sharedApplication]delegate];
    if([delegate performSelector:@selector(managedObjectContext)]){
        context=[delegate managedObjectContext];
    }
    return context;
}


- (IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)save:(id)sender{
    NSManagedObjectContext *context=[self managedObjectContext];
    if(self.device){
        [_device setValue:self.nameTextField.text forKey:@"name"];
        [_device setValue:self.versionTextField.text forKey:@"version"];
        [_device setValue:self.companyTextField.text forKey:@"company"];
    }
    else{
        //Create a new managed object
        NSManagedObject *newDevice=[NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.nameTextField.text forKey:@"name"];
        [newDevice setValue:self.versionTextField.text forKey:@"version"];
        [newDevice setValue:self.companyTextField.text forKey:@"company"];
    }
    
    
    
    NSError *error=nil;
    if(![context save:&error]){
        NSLog(@"Can't Save! %@ %@",error,[error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
