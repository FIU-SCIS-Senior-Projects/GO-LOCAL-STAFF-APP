//
//  StaffRegistration10ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration9ViewController.h"
#import "StaffRegistration10ViewController.h"

@interface StaffRegistration9ViewController ()
{
    __weak IBOutlet UILabel *chestSizeLabel;
    __weak IBOutlet UILabel *waistSizeLabel;
    __weak IBOutlet UILabel *hipsSizeLabel;
    __weak IBOutlet UILabel *dressSizeLabel;
}
@end

@implementation StaffRegistration9ViewController

@synthesize scrollView, chestSize, waistSize, hipsSize, dressSize,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize,
staffTypeExperience, djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
djCostOfService, liveBandCostOfService, cateringCompanyCostOfService, otherServicesCostOfService,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    
    [self testDataPassed];//testing
}//eom


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    NSString * testing;
    NSString *trimmedString;
    
    testing = self.chestSize.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:chestSize]; //take scroll to textfield so user can see their error
        chestSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please enter your chest size" and:@"Okay"];
        return 0;
    }
    
    testing = self.waistSize.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:waistSize]; //take scroll to textfield so user can see their error
        waistSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please enter your waist size" and:@"Okay"];
        return 0;
    }
    
    
    testing = self.hipsSize.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:hipsSize]; //take scroll to textfield so user can see their error
        hipsSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please enter your hips size" and:@"Okay"];
        return 0;
    }
    
    testing = self.dressSize.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:dressSize]; //take scroll to textfield so user can see their error
        dressSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please enter your dress size" and:@"Okay"];
        return 0;
    }
    
    return 1;
}//eom

/* submmitting form */
- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"goToStaffRegister10a" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields for staffRegistration9");
    }
    
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"goToStaffRegister10a"]){
            StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
    
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
            controller.completeAddress          = self->completeAddress;
            controller.gender                   = self->gender;
            controller.languages                = self->languages;
            
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
            controller.hasDriverLicense         = self->hasDriverLicense;
            controller.hasCommercialLicense     = self->hasCommercialLicense;
            controller.hasTattos                = self->hasTattos;
            controller.hasPiercings             = self->hasPiercings;
            controller.ethnicity                = self.ethnicity;
            controller.height                   = self.height;
            controller.weight                   = self.weight;
            controller.hairColor                = self.hairColor;
            controller.eyeColor                 = self.eyeColor;
            controller.pantSize                 = self.pantSize;
            controller.shoeSize                 = self.shoeSize;
            controller.tshirtSize               = self.tshirtSize;
            
            //view controller 9 data
            controller.chestSize                = self.chestSize.text;
            controller.waistSize                = self.waistSize.text;
            controller.hipsSize                 = self.hipsSize.text;
            controller.dressSize                = self.dressSize.text;
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

/********* tap gestures functions *******/
        /*sets up taps gesture*/
        -(void)setUpTapGesture
        {
            //to dismiss keyboard when a tap is done outside the textfield
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
            [self.view addGestureRecognizer:tap];
            
        }//eoom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }



/******** textfields  functions********/
        /* shows/hides textfield depending if they are filled or empty*/
        - (IBAction)textFieldValueChanged:(id)sender {
            
            //chestSize
            if(self.chestSize.text.length == 0)
            {
                [self->chestSizeLabel setHidden:YES];
            }
            else
            {
                [self->chestSizeLabel setHidden:NO];
            }
            
            //waistSize
            if(self.waistSize.text.length == 0)
            {
                [self->waistSizeLabel setHidden:YES];
            }
            else
            {
                [self->waistSizeLabel setHidden:NO];
            }
            
            //waistSize
            if(self.hipsSize.text.length == 0)
            {
                [self->hipsSizeLabel setHidden:YES];
            }
            else
            {
                [self->hipsSizeLabel setHidden:NO];
            }
            
            
            //waistSize
            if(self.dressSize.text.length == 0)
            {
                [self->dressSizeLabel setHidden:YES];
            }
            else
            {
                [self->dressSizeLabel setHidden:NO];
            }
        }//eom


        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField
        {
            
                if(textField == self.chestSize){
                    [self.chestSize resignFirstResponder];
                    [self.waistSize becomeFirstResponder];
                }
                else if(textField == self.waistSize){
                    [self.waistSize resignFirstResponder];
                    [self.hipsSize becomeFirstResponder];
                }
                else if(textField == self.hipsSize){
                    [self.hipsSize resignFirstResponder];
                    [self.dressSize becomeFirstResponder];
                }
                else if(textField == self.dressSize){
                    [self.dressSize resignFirstResponder];
                }
            
            return YES;
        }//eom

        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }


/********* scrollview functions **********/
        - (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, textField.frame.origin.y - 3 * textField.frame.size.height);
            [scrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [scrollView setContentOffset:point animated:YES];
        }





-(void)testDataPassed
{
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #9 ******");
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
    NSLog(@" pantSize               %@", self.pantSize);
    NSLog(@" shoeSize               %@", self.shoeSize);
    NSLog(@" tshirtSize             %@", self.tshirtSize);
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom


@end
