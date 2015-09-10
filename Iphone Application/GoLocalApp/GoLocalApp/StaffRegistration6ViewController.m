//
//  StaffRegistration6ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration6ViewController.h"
#import "StaffRegistration11ViewController.h"

@interface StaffRegistration6ViewController ()

@end

@implementation StaffRegistration6ViewController


@synthesize  otherServicesDescription, otherServicesWebsite, otherServicesSocialMedia, ScrollView,
firstName, middleName, lastName, nickName, email, password, cellphone, address, city, zipcode, stateSelected,
djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
djDescription, djWebsite, djSocialMedia,
liveBandDescription, liveBandWebsite, liveBandSocialMedia,
cateringCompanyDescription, cateringCompanyWebsite, cateringCompanySocialMedia;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTextFields];
    [self setUpTapGesture];
    
//    if(otherServicesSelected == false){
//        [self determineWhereToGo];
//    }
    
    [self testDataPassed];//testing
}

/* verify required fields */
- (BOOL)verifyDataEnter
{
    BOOL otherServicesDescriptionFilled        = false;
    BOOL otherServicesWebsiteFilled            = false;
    BOOL otherServicesSocialMediaFilled        = false;
    
    if(otherServicesDescription.hasText){
        otherServicesDescriptionFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
        return 0;
    }
    
    if(otherServicesWebsite.hasText){
        otherServicesWebsiteFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
        return 0;
    }
    
    if(otherServicesSocialMedia.hasText){
        otherServicesSocialMediaFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the social media field" and:@"Okay"];
        return 0;
    }
    
    return 1;
}//eom

/*submitting form*/
- (IBAction)submitForm:(id)sender {
    bool results = [self verifyDataEnter];
    if( results)
    {
        [self determineWhereToGo];
    }
}//eom

-(void)determineWhereToGo
{
    //skipping to staff registration 11 controller
    [self performSegueWithIdentifier:@"otherServicesToStaffRegistration11" sender:self];
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"cateringCompanyToStaffRegistration11"]){
        StaffRegistration11ViewController *controller = (StaffRegistration11ViewController *)segue.destinationViewController;
        
        controller.firstName                = self.firstName;                //view controller 1
        controller.middleName               = self.middleName;
        controller.lastName                 = self.lastName;
        controller.nickName                 = self.nickName;
        controller.email                    = self.email;
        controller.password                 = self.password;
        controller.cellphone                = self.cellphone;
        controller.address                  = self.address;                  //view controller 2
        controller.city                     = self.city;
        controller.zipcode                  = self.zipcode;
        controller.stateSelected            = self.stateSelected;
        
        controller.djDescription            = self.djDescription;            //view controller 3
        controller.djWebsite                = self.djWebsite;
        controller.djSocialMedia            = self.djSocialMedia;
        
        controller.liveBandDescription      = self.liveBandDescription;      //view controller 4
        controller.liveBandWebsite          = self.liveBandWebsite;
        controller.liveBandSocialMedia      = self.liveBandSocialMedia;
        
        controller.cateringCompanyDescription   = self.cateringCompanyDescription;  //view controller 5
        controller.cateringCompanyWebsite       = self.cateringCompanyWebsite;
        controller.cateringCompanySocialMedia   = self.cateringCompanySocialMedia;
        
        controller.otherServicesDescription   = self.otherServicesDescription.text;  //view controller 6
        controller.otherServicesWebsite       = self.otherServicesWebsite.text;
        controller.otherServicesSocialMedia   = self.otherServicesSocialMedia.text;

        controller.djSelected               = self.djSelected;
        controller.liveBandSelected         = self.liveBandSelected;
        controller.cateringCompanySelected  = self.cateringCompanySelected;
        controller.otherServicesSelected    = self.otherServicesSelected;
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
            
        }//eom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }//eom

/******** textfields  functions********/
        /* setup textfields */
        -(void) setupTextFields
        {
            //setup of texfields
            self.otherServicesDescription.delegate         = self;
            self.otherServicesWebsite.delegate             = self;
            self.otherServicesSocialMedia.delegate         = self;
        }//eom

        //        /* dimmisses UITextField as soon the background is touched - this will not work with UiScrollview*/
        //        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
        //        {
        //            [djDescription resignFirstResponder];
        //            [djWebsite resignFirstResponder];
        //            [djSocialMedia resignFirstResponder];
        //        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.otherServicesWebsite){
                [self.otherServicesWebsite resignFirstResponder];
                [self.otherServicesSocialMedia becomeFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.otherServicesDescription){
                [self.otherServicesDescription resignFirstResponder];
                [self.otherServicesWebsite becomeFirstResponder];
            }
            else if(textView == self.otherServicesSocialMedia){
                [self.otherServicesSocialMedia resignFirstResponder];
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
            [ScrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [ScrollView setContentOffset:point animated:YES];
        }

        /* textfield */
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }

        /* textview */
        - (BOOL) textViewShouldBeginEditing:(UITextField *)textView
        {
            [self scrollViewAdaptToStartEditingTextField:textView];
            return YES;
        }



-(void)testDataPassed
{
    
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #6 ******");
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
    
//    //view controller 6
//    NSLog(@" otherServicesDescription:  %@", self.otherServicesDescription);
//    NSLog(@" otherServicesWebsite:      %@", self.otherServicesWebsite);
//    NSLog(@" otherServicesSocialMedia:  %@", self.otherServicesSocialMedia);
//    
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
