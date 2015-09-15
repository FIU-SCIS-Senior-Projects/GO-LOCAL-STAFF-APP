//
//  StaffRegistration7ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration7ViewController.h"
#import "StaffRegistration8ViewController.h"

@interface StaffRegistration7ViewController ()

@end

@implementation StaffRegistration7ViewController



@synthesize dob,dateOfBirth,  maleSwitch, gender, femaleSwitch, firstLanguage, secondLanguage, addtLanguage, scrollView, languages,
        address, city, zipcode, stateSelected, firstName, middleName, lastName, nickName, email, password, cellphone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self setupTextFields];
        [self setUpTapGesture];
    
    [self testDataPassed];//testing
}//eom

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{    
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    
    NSString * testing = self.firstLanguage.text;
    NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:firstLanguage]; //take scroll to textfield so user can see their error
        firstLanguage.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Missing the first language field" and:@"Okay"];
        return 0;
    }
    
    testing = self.secondLanguage.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        secondLanguage.text =@""; //clearing field
    }
    
    testing = self.addtLanguage.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        addtLanguage.text =@""; //clearing field
    }
    
    //putting languages together
    self.languages = [self.firstLanguage.text stringByAppendingFormat:@" %@ %@", self.secondLanguage.text, self.addtLanguage.text];
    
//        NSLog(@"appending languages:");
//        NSLog(@"%@", self.languages);
    
    //check the date selected
    //self.dateOfBirth;
    if( [self.dateOfBirth length] < 1)
    {
        [self showAlert:@"Registration Field" withMessage:@"Missing the date of birth field" and:@"Okay"];
        return 0;
    }//
    
    return 1;
}//eom

/* submmitting form */
- (IBAction)submitForm:(id)sender
{
        //verifying the data enter
        bool result = [self verifyDataEnter];
        if(result)
        {
            //    moving to the next controller
            [self performSegueWithIdentifier:@"staffRegistration8" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields");
        }
}//eom

/*datePicker - runs when the value has been updated */
- (IBAction)datePickerValueChanged:(id)sender {
    
    //converted needed for nsstring
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd-yyyy"];
    
    //Optionally for time zone conversions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];

    NSDate *selectedDate = [sender date]; //getting date from datepicker
    self.dateOfBirth = [formatter stringFromDate:selectedDate];
    
//    NSLog(@"Date selected %@",[formatter stringFromDate:selectedDate]); //testing
    
}//eom

- (IBAction)maleSwitchChanged:(id)sender {
    if(self.maleSwitch.on){
        [self.femaleSwitch setOn:false];
        self.gender = true;
    }
    else {
        [self.femaleSwitch setOn:true];
         self.gender = false;
    }
    NSLog(@"gender changed to %s", self.gender ? "true": "false");
}//eo-action

- (IBAction)femaleSwitchChanged:(id)sender {
    if(self.femaleSwitch.on){
        [self.maleSwitch setOn:false];
         self.gender = false;
    }
    else {
        [self.maleSwitch setOn:true];
         self.gender = true;
    }
    
    NSLog(@"gender changed to %s", self.gender ? "true": "false");
}//eo-action


/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration8"]){
        StaffRegistration8ViewController *controller = (StaffRegistration8ViewController *)segue.destinationViewController;
        //view controller 1 & 2 data
        
        controller.firstName                = self.firstName;
        controller.middleName               = self.middleName;
        controller.lastName                 = self.lastName;
        controller.nickName                 = self.nickName;
        controller.email                    = self.email;
        controller.password                 = self.password;
        controller.cellphone                = self.cellphone;
        controller.address                  = self.address;
        controller.city                     = self.city;
        controller.zipcode                  = self.zipcode;
        controller.stateSelected            = self.stateSelected;
        controller.djSelected               = self.djSelected;
        controller.liveBandSelected         = self.liveBandSelected;
        controller.cateringCompanySelected  = self.cateringCompanySelected;
        controller.otherServicesSelected    = self.otherServicesSelected;

        
        controller.dob                      = self.dateOfBirth;
        controller.gender                   = self.gender;
        controller.languages                = self.languages;
        
//        NSLog(@" sending gender: %s", gender ? "true":"false");
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

    /* setup textfields */
    -(void) setupTextFields
    {
        //setup of texfields
        self.firstLanguage.delegate         = self;
        self.secondLanguage.delegate        = self;
        self.addtLanguage.delegate          = self;
        
    }//eom


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
        
        if(textField == self.firstLanguage){
            [self.firstLanguage resignFirstResponder];
            [self.secondLanguage becomeFirstResponder];
        }
        else if(textField == self.secondLanguage){
            [self.secondLanguage resignFirstResponder];
            [self.addtLanguage becomeFirstResponder];
        }
        else if(textField == self.addtLanguage){
            [self.addtLanguage resignFirstResponder];
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
    NSLog(@" *****  Staff Registration| View controller #7 ******");
    //view controller 1
    NSLog(@" firstName:       %@", self.firstName);
    NSLog(@" middleName:      %@", self.middleName);
    NSLog(@" lastName:        %@", self.lastName);
    NSLog(@" nickName:        %@", self.nickName);
    NSLog(@" email:           %@", self.email);
    NSLog(@" password:        %@", self.password);
    NSLog(@" cellphone:       %@", self.cellphone);
    
    //view controller 2
    NSLog(@" address:                   %@", self.address);
    NSLog(@" city:                      %@", self.city);
    NSLog(@" zipcode:                   %@", self.zipcode);
    NSLog(@" stateSelected:             %@", self.stateSelected);
    NSLog(@" djSelected:                %d", self.djSelected);
    NSLog(@" liveBandSelected:          %d", self.liveBandSelected);
    NSLog(@" djSelected:                %d", self.djSelected);
    NSLog(@" cateringCompanySelected:   %d", self.cateringCompanySelected);
    NSLog(@" otherServicesSelected:     %d", self.otherServicesSelected);
    
    //view controller 3 - DJ only
    
    NSLog(@" djDescription:     %@", self.djDescription);
    NSLog(@" djWebsite:         %@", self.djWebsite);
    NSLog(@" djSocialMedia:     %@", self.djSocialMedia);
    
    //view controller 4 - Live Band Only
    
    NSLog(@" liveBandDescription:   %@", self.liveBandDescription);
    NSLog(@" liveBandWebsite:       %@", self.liveBandWebsite);
    NSLog(@" liveBandSocialMedia:   %@", self.liveBandSocialMedia);
    
    //view controller 5 - Catering Company Only
    NSLog(@" cateringCompanyDescription:    %@", self.cateringCompanyDescription);
    NSLog(@" cateringCompanyWebsite:        %@", self.cateringCompanyWebsite);
    NSLog(@" cateringCompanySocialMedia:    %@", self.cateringCompanySocialMedia);
    
    //view controller 6
    NSLog(@" otherServicesDescription:  %@", self.otherServicesDescription);
    NSLog(@" otherServicesWebsite:      %@", self.otherServicesWebsite);
    NSLog(@" otherServicesSocialMedia:  %@", self.otherServicesSocialMedia);
    
//    //view controller 7
//    NSLog(@" dob:       %@", self.dob);
//    NSLog(@" gender:    %d", self.gender);// 0-female 1-male
//    NSLog(@" languages: %@", self.languages);
//    
//    //view controller 8
//    NSLog(@" ethnicity:     %d", self.ethnicity);//see db legend
//    NSLog(@" typeOfLicense: %d", self.typeOfLicense);//0-driver 1-commercial
//    
//    //view controller 9
//    NSLog(@" height:            %@", self.height);
//    NSLog(@" weight:            %@", self.weight);
//    NSLog(@" hairColor:         %@", self.hairColor);
//    NSLog(@" eyeColor:          %@", self.eyeColor);
//    NSLog(@" pantSize:          %@", self.pantSize);
//    NSLog(@" shoeSize:          %@", self.shoeSize);
//    NSLog(@" tshirtSize:        %@", self.tshirtSize);
//    NSLog(@" desiredHourlyRate: %@", self.desiredHourlyRate);
//    NSLog(@" desiredWeeklyRate: %@", self.desiredWeeklyRate);
//    NSLog(@" tattoos:           %d", self.tattoos);//0 - no | 1 - yes
//    NSLog(@" piercings:         %d", self.piercings);//0 - no | 1 - yes
//    
//    //view controller 10 - females ONLY
//    NSLog(@" chestSize: %@", self.chestSize);
//    NSLog(@" waistSize: %@", self.waistSize);
//    NSLog(@" hipsSize: %@", self.hipsSize);
//    NSLog(@" dressSize: %@", self.dressSize);
//    
//    //view controller 11
//    NSLog(@" typeCorporated:        %d", self.typeCorporated);//0-not incorporated| 1- corporated
//    NSLog(@" ssn:                   %@", self.ssn);//NotIncorporated field
//    NSLog(@" ein:                   %@", self.ein);         //incorporated field
//    NSLog(@" businessName:          %@", self.businessName);//incorporated field
//    NSLog(@" citiesWillingToWork:   %@", self.citiesWillingToWork);
//    NSLog(@" travel:                %d", self.travel);
//    NSLog(@" professionalInsurance: %d", self.professionalInsurance);
//    
//    
//    //view controller 14
//    NSLog(@" directDepositDesired:          %d", self.directDepositDesired);
//    NSLog(@" DirectDepositRoutingNumber:    %@", self.DirectDepositRoutingNumber);
//    NSLog(@" DirectDepositAccountNumber:    %@", self.DirectDepositAccountNumber);
//    
//    //view controller 15
//    NSLog(@" isModel:                   %d", self.isModel);
//    NSLog(@" isBrandAmbassador:         %d", self.isBrandAmbassador);
//    NSLog(@" isFlyerDistributor:        %d", self.isFlyerDistributor);
//    NSLog(@" isFieldMarketingManager:   %d", self.isFieldMarketingManager);
//    NSLog(@" isDancer:                  %d", self.isDancer);
//    NSLog(@" iswaiterOrWaitress:        %d", self.iswaiterOrWaitress);
//    NSLog(@" isProductionAssistant:     %d", self.isProductionAssistant);
//    NSLog(@" isSalesExecutive:          %d", self.isSalesExecutive);
//    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end