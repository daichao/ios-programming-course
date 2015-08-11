//
//  NewRecipeViewController.m
//  RecipeBook
//
//  Created by bokeadmin on 15/8/11.
//
//

#import "NewRecipeViewController.h"

@interface NewRecipeViewController ()
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *prepTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *ingredientsTextField;
@end

@implementation NewRecipeViewController

-(id)initWithStyle:(UITableViewStyle)style{
    self=[super initWithStyle:style];
    if (self) {
        
    }
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _nameTextField.delegate=self;
    _prepTimeTextField.delegate=self;
    _ingredientsTextField.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)save:(id)sender{
    
}
-(IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidUnload{
    [self setRecipeImageView:nil];
    [self setNameTextField:nil];
    [self setPrepTimeTextField:nil];
    [self setIngredientsTextField:nil];
    [super viewDidUnload];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
