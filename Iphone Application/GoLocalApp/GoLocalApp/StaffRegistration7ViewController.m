//
//  StaffRegistration6ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration7ViewController.h"
#import "StaffRegistration10ViewController.h"

@interface StaffRegistration7ViewController ()
{
    __weak IBOutlet UILabel *costOfServiceLabel;
}
@end

@implementation StaffRegistration7ViewController


@synthesize  scrollView, otherServicesDescription, otherServicesWebsite, otherServicesSocialMedia, costOfServiceTextField,
cateringCompanyDescription, cateringCompanyWebsite, cateringCompanySocialMedia,
liveBandDescription, liveBandWebsite, liveBandSocialMedia,
djCostOfService, liveBandCostOfService, cateringCompanyCostOfService,
djDescription, djWebsite, djSocialMedia,
staffTypeExperience, djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if(otherServicesSelected == false){
//        [self determineWhereToGo];
//    }

}

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    [self testDataPassed];
    
}//eom

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
- (IBAction)submitForm:(id)sender
{
    bool results = [self verifyDataEnter];
    if( results)
    {
        [self determineWhereToGo];
    }
}//eom

-(void)determineWhereToGo
{
    //skipping to staff registration 10 controller
    [self performSegueWithIdentifier:@"otherServicesToStaffRegistration10" sender:self];
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"otherServicesToStaffRegistration10"]){
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
        controller.otherServicesDescription     = self.otherServicesDescription.text;
        controller.otherServicesWebsite         = self.otherServicesWebsite.text;
        controller.otherServicesSocialMedia     = self.otherServicesSocialMedia.text;
        controller.otherServicesCostOfService   = self.costOfServiceTextField.text;
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
            
            if(labelID == 4)
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
            [scrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [scrollView setContentOffset:point animated:YES];
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
    NSLog(@" *****  Staff Registration| View controller #7 ******");
    
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
