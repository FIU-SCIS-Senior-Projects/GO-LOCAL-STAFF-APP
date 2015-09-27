
//
//  StaffRegistration4ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/25/15.
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
}
@end

@implementation StaffRegistration4ViewController


@synthesize scrollView, registeredStaff,
djDescription, djWebsite, djSocialMedia, costOfServiceTextField;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];
    
}//eom


/* verify required fields */
- (BOOL)verifyDataEnter
{
    BOOL liveBandDescriptionFilled        = false;
    BOOL liveBandWebsiteFilled            = false;
    BOOL liveBandSocialMediaFilled        = false;
    
    if(djDescription.hasText){
        liveBandDescriptionFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
        return 0;
    }
    
    if(djWebsite.hasText){
        liveBandWebsiteFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
        return 0;
    }
    
    if(djSocialMedia.hasText){
        liveBandSocialMediaFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the social media field" and:@"Okay"];
        return 0;
    }
    
    //updating values
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:
                          self.djDescription.text, @"description",
                          self.djWebsite.text, @"website",
                          self.djSocialMedia.text, @"socialMedia",
                          self.costOfServiceTextField.text, @"costOfService",
                          nil];
    
    NSMutableArray *service = [[NSMutableArray alloc] init];
    [service addObject:info];
    [registeredStaff setDJInfo:service];
    
    
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
    //catering company
    if( [registeredStaff isLiveBand] )
    {
        //skipping to catering company controller
        [self performSegueWithIdentifier:@"djToLiveBand" sender:self];
    }
    //catering company
    else if( [registeredStaff isCateringCompany] )
    {
        //skipping to catering company controller
        [self performSegueWithIdentifier:@"djToCateringCompany" sender:self];
    }
    //other services
    else if( [registeredStaff isOtherServices])
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
    if([segue.identifier isEqualToString:@"liveBandToCateringCompany"]){
        StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
        
        controller.registeredStaff = registeredStaff;
    }
    else if([segue.identifier isEqualToString:@"liveBandToOtherServices"]){
        StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
        
        controller.registeredStaff = registeredStaff;
        
    }
    else if([segue.identifier isEqualToString:@"liveBandToStaffRegistration10"]){
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
            
            if(labelID == 2)
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
            else{
                NSLog(@"none are the same");
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



@end
