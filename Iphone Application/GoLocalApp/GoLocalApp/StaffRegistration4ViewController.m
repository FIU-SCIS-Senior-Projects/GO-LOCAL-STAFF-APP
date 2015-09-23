//
//  StaffRegistration3ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration4ViewController.h"
#import "StaffRegistration5ViewController.h"
#import "StaffRegistration6ViewController.h"
#import "StaffRegistration7ViewController.h"
#import "StaffRegistration10ViewController.h"

@interface StaffRegistration4ViewController ()
{
    __weak IBOutlet UILabel *costOfServiceLabel;
}
@end

@implementation StaffRegistration4ViewController

@synthesize scrollView, djDescription, djWebsite, djSocialMedia, costOfServiceTextField,
staffTypeExperience, djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if(djSelected == false){
//        [self determineWhereToGo];
//    }
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    [self testDataPassed];
    
}//eom


/* verify required fields */
- (BOOL)verifyDataEnter
{
    BOOL djDescriptionFilled        = false;
    BOOL djWebsiteFilled            = false;
    BOOL djSocialMediaFilled        = false;
    BOOL djCostofServiceFilled      = false;
    
    if(self.djDescription.hasText){
        djDescriptionFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Please describe the DJ genre" and:@"Okay"];
        return 0;
    }
    
    if(self.djWebsite.hasText){
        djWebsiteFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Please describe your DJ website" and:@"Okay"];
        return 0;
    }
    
    if(self.djSocialMedia.hasText){
        djSocialMediaFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Please describe your DJ social media" and:@"Okay"];
        return 0;
    }
    
    if(self.costOfServiceTextField.hasText){
        djCostofServiceFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Please state your cost of service" and:@"Okay"];
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


/* */
-(void)determineWhereToGo
{
    if(liveBandSelected)
    {
        //moving to the next controller
        [self performSegueWithIdentifier:@"djToLiveBand" sender:self];
    }
    //catering company
    else if(cateringCompanySelected)
    {
        //skipping to catering company controller
        [self performSegueWithIdentifier:@"djToCateringCompany" sender:self];
    }
    //other services
    else if(otherServicesSelected)
    {
        //skipping to Other services controller
        [self performSegueWithIdentifier:@"djToOtherServices" sender:self];
    }
    else
    {
        //skipping to staff registration 11 controller
        [self performSegueWithIdentifier:@"djToStaffRegistration10" sender:self];
    }

}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"djToLiveBand"]){
        StaffRegistration5ViewController *controller = (StaffRegistration5ViewController *)segue.destinationViewController;
        
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
        controller.djDescription            = self.djDescription.text;
        controller.djWebsite                = self.djWebsite.text;
        controller.djSocialMedia            = self.djSocialMedia.text;
        controller.djCostOfService          = self.costOfServiceTextField.text;
        
    }
    else if([segue.identifier isEqualToString:@"djToCateringCompany"]){
        StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
        
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
        controller.djDescription            = self.djDescription.text;
        controller.djWebsite                = self.djWebsite.text;
        controller.djSocialMedia            = self.djSocialMedia.text;
        controller.djCostOfService          = self.costOfServiceTextField.text;
    
    }
    else if([segue.identifier isEqualToString:@"djToOtherServices"]){
        StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
        
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
        controller.djDescription            = self.djDescription.text;
        controller.djWebsite                = self.djWebsite.text;
        controller.djSocialMedia            = self.djSocialMedia.text;
        controller.djCostOfService          = self.costOfServiceTextField.text;
        
    }
    else if([segue.identifier isEqualToString:@"djToStaffRegistration11"]){
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
        controller.djDescription            = self.djDescription.text;
        controller.djWebsite                = self.djWebsite.text;
        controller.djSocialMedia            = self.djSocialMedia.text;
        controller.djCostOfService          = self.costOfServiceTextField.text;
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

        /* shows and hides the label above the textfield depending if the textfield is blank or filled */
        - (IBAction)textFieldValuesChanged:(UITextField *)sender
        {
            int labelID = (int)sender.tag;
            
            if(labelID == 1)
            {
                if(self.costOfServiceTextField.text.length == 0)
                {
                    [self->costOfServiceLabel setHidden:YES];
                }
                else
                {
                    [self->costOfServiceLabel setHidden:NO];
                }
            }

        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.djWebsite){
                [self.djWebsite resignFirstResponder];
                [self.djSocialMedia becomeFirstResponder];
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.djDescription){
                [self.djDescription resignFirstResponder];
                [self.djWebsite becomeFirstResponder];
            }
            else if(textView == self.djSocialMedia){
                [self.djSocialMedia resignFirstResponder];
            }
            return YES;
        }//eom

        /* textfield */
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];//moving scrollview
            return YES;
        }

        /* textview */
        - (BOOL) textViewShouldBeginEditing:(UITextField *)textView
        {
            [self scrollViewAdaptToStartEditingTextField:textView];//moving scrollview
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
    NSLog(@" *****  Staff Registration| View controller #4 ******");
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
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom


@end
