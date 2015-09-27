//
//  StaffRegistration13ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration12ViewController.h"
#import "StaffRegistration13ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

#import "StaffDatabase.h" //needed for Core Data

@interface StaffRegistration12ViewController ()
{
    UIImage *imageSelected;
     StaffDatabase *staffDB;
}
@end

@implementation StaffRegistration12ViewController

@synthesize scrollView, registeredStaff,
bodyImageView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* in the event is run no camera */
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showAlert:@"Error" withMessage:@"Device has no camera" and:@"OK"];
    }
    
}//eom


-(void)viewDidAppear:(BOOL)animated
{
    
    [registeredStaff printUserData];//testing
    
    //creating db helper
    staffDB = [[StaffDatabase alloc] init];
    
}//eom

/* create UIAlert*/
-(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
{
    
    //creating UIAlert
    UIAlertView * alert =[[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles: nil];
    [alert show];//display alert
}//eom


/* verifying the required input fields */
- (BOOL)verifyDataEnter
{
    //checking a image was selected
    if(self->imageSelected == NULL)
    {
        NSLog(@"NO IMAGE WAS SELECTED");
    }
    else
    {
        //saving photo on database
        BOOL imageSavedResults = [staffDB saveBodyImage:self->imageSelected];
        NSLog(@"body image succesfully saved? %d", imageSavedResults);
    }
    
    return 1;
}//eom


- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"goToStaffRegister13" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
    
}

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToStaffRegister13"])
    {
        StaffRegistration13ViewController *controller = (StaffRegistration13ViewController *)segue.destinationViewController;
        
         controller.registeredStaff = registeredStaff;
    }
}//eom

/********* photo functions ******/

    - (IBAction)takePhoto:(id)sender {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
        
    }//eo-action


    - (IBAction)selectExistingPhoto:(id)sender {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }//eo-action

    #pragma mark - Image Picker Controller delegate methods
    - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
        
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        
        //updating image view with image
        self.bodyImageView.image = chosenImage;
        
        //saving image to local uiimage to be later stored in Core data
        self->imageSelected = chosenImage;

        [picker dismissViewControllerAnimated:YES completion:NULL];
        
    }

    - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
        
    }



@end
