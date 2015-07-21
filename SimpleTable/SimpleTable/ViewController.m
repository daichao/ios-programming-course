//
//  ViewController.m
//  SimpleTable
//
//  Created by bokeadmin on 15/7/20.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableCell.h"
@interface ViewController ()
{
    NSMutableArray *tableData;
    NSArray *thumbnails;
    NSArray *prepTime;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *path=[[NSBundle mainBundle]pathForResource:@"recipes" ofType:@"plist"];
//    NSDictionary *dict=[[NSDictionary alloc]initWithContentsOfFile:path];
//    tableData=[dict objectForKey:@"RecipeName"];
//    thumbnails=[dict objectForKey:@"Thumbnail"];
//    prepTime=[dict objectForKey:@"PrepTime"];
    // Do any additional setup after loading the view, typically from a nib.
    tableData=[NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini",nil];
    thumbnails=[NSArray arrayWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg", @"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg", @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg", @"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg", @"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg", nil];
    prepTime = [NSArray arrayWithObjects:@"30 min", @"30 min", @"20 min", @"30 min", @"10 min", @"1 hour", @"45 min", @"5 min", @"30 min", @"8 min", @"20 min", @"20 min", @"5 min", @"1.5 hour", @"4 hours", @"10 min", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier=@"SimpleTableCell";
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    SimpleTableCell *cell=(SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell==nil){
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    
    
    cell.nameLabel.text=[tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image=[UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text=[prepTime objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *messageAlert=[[UIAlertView alloc]initWithTitle:@"Row selected" message:[tableData objectAtIndex:indexPath.row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [messageAlert show];
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   

}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableData removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}
//
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//     [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

@end
