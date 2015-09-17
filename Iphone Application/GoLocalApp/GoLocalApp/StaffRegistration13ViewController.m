//
//  StaffRegistration14ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration13ViewController.h"
#import "StaffRegistration14ViewController.h"

@interface StaffRegistration13ViewController ()

@end

@implementation StaffRegistration13ViewController

@synthesize scrollView, wantsDirectDeposit, DirectDepositRoutingNumber, DirectDepositAccountNumber,
isIncorporated, ssn, ein, businessName, travelPercentage, desiredHourlyRate, desiredWeeklyRate,
chestSize, waistSize, hipsSize, dressSize,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, pantSize, shoeSize, tshirtSize,
staffTypeExperience,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    [self testDataPassed];//testing
}//eom

/* */
- (IBAction)directDepositSelectionChanged:(id)sender
{
    if(!self.wantsDirectDeposit.on){
        [self showAlert:@"Registration Field" withMessage:@"Our Apologies but at the moment we only support direct deposit. More options and features coming soon!" and:@"Okay"];
        [self.wantsDirectDeposit setOn:true];
    }
}//eo-action


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    NSString * testing;
    NSString *trimmedString;

    //checking direct deposit fields are NOT empty
        if(self.wantsDirectDeposit.on){
                testing = self.DirectDepositRoutingNumber.text;
                trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
                if ([trimmedString isEqualToString:@""]) {
                    [self scrollVievEditingFinished:DirectDepositRoutingNumber]; //take scroll to textfield so user can see their error
                    self.DirectDepositRoutingNumber.text =@""; //clearing field
                    // it's empty or contains only white spaces
                    [self showAlert:@"Registration Field" withMessage:@"Missing the 'Routing Number' field" and:@"Okay"];
                    return 0;
                }

                testing = self.DirectDepositAccountNumber.text;
                trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
                if ([trimmedString isEqualToString:@""]) {
                    self.DirectDepositAccountNumber.text =@""; //clearing field
                    // it's empty or contains only white spaces
                    [self showAlert:@"Registration Field" withMessage:@"Missing the 'Account Number' field" and:@"Okay"];
                    return 0;
                }
        }//eo-direct deposit

    
    return 1;
}


- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"goToStaffRegister14" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields StaffRegister 13 ");
    }
    
}//eo-action


/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToStaffRegister14"]){
        StaffRegistration14ViewController *controller = (StaffRegistration14ViewController *)segue.destinationViewController;
        
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
 
        
        //view controller 13
        controller.directDepositDesired         = self.wantsDirectDeposit.on;
        controller.DirectDepositRoutingNumber   = self.DirectDepositRoutingNumber.text;
        controller.DirectDepositAccountNumber   = self.DirectDepositAccountNumber.text;
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



        //        /* dimmisses UITextField as soon the background is touched - this will not work with UiScrollview*/
        //        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
        //        {
        //            [firstName resignFirstResponder];
        //            [middleName resignFirstResponder];
        //            [lastName resignFirstResponder];
        //            [nickName resignFirstResponder];
        //            [email resignFirstResponder];
        //            [confirmEmail resignFirstResponder];
        //            [password resignFirstResponder];
        //            [confirmPassword resignFirstResponder];
        //            [cellphone resignFirstResponder];
        //        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.DirectDepositRoutingNumber){
                [self.DirectDepositRoutingNumber resignFirstResponder];
                [self.DirectDepositAccountNumber becomeFirstResponder];
            }
            else if(textField == self.DirectDepositAccountNumber){
                [self.DirectDepositAccountNumber resignFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom


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

        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }



-(void)testDataPassed
{
    
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #13 ******");
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
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom

@end
