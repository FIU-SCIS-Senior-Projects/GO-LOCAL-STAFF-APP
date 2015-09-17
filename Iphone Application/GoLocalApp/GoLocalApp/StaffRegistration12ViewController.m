//
//  StaffRegistration13ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration12ViewController.h"
#import "StaffRegistration13ViewController.h"

@interface StaffRegistration12ViewController ()

@end

@implementation StaffRegistration12ViewController

@synthesize scrollView,
isIncorporated, ssn, ein, businessName, travelPercentage, desiredHourlyRate, desiredWeeklyRate,
chestSize, waistSize, hipsSize, dressSize,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, pantSize, shoeSize, tshirtSize,
staffTypeExperience,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* in the event is run no camera */
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showAlert:@"Error" withMessage:@"Device has no camera" and:@"OK"];
    }
    
}//eom


-(void)viewDidAppear:(BOOL)animated
{
     [self testDataPassed];//testing
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
    
    NSLog(@"Image needs to be checked");
    
    return 1;
}


- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"staffRegistration13" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
    
}

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration13"])
    {
        StaffRegistration13ViewController *controller = (StaffRegistration13ViewController *)segue.destinationViewController;
        
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
        
        //view controller 8 data
        controller.hasDriverLicense         = self.hasDriverLicense;
        controller.hasCommercialLicense     = self.hasCommercialLicense;
        controller.hasTattos                = self.hasTattos;
        controller.hasPiercings             = self.hasPiercings;
        controller.ethnicity                = self.ethnicity;
        controller.height                   = self.height;
        controller.weight                   = self.weight;
        controller.hairColor                = self.hairColor;
        controller.pantSize                 = self.pantSize;
        controller.shoeSize                 = self.shoeSize;
        controller.tshirtSize               = self.tshirtSize;
        
        //view controller 9 data
        controller.chestSize                = self.chestSize;
        controller.waistSize                = self.waistSize;
        controller.hipsSize                 = self.hipsSize;
        controller.dressSize                = self.dressSize;
        
        //view controller 10 data
        controller.isIncorporated           = self.isIncorporated;
        controller.ssn                      = self.ssn;
        controller.ein                      = self.ein;
        controller.businessName             = self.businessName;
        controller.desiredHourlyRate        = self.desiredHourlyRate;
        controller.desiredWeeklyRate        = self.desiredWeeklyRate;
        controller.travelPercentage         = self.travelPercentage;
        
    
//        controller.djDescription                = self.djDescription;               //view controller 3
//        controller.djWebsite                    = self.djWebsite;
//        controller.djSocialMedia                = self.djSocialMedia;
//        
//        controller.liveBandDescription          = self.liveBandDescription;         //view controller 4
//        controller.liveBandWebsite              = self.liveBandWebsite;
//        controller.liveBandSocialMedia          = self.liveBandSocialMedia;
//        
//        controller.cateringCompanyDescription   = self.cateringCompanyDescription;  //view controller 5
//        controller.cateringCompanyWebsite       = self.cateringCompanyWebsite;
//        controller.cateringCompanySocialMedia   = self.cateringCompanySocialMedia;
//        
//        controller.otherServicesDescription     = self.otherServicesDescription;    //view controller 6
//        controller.otherServicesWebsite         = self.otherServicesWebsite;
//        controller.otherServicesSocialMedia     = self.otherServicesSocialMedia;
//        
//        controller.djSelected                   = self.djSelected;
//        controller.liveBandSelected             = self.liveBandSelected;
//        controller.cateringCompanySelected      = self.cateringCompanySelected;
//        controller.otherServicesSelected        = self.otherServicesSelected;
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
    self.headshotImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



-(void)testDataPassed
{
    
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #12 ******");
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
    NSLog(@" staff experience:      %@", self.staffTypeExperience);
    
    //view controller 8
    NSLog(@" driver license?        %d", self.hasDriverLicense);
    NSLog(@" commercial license?    %d", self.hasCommercialLicense);
    NSLog(@" tattoos?               %d", self.hasTattos);
    NSLog(@" piercings?             %d", self.hasPiercings);
    NSLog(@" ethnicity              %@", self.ethnicity);
    NSLog(@" height                 %@", self.height);
    NSLog(@" weight                 %@", self.weight);
    NSLog(@" hairColor              %@", self.hairColor);
    NSLog(@" pantSize               %@", self.pantSize);
    NSLog(@" shoeSize               %@", self.shoeSize);
    NSLog(@" tshirtSize             %@", self.tshirtSize);
    
    //view controller 9
    NSLog(@" chestSize              %@", self.chestSize);
    NSLog(@" waistSize              %@", self.waistSize);
    NSLog(@" hipsSize               %@", self.hipsSize);
    NSLog(@" dressSize              %@", self.dressSize);
    
    //view controller 10
    NSLog(@" is Incorporated ?      %d", self.isIncorporated);
    NSLog(@" ssn                    %@", self.ssn);
    NSLog(@" ein                    %@", self.ein);
    NSLog(@" business Name          %@", self.businessName);
    NSLog(@" desired Hourly Rate    %@", self.desiredHourlyRate);
    NSLog(@" desired Weekly Rate    %@", self.desiredWeeklyRate);
    NSLog(@" travel Percentage      %@", self.travelPercentage);
    
    NSLog(@" - - - - - - - - - - - - - ");}//eom



@end
