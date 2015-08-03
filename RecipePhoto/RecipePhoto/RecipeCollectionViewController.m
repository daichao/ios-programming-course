//
//  RecipeCollectionViewController.m
//  RecipePhoto
//
//  Created by daichao on 15/8/1.
//  Copyright (c) 2015年 daichao. All rights reserved.
//

#import "RecipeCollectionViewController.h"
#import "RecipeCollectionHeaderView.h"
#import "RecipeViewController.h"

@interface RecipeCollectionViewController (){
    NSArray *recipePhotos;
    BOOL shareEnabled;
    NSMutableArray *selectedRecipes;
}

@end

@implementation RecipeCollectionViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedRecipes=[NSMutableArray array];
    NSArray *mainDishImages = [NSArray arrayWithObjects:@"egg_benedict.jpg", @"full_breakfast.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", nil];
    NSArray *drinkDessertImages = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"green_tea.jpg", @"starbucks_coffee.jpg", @"white_chocolate_donut.jpg", nil];
    recipePhotos = [NSArray arrayWithObjects:mainDishImages, drinkDessertImages, nil];
    UICollectionViewFlowLayout *collectionViewLayout=(UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset=UIEdgeInsetsMake(20, 0, 20, 0);//(top,left,bottom,right)
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [recipePhotos count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[recipePhotos objectAtIndex:section]count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%li", indexPath.section + 1];
        headerView.title.text = title;
        UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
        headerView.backgroundImage.image = headerImage;
        
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        
        reusableview = footerview;
    }
    
    return reusableview;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier=@"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView=(UIImageView*)[cell viewWithTag:100];
    recipeImageView.image=[UIImage imageNamed:[recipePhotos[indexPath.section] objectAtIndex:indexPath.row]];
    // Configure the cell
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
    cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pic_frame.png"]];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showRecipePhoto"]) {
        NSArray *indexPaths=[self.collectionView indexPathsForSelectedItems];
        RecipeViewController *destViewController=segue.destinationViewController;
        NSIndexPath *indexPath=[indexPaths objectAtIndex:0];
        destViewController.recipeImageName=[recipePhotos[indexPath.section] objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        
    }
}
#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (shareEnabled) {
        NSString *selectedRecipe=[recipePhotos[indexPath.section] objectAtIndex:indexPath.row];
        [selectedRecipes addObject:selectedRecipe];
    }
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (shareEnabled) {
        NSString *deselectedRecipe=[recipePhotos[indexPath.section]objectAtIndex:indexPath.row];
        [selectedRecipes removeObject:deselectedRecipe];
    }
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (shareEnabled) {
        return NO;
    } else {
        return YES;
    }
}

- (IBAction)shareButtonTouched:(id)sender {
    if (shareEnabled) {
        
        // Post selected photos to Facebook
        if ([selectedRecipes count] > 0) {
            if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                
                [controller setInitialText:@"Check out my recipes!"];
                for (NSString *recipePhoto in selectedRecipes) {
                    [controller addImage:[UIImage imageNamed:recipePhoto]];
                }
                
                [self presentViewController:controller animated:YES completion:Nil];
            }
        }
        
        // Deselect all selected items
        for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        // Remove all items from selectedRecipes array
        [selectedRecipes removeAllObjects];
        
        // Change the sharing mode to NO
        shareEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        self.shareButton.title = @"Share";
        [self.shareButton setStyle:UIBarButtonItemStylePlain];
        
    } else {
        
        // Change shareEnabled to YES and change the button text to DONE
        shareEnabled = YES;
        self.collectionView.allowsMultipleSelection = YES;
        self.shareButton.title = @"Upload";
        [self.shareButton setStyle:UIBarButtonItemStyleDone];
        
    }
    
}



@end
