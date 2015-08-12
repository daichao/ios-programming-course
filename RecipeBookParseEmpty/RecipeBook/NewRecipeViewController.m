//
//  NewRecipeViewController.m
//  RecipeBook
//
//  Created by bokeadmin on 15/8/11.
//
//

#import "NewRecipeViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "MBProgressHUD.h"
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
    //Create PFObject with recipe information
    PFObject *recipe=[PFObject objectWithClassName:@"Recipe"];
    [recipe setObject:_nameTextField.text forKey:@"name"];
    [recipe setObject:_prepTimeTextField.text forKey:@"prepTime"];
    
    NSArray *ingredients=[_ingredientsTextField.text componentsSeparatedByString:@","];
    [recipe setObject:ingredients forKey:@"ingredients"];
    
    
    //Recipe image
    NSData *imageData=UIImageJPEGRepresentation(_recipeImageView.image, 0.8);
    NSString *filename=[NSString stringWithFormat:@"%@.png",_nameTextField.text];
    PFFile *imageFile=[PFFile fileWithName:filename data:imageData];
    [recipe setObject:imageFile forKey:@"imageFile"];
    
    //show progress
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode=MBProgressHUDModeIndeterminate;
    hud.labelText=@"Uploading";
    [hud show:YES];
    
    //Upload recipe to Parse
    [recipe saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
        [hud hide:YES];
        if (!error) {
            //show success message
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Upload Complete" message:@"Successfully saved the recipe" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            //Notify table view to reload the recipres from Parse cloud
            [[NSNotificationCenter defaultCenter]postNotificationName:@"refreshTable" object:self];
            //dismiss the controller
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Upload Failure" message:[error description] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
    
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


-(void)showPhotoLibary{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]==NO){
        return;
    }
    UIImagePickerController *mediaUI=[[UIImagePickerController alloc]init];
    mediaUI.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    //Displays saved pictures from the Camera Roll album,only allows select the photo
    mediaUI.mediaTypes=@[(NSString*)kUTTypeImage];
    
    mediaUI.allowsEditing=NO;
    mediaUI.delegate=self;
    
    [self.navigationController presentModalViewController:mediaUI animated:YES];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        [self showPhotoLibary];
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *originalImage=(UIImage*)[info objectForKey:UIImagePickerControllerOriginalImage];
    self.recipeImageView.image=originalImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
