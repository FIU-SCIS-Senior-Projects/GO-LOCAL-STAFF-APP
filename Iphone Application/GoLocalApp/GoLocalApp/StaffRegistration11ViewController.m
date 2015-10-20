//
//  StaffRegistration12ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration11ViewController.h"
#import "StaffRegistration12ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

#import "StaffDatabase.h" //needed for Core Data

@interface StaffRegistration11ViewController ()
{
    UIImage *imageSelected;
    StaffDatabase *staffDB;
    BOOL djSelected;
    BOOL liveBandSelected;
    BOOL cateringCompanySelected;
    BOOL otherServicesSelected;

}
@end

@implementation StaffRegistration11ViewController

@synthesize scrollView, registeredStaff,
notRequireForRegistrationLabel, headshotImageView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* in the event is run no camera */
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
         [self showAlert:@"Error" withMessage:@"Device has no camera" and:@"OK"];
    }
    

    
}//eom


-(void)viewDidAppear:(BOOL)animated
{
//    [registeredStaff printUserData];//testing
    
    djSelected                =   [registeredStaff isDJ];
    liveBandSelected          =   [registeredStaff isLiveBand];
    cateringCompanySelected   =   [registeredStaff isCateringCompany];
    otherServicesSelected     =   [registeredStaff isOtherServices];
    
    
    NSLog(@"services selection dj = %d | liveband = %d | catering = %d | other = %d", self->djSelected , self->liveBandSelected, self->cateringCompanySelected, self->otherServicesSelected);
    
    
    NSLog(@"ACTUAL services selection dj = %d | liveband = %d | catering = %d | other = %d", [registeredStaff isDJ] , [registeredStaff isLiveBand], [registeredStaff isCateringCompany], [registeredStaff isOtherServices] );
    //creating db helper
    staffDB = [[StaffDatabase alloc] init];
    
    //showing 'not require for registration' label
    if( self->djSelected || self->liveBandSelected || self->cateringCompanySelected || self->otherServicesSelected )
    {
        [self.notRequireForRegistrationLabel setHidden:NO];
    }
    
}//eom


#pragma mark - helper functions
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


#pragma mark -  verify data
    /* verifying the required input fileds */
    - (BOOL)verifyDataEnter
    {
        
        //checking a image was selected
        if(self->imageSelected == NULL)
        {
            NSLog(@"NO IMAGE WAS SELECTED");
            
            //the only users allow not have a selfie photo
            if( !(self->djSelected) &&
               !(self->liveBandSelected) &&
               !(self->cateringCompanySelected) &&
               !(self->otherServicesSelected)
              )
            {
                
                [self showAlert:@"Registration Field" withMessage:@"Please take a Selfie or select a existing selfie (Headshot)  Image" and:@"Okay"];
                
                return 0;
            }
        }
        else
        {
            //save Image To Core Data
            [staffDB saveSelfieImage:self->imageSelected];
        }
       
        return 1;
    }//eom


#pragma mark - sending data
    - (IBAction)submitForm:(id)sender
    {
        //verifying the data enter
        bool result = [self verifyDataEnter];
        if(result)
        {
            [self performSegueWithIdentifier:@"goToStaffRegister12" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields Staff Register12");
        }
    }//eoa

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        if([segue.identifier isEqualToString:@"goToStaffRegister12"]){
            StaffRegistration12ViewController *controller = (StaffRegistration12ViewController *)segue.destinationViewController;
      
             controller.registeredStaff = registeredStaff;
        }
    }//eom

#pragma mark - photo functions

    - (IBAction)takePhoto:(id)sender
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];

    }//eo-action


    - (IBAction)selectExistingPhoto:(id)sender
    {
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
        self.headshotImageView.image = chosenImage;
        
        //saving image to local uiimage to be later stored in Core data
        self->imageSelected = chosenImage;
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }

    - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
        
    }





@end
