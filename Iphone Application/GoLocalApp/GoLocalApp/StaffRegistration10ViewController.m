//
//  StaffRegistration9ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration10ViewController.h"
#import "StaffRegistration11ViewController.h"

@interface StaffRegistration10ViewController ()
{

    __weak IBOutlet UILabel *ssnLabel;
    __weak IBOutlet UILabel *businessNameLabel;
    __weak IBOutlet UILabel *employerIdentificationNumberLabel;
    __weak IBOutlet UILabel *desiredHourlyRateLabel;
    __weak IBOutlet UILabel *desiredWeeklyRateLabel;
    
    __weak IBOutlet UILabel *ssnAsteriskLabel;
    __weak IBOutlet UILabel *einAsteriskLabel;
    __weak IBOutlet UILabel *businessNameAsteriskLabel;
    BOOL isIncorporated;
    NSString * travelDesired;
}

@end

@implementation StaffRegistration10ViewController


@synthesize scrollView, travel25percentButton, travel50percentButton, travel75percentButton,
travel100percentButton, hasProfessionalInsuranceSwitch, incorporatedSwitch, ssnTextField, businessNameTextField, einTextField, desiredHourlyRateTextField, desiredWeeklyRateTextField,
chestSize, waistSize, hipsSize, dressSize,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize,
staffTypeExperience, djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
djCostOfService, liveBandCostOfService, cateringCompanyCostOfService, otherServicesCostOfService,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}//EOM

-(void)viewDidAppear:(BOOL)animated
{
    [self testDataPassed];//testing
    
    [self setUpTapGesture];
}//eom

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString ;
    
        if(self->isIncorporated)
        {
            NSLog(@"checking for Incorporated");
            
            testing = self.einTextField.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:self.einTextField]; //take scroll to textfield so user can see their error
                self.einTextField.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your Employer identification Number" and:@"Okay"];
                return 0;
            }
            
            testing = self.businessNameTextField.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:self.businessNameTextField]; //take scroll to textfield so user can see their error
                self.businessNameTextField.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your Business Name" and:@"Okay"];
                return 0;
            }

        }
        else
        {
            NSLog(@"checking for NOT Incorporated");
            
            testing = self.ssnTextField.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:self.ssnTextField]; //take scroll to textfield so user can see their error
                self.ssnTextField.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your Social Security Number " and:@"Okay"];
                return 0;
            }

        }

 
    return 1;
}

/* submmitting form */
- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        //    moving to the next controller
        [self performSegueWithIdentifier:@"goToStaffRegister11" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields staffRegistration10");
    }
}//eoa

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToStaffRegister11"]){
        StaffRegistration11ViewController *controller = (StaffRegistration11ViewController *)segue.destinationViewController;
        
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
        controller.hasProfessionalInsurance = self.hasProfessionalInsuranceSwitch.on;
        controller.isIncorporated           = self->isIncorporated;
        controller.ssn                      = self.ssnTextField.text;
        controller.ein                      = self.einTextField.text;
        controller.businessName             = self.businessNameTextField.text;
        controller.desiredHourlyRate        = self.desiredHourlyRateTextField.text;
        controller.desiredWeeklyRate        = self.desiredWeeklyRateTextField.text;
        controller.travelPercentage         = self->travelDesired;
        
    }
    
}//eom



/* shows/hides the incorporated values depending on the switch selection */
- (IBAction)incorporatedValueChanged:(UISwitch *)sender
{
    if(self.incorporatedSwitch.on)
    {
        //hiding textfields
        [self.ssnTextField setHidden:YES];
        
        //hiding labels
        [self->ssnLabel setHidden:YES];
        [self->ssnAsteriskLabel setHidden:YES];
        
        //displaying textfields
        [self.einTextField setHidden:NO];
        [self.businessNameTextField setHidden:NO];
        
        //displaying labels
        [self->businessNameLabel setHidden:NO];
        [self->employerIdentificationNumberLabel setHidden:NO];
        [self->einAsteriskLabel setHidden:NO];
        [self->businessNameAsteriskLabel setHidden:NO];
    }
    else
    {
        //hiding textfields
        [self.einTextField setHidden:YES];
        [self.businessNameTextField setHidden:YES];
        
       
        //hiding labels
        [self->employerIdentificationNumberLabel setHidden:YES];
        [self->businessNameLabel setHidden:YES];
        [self->einAsteriskLabel setHidden:YES];
        [self->businessNameAsteriskLabel setHidden:YES];
        
        //displaying textfields
        [self.ssnTextField setHidden:NO];
        
        //displaying labels
        [self->ssnLabel setHidden:NO];
        [self->ssnAsteriskLabel setHidden:NO];
    }
}//eo-action

/* updates the select of desired travel percentages and disables all other travel percentage buttons */
- (IBAction)travelPercentValueChanged:(UIButton *)sender
{
    int travelValue = (int) sender.tag;
    
    if(travelValue == 25)//  25% travel
    {
        //enabling 25% button
        self.travel25percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel25percentButton.layer.borderWidth = 4.5f;
        self.travel25percentButton.layer.cornerRadius = 10.0f;
        
        //disabling all travel percentages buttons
        self.travel50percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel50percentButton.layer.borderWidth = 0.0f;
        self.travel50percentButton.layer.cornerRadius = 0.0f;
        
        self.travel75percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel75percentButton.layer.borderWidth = 0.0f;
        self.travel75percentButton.layer.cornerRadius = 0.0f;
       
        self.travel100percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel100percentButton.layer.borderWidth = 0.0f;
        self.travel100percentButton.layer.cornerRadius = 0.0f;
        
        self->travelDesired = @"25";
    }
    else if(travelValue == 50) // 50% travel
    {
        //enabling 50% button
        self.travel50percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel50percentButton.layer.borderWidth = 4.5f;
        self.travel50percentButton.layer.cornerRadius = 10.0f;
        
        //disabling all travel percentages buttons
        self.travel25percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel25percentButton.layer.borderWidth = 0.0f;
        self.travel25percentButton.layer.cornerRadius = 0.0f;
        
        self.travel75percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel75percentButton.layer.borderWidth = 0.0f;
        self.travel75percentButton.layer.cornerRadius = 0.0f;
        
        self.travel100percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel100percentButton.layer.borderWidth = 0.0f;
        self.travel100percentButton.layer.cornerRadius = 0.0f;
        
        self->travelDesired = @"50";
    }
    else if(travelValue == 75) // 75% travel
    {
        //enabling 75% button
        self.travel75percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel75percentButton.layer.borderWidth = 4.5f;
        self.travel75percentButton.layer.cornerRadius = 10.0f;
        
        //disabling all travel percentages buttons
        self.travel25percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel25percentButton.layer.borderWidth = 0.0f;
        self.travel25percentButton.layer.cornerRadius = 0.0f;
        
        self.travel50percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel50percentButton.layer.borderWidth = 0.0f;
        self.travel50percentButton.layer.cornerRadius = 0.0f;
        
        self.travel100percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel100percentButton.layer.borderWidth = 0.0f;
        self.travel100percentButton.layer.cornerRadius = 0.0f;
        
        self->travelDesired = @"75";
    }
    else if(travelValue == 100) // 100% travel
    {
        //enabling 100% button
        self.travel100percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel100percentButton.layer.borderWidth = 4.5f;
        self.travel100percentButton.layer.cornerRadius = 10.0f;
        
        //disabling all travel percentages buttons
        self.travel25percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel25percentButton.layer.borderWidth = 0.0f;
        self.travel25percentButton.layer.cornerRadius = 0.0f;
        
        self.travel50percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel50percentButton.layer.borderWidth = 0.0f;
        self.travel50percentButton.layer.cornerRadius = 0.0f;
        
        self.travel75percentButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.travel75percentButton.layer.borderWidth = 0.0f;
        self.travel75percentButton.layer.cornerRadius = 0.0f;
        
        self->travelDesired = @"100";
    }
}//eo-action

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

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField
        {
            
            if(textField == self.ssnTextField){
                [self.ssnTextField resignFirstResponder];
            }
            else if(textField == self.businessNameTextField){
                [self.businessNameTextField resignFirstResponder];
                [self.einTextField becomeFirstResponder];
            }
            else if(textField == self.einTextField){
                [self.einTextField resignFirstResponder];
            }
            else if(textField == self.desiredHourlyRateTextField){
                [self.desiredHourlyRateTextField resignFirstResponder];
            }
            
            else if(textField == self.desiredWeeklyRateTextField){
                [self.desiredWeeklyRateTextField resignFirstResponder];
            }
            
            return YES;
        }//eom

        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];//moving scrollview
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
    NSLog(@" *****  Staff Registration| View controller #10 ******");
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
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom


@end
