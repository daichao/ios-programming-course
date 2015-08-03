//
//  DCPaletteViewController.m
//  Colorboard
//
//  Created by bokeadmin on 15/7/8.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import "DCPaletteViewController.h"
#import "DCColorViewController.h"
#import "DCColorDescription.h"
@interface DCPaletteViewController ()
@property(nonatomic)NSMutableArray *colors;

@end

@implementation DCPaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(NSMutableArray*)colors{
    if(!_colors){
        _colors=[NSMutableArray array];
        DCColorDescription *cd=[[DCColorDescription alloc]init];
        [_colors addObject:cd];
    }
    return _colors;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    DCColorDescription *color=self.colors[indexPath.row];
    cell.textLabel.text=color.name;
    return cell;
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"NewColor"]){
        DCColorDescription *color=[[DCColorDescription alloc]init];
        [self.colors addObject:color];
        
        UINavigationController *nc=(UINavigationController*)segue.destinationViewController;
        DCColorViewController *mvc=(DCColorViewController*)[nc topViewController];
        mvc.colorDescription=color;
    }
    else if ([segue.identifier isEqualToString:@"ExistingColor"]){
        NSIndexPath *ip=[self.tableView indexPathForCell:sender];
        DCColorDescription *color=self.colors[ip.row];
        DCColorViewController *cvc=(DCColorViewController *)segue.destinationViewController;
        cvc.colorDescription=color;
        cvc.existingColor=YES;
    }
}



@end
