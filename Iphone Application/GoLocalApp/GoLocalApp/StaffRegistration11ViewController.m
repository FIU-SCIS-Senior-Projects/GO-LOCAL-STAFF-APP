//
//  StaffRegistration12ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration11ViewController.h"
#import "StaffRegistration12ViewController.h"

#import "StaffDatabase.h" //needed for Core Data

@interface StaffRegistration11ViewController ()
{
    UIImage *imageSelected;
    StaffDatabase *staffDB;
}
@end

@implementation StaffRegistration11ViewController

@synthesize scrollView, notRequireForRegistrationLabel, headshotImageView,
hasProfessionalInsurance, isIncorporated, ssn, ein, businessName, travelPercentage, desiredHourlyRate, desiredWeeklyRate,
chestSize, waistSize, hipsSize, dressSize,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize,
djCostOfService, liveBandCostOfService, cateringCompanyCostOfService, otherServicesCostOfService,
staffTypeExperience, djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;


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
    
    //creating db helper
    staffDB = [[StaffDatabase alloc] init];
    
    [self testDataPassed];//testing
    
    //showing 'not require for registration' label
    if( self.djSelected || self.liveBandSelected || self.cateringCompanySelected || self.otherServicesSelected )
    {
        [self.notRequireForRegistrationLabel setHidden:NO];
    }
    
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


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    
    //checking a image was selected
    if(self->imageSelected == NULL)
    {
        NSLog(@"NO IMAGE WAS SELECTED");
        
        //the only users allow not have a selfie photo
        if( (self.djSelected == FALSE) &&
           (self.liveBandSelected == FALSE) &&
           ( self.cateringCompanySelected == FALSE) &&
           ( self.otherServicesSelected == FALSE) )
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
        
        //view controller 1 data
        controller.accountType  = self.accountType;
        controller.firstName    = self.firstName;
        controller.middleName   = self.middleName;
        controller.lastName     = self.lastName;
        controller.nickName     = self.nickName;
        controller.email        = self.email;
        controller.password     = self.password;
        controller.dateOfBirth  = self.dateOfBirth;
        
        //view controller 2 data
        controller.cellphone                = self.cellphone;
        controller.completeAddress          = self.completeAddress;
        controller.gender                   = self.gender;
        controller.languages                = self.languages;
        
        //view controller 3 data
        controller.staffTypeExperience      = self.staffTypeExperience;
        controller.djSelected               = self.djSelected;
        controller.liveBandSelected         = self.liveBandSelected;
        controller.cateringCompanySelected  = self.cateringCompanySelected;
        controller.otherServicesSelected    = self.otherServicesSelected;
        
        //view controller 4
        controller.djDescription            = self.djDescription;
        controller.djWebsite                = self.djWebsite;
        controller.djSocialMedia            = self.djSocialMedia;
        controller.djCostOfService          = self.djCostOfService;
        
        //view controller 5
        controller.liveBandDescription      = self.liveBandDescription;
        controller.liveBandWebsite          = self.liveBandWebsite;
        controller.liveBandSocialMedia      = self.liveBandSocialMedia;
        controller.liveBandCostOfService    = self.liveBandCostOfService;
        
        //view controller 6
        controller.cateringCompanyDescription   = self.cateringCompanyDescription;
        controller.cateringCompanyWebsite       = self.cateringCompanyWebsite;
        controller.cateringCompanySocialMedia   = self.cateringCompanySocialMedia;
        controller.cateringCompanyCostOfService = self.cateringCompanyCostOfService;
        
        //view controller 7
        controller.otherServicesDescription     = self.otherServicesDescription;
        controller.otherServicesWebsite         = self.otherServicesWebsite;
        controller.otherServicesSocialMedia     = self.otherServicesSocialMedia;
        controller.otherServicesCostOfService   = self.otherServicesCostOfService;
        
        //view controller 8 data
        controller.hasDriverLicense         = self.hasDriverLicense;
        controller.hasCommercialLicense     = self.hasCommercialLicense;
        controller.hasTattos                = self.hasTattos;
        controller.hasPiercings             = self.hasPiercings;
        controller.ethnicity                = self.ethnicity;
        controller.height                   = self.height;
        controller.weight                   = self.weight;
        controller.hairColor                = self.hairColor;
        controller.eyeColor                 = self.eyeColor;
        controller.pantSize                 = self.pantSize;
        controller.shoeSize                 = self.shoeSize;
        controller.tshirtSize               = self.tshirtSize;
        
        //view controller 9 data
        controller.chestSize                = self.chestSize;
        controller.waistSize                = self.waistSize;
        controller.hipsSize                 = self.hipsSize;
        controller.dressSize                = self.dressSize;
        
        //view controller 10 data
        controller.hasProfessionalInsurance = self.hasProfessionalInsurance;
        controller.isIncorporated           = self.isIncorporated;
        controller.ssn                      = self.ssn;
        controller.ein                      = self.ein;
        controller.businessName             = self.businessName;
        controller.desiredHourlyRate        = self.desiredHourlyRate;
        controller.desiredWeeklyRate        = self.desiredWeeklyRate;
        controller.travelPercentage         = self.travelPercentage;
    }
}//eom
/********* photo functions ******/

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


-(void)testDataPassed
{
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #11 ******");
    //view controller 1
    NSLog(@" account type:    %@", self.accountType);
    NSLog(@" firstName:       %@", self.firstName);
    NSLog(@" middleName:      %@", self.middleName);
    NSLog(@" lastName:        %@", self.lastName);
    NSLog(@" nickName:        %@", self.nickName);
    NSLog(@" email:           %@", self.email);
    NSLog(@" password:        %@", self.password);
    NSLog(@" dob:             %@", self.dateOfBirth);
    //view controller 2
    NSLog(@" cellphone:       %@", self.cellphone);
    NSLog(@" address:         %@", self.completeAddress);
    NSLog(@" gender:          %d", self.gender);//0 female 1 male
    NSLog(@" languages:       %@", self.languages);
    
    //view controller 3
    NSLog(@" staff experience:          %@", self.staffTypeExperience);
    NSLog(@" Dj Selected?               %d", self.djSelected);
    NSLog(@" Live Band Selected?        %d", self.liveBandSelected);
    NSLog(@" Catering Company Selected? %d", self.cateringCompanySelected);
    NSLog(@" Other Services Selected?   %d", self.otherServicesSelected);
    
    //view controller 4
    NSLog(@" djDescription:      %@", self.djDescription);
    NSLog(@" djWebsite:          %@", self.djWebsite);
    NSLog(@" djSocialMedia:      %@", self.djSocialMedia);
    NSLog(@" djCostOfService:    %@", self.djCostOfService);
    
    //view controller 5
    NSLog(@" liveBandDescription:      %@", self.liveBandDescription);
    NSLog(@" liveBandWebsite:          %@", self.liveBandWebsite);
    NSLog(@" liveBandSocialMedia:      %@", self.liveBandSocialMedia);
    NSLog(@" liveBandCostOfService:    %@", self.liveBandCostOfService);
    
    //view controller 6
    NSLog(@" cateringCompanyDescription:      %@", self.cateringCompanyDescription);
    NSLog(@" cateringCompanyWebsite:          %@", self.cateringCompanyWebsite);
    NSLog(@" cateringCompanySocialMedia:      %@", self.cateringCompanySocialMedia);
    NSLog(@" cateringCompanyCostOfService:    %@", self.cateringCompanyCostOfService);
    
    //view controller 7
    NSLog(@" otherServicesDescription:      %@", self.otherServicesDescription);
    NSLog(@" otherServicesWebsite:          %@", self.otherServicesWebsite);
    NSLog(@" otherServicesSocialMedia:      %@", self.otherServicesSocialMedia);
    NSLog(@" otherServicesCostOfService:    %@", self.otherServicesCostOfService);
    
    //view controller 8
    NSLog(@" driver license?        %d", self.hasDriverLicense);
    NSLog(@" commercial license?    %d", self.hasCommercialLicense);
    NSLog(@" tattoos?               %d", self.hasTattos);
    NSLog(@" piercings?             %d", self.hasPiercings);
    NSLog(@" ethnicity              %@", self.ethnicity);
    NSLog(@" height                 %@", self.height);
    NSLog(@" weight                 %@", self.weight);
    NSLog(@" hairColor              %@", self.hairColor);
    NSLog(@" eyeColor              %@", self.eyeColor);
    NSLog(@" pantSize               %@", self.pantSize);
    NSLog(@" shoeSize               %@", self.shoeSize);
    NSLog(@" tshirtSize             %@", self.tshirtSize);
    
    //view controller 9
    NSLog(@" chestSize              %@", self.chestSize);
    NSLog(@" waistSize              %@", self.waistSize);
    NSLog(@" hipsSize               %@", self.hipsSize);
    NSLog(@" dressSize              %@", self.dressSize);
    
    //view controller 10
    NSLog(@" has professional insurance?    %d", self.hasProfessionalInsurance);
    NSLog(@" is Incorporated ?              %d", self.isIncorporated);
    NSLog(@" ssn                            %@", self.ssn);
    NSLog(@" ein                            %@", self.ein);
    NSLog(@" business Name                  %@", self.businessName);
    NSLog(@" desired Hourly Rate            %@", self.desiredHourlyRate);
    NSLog(@" desired Weekly Rate            %@", self.desiredWeeklyRate);
    NSLog(@" travel Percentage              %@", self.travelPercentage);
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom




@end
