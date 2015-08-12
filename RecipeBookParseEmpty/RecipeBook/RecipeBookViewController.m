//
//  RecipeBookViewController.m
//  RecipeBook
//
//  Created by Simon Ng on 14/6/12.
//  Copyright (c) 2012 Appcoda. All rights reserved.
//

#import "RecipeBookViewController.h"
#import "RecipeDetailViewController.h"
#import "Recipe.h"

@interface RecipeBookViewController ()

@end

@implementation RecipeBookViewController {
//    NSArray *recipes;
}



-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        //the classname to query on
        self.parseClassName=@"Recipe";
        //the key of the pfobject to display in the label of the default cell style
        self.textKey=@"name";
        //whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled=YES;
        // Whether the built-in pagination is enabled
        self.paginationEnabled=YES;
        // The number of objects to show per page
        self.objectsPerPage=10;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshTable:) name:@"refreshTable" object:nil];
    
}

-(void)refreshTable:(NSNotification*)notification{
    [self loadObjects];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"refreshTable" object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(PFQuery*)queryForTable{
    PFQuery *query=[PFQuery queryWithClassName:self.parseClassName];
    query.cachePolicy=kPFCachePolicyCacheThenNetwork;
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //Configure the cell
    PFFile *thumbnail=[object objectForKey:@"imageFile"];
    PFImageView *thumbnailImageView=(PFImageView*)[cell viewWithTag:100];
    thumbnailImageView.image=[UIImage imageNamed:@"placeholder.jpg"];
    thumbnailImageView.file=thumbnail;
    [thumbnailImageView loadInBackground];
    
    UILabel *nameLabel=(UILabel*)[cell viewWithTag:101];
    nameLabel.text=[object objectForKey:@"name"];
    
    UILabel *prepTimeLabel=(UILabel*)[cell viewWithTag:102];
    prepTimeLabel.text=[object objectForKey:@"prepTime"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    PFObject *object=[self.objects objectAtIndex:indexPath.row];
    [object deleteInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
        [self refreshTable:nil];
    }];
}

-(void)objectsDidLoad:(nullable NSError *)error{
    [super objectsDidLoad:error];
    NSLog(@"error:%@",[error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        PFObject *object=[self.objects objectAtIndex:indexPath.row];
        Recipe *recipe=[[Recipe alloc]init];
        recipe.name = [object objectForKey:@"name"];
        recipe.imageFile = [object objectForKey:@"imageFile"];
        recipe.prepTime = [object objectForKey:@"prepTime"];
        recipe.ingredients = [object objectForKey:@"ingredients"];
        destViewController.recipe = recipe;
    }
}


@end
