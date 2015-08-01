//
//  ViewController.m
//  MyStore
//
//  Created by bokeadmin on 15/7/31.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import "DeviceViewController.h"
#import "DeviceDetailViewController.h"
@interface DeviceViewController ()

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext=[self managedObjectContext];
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc]initWithEntityName:@"Device"];
    self.devices=[[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_devices count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Configure the Cell
    NSManagedObject *device=[self.devices objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@",[device valueForKey:@"name"],[device valueForKey:@"version"]]];
    
    
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@",[device valueForKey:@"company"]]];
    
    return cell;
    
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSManagedObjectContext *context=[self managedObjectContext];
    if(editingStyle==UITableViewCellEditingStyleDelete){
        [context deleteObject:[self.devices objectAtIndex:indexPath.row]];
        
    }
    NSError *error=nil;
    if(![context save:&error]){
        NSLog(@"Can't Delete!%@%@",error ,[error localizedDescription]);
        return;
    }
    
    
    //Remove device from table view
    [self.devices removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"UpdateDevice"]){
        NSManagedObject *selectedDevice=[self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
        DeviceDetailViewController *destViewController=segue.destinationViewController;
        destViewController.device=selectedDevice;
    }
}

@end
