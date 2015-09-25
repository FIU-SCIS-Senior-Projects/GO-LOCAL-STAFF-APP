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


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration4ViewController ()
{
    __weak IBOutlet UILabel *costOfServiceLabel;
    
    NSMutableArray * serviceInfo;
    BOOL liveBandSelected;
    BOOL cateringCompanySelected;
    BOOL otherServicesSelected;
}
@end

@implementation StaffRegistration4ViewController


@synthesize scrollView, djDescription, djWebsite, djSocialMedia, costOfServiceTextField, registeredStaff;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    
//    [registeredStaff printUserData];
    
    self->liveBandSelected          =   [registeredStaff isLiveBand];
    self->cateringCompanySelected   =   [registeredStaff isCateringCompany];
    self->otherServicesSelected     =   [registeredStaff isOtherServices];

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
    
//    //updating values
//    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:
//                            self.djDescription.text, @"description",
//                            self.djWebsite.text, @"website",
//                            self.djSocialMedia.text, @"socialMedia",
//                            self.costOfServiceTextField.text, @"costOfService",
//                            nil];
//    
//    NSMutableArray *service = [[NSMutableArray alloc] init];
//    [service addObject:info];
//    [registeredStaff setDJInfo:service];
//    
//    NSLog(@"service has : %@", service);
//    NSLog(@"");
//    NSLog(@" that was built from dic: %@ ", info);

    self->serviceInfo = [[NSMutableArray alloc] init];
    [self->serviceInfo addObject:self.djDescription.text];
    [self->serviceInfo addObject:self.djWebsite.text];
    [self->serviceInfo addObject:self.djSocialMedia.text];
    [self->serviceInfo addObject:self.costOfServiceTextField.text];
    [registeredStaff setDJInfo:self->serviceInfo];
    
    NSLog(@"service has : %@", self->serviceInfo);
      
    
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
    if(self->liveBandSelected)
    {
        //moving to the next controller
        [self performSegueWithIdentifier:@"djToLiveBand" sender:self];
    }
    //catering company
    else if(self->cateringCompanySelected)
    {
        //skipping to catering company controller
        [self performSegueWithIdentifier:@"djToCateringCompany" sender:self];
    }
    //other services
    else if(self->otherServicesSelected)
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
        
        controller.registeredStaff = registeredStaff;
        
    }
    else if([segue.identifier isEqualToString:@"djToCateringCompany"]){
        StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
        
        controller.registeredStaff = registeredStaff;
    
    }
    else if([segue.identifier isEqualToString:@"djToOtherServices"]){
        StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
        
        controller.registeredStaff = registeredStaff;
        
    }
    else if([segue.identifier isEqualToString:@"djToStaffRegistration11"]){
        StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
        
        controller.registeredStaff = registeredStaff;
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





@end
