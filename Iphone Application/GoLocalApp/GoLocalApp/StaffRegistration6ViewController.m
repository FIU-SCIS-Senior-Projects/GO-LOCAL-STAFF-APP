//
//  StaffRegistration5ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration6ViewController.h"
#import "StaffRegistration7ViewController.h"
#import "StaffRegistration10ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration6ViewController ()
{
    __weak IBOutlet UILabel *costOfServiceLabel;
}
@end

@implementation StaffRegistration6ViewController

@synthesize scrollView, registeredStaff,
cateringCompanyDescription, cateringCompanyWebsite, cateringCompanySocialMedia, costOfServiceTextField;


- (void)viewDidLoad {
    [super viewDidLoad];

}//eom

-(void)viewDidAppear:(BOOL)animated
{
    
    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];

    
}//eom

#pragma mark - verify data
    /* verify required fields */
    - (BOOL)verifyDataEnter
    {
        BOOL cateringCompanyDescriptionFilled        = false;
        BOOL cateringCompanyWebsiteFilled            = false;
        BOOL cateringCompanySocialMediaFilled        = false;

        if(cateringCompanyDescription.hasText){
            cateringCompanyDescriptionFilled = true;
        }
        else {
            [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
            return 0;
        }
        
        if(cateringCompanyWebsite.hasText){
            cateringCompanyWebsiteFilled = true;
        }
        else {
            [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
            return 0;
        }
        
        if(cateringCompanySocialMedia.hasText){
            cateringCompanySocialMediaFilled = true;
        }
        else {
            [self showAlert:@"Registration Field" withMessage:@"Missing the social media field" and:@"Okay"];
            return 0;
        }
        
        //updating values
        NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:
                              self.cateringCompanyDescription.text, @"description",
                              self.cateringCompanyWebsite.text, @"website",
                              self.cateringCompanySocialMedia.text, @"socialMedia",
                              self.costOfServiceTextField.text, @"costOfService",
                              nil];
        
        NSMutableArray *service = [[NSMutableArray alloc] init];
        [service addObject:info];
        [registeredStaff setCateringCompanyInfo:service];
        
        return 1;
    }//eom

#pragma mark - sending data
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
        //other services
        if([registeredStaff isOtherServices])
        {
            //skipping to Other services controller
            [self performSegueWithIdentifier:@"cateringCompanyToOtherServices" sender:self];
        }
        else
        {
            //skipping to staff registration 11 controller
            [self performSegueWithIdentifier:@"cateringCompanyToStaffRegistration10" sender:self];
        }
        
    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"cateringCompanyToOtherServices"]){
            StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
            
             controller.registeredStaff = registeredStaff;
            
        }
        else if([segue.identifier isEqualToString:@"cateringCompanyToStaffRegistration10"]){
            StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
            
             controller.registeredStaff = registeredStaff;
        }
    }//eom

#pragma mark - helper functions
    /* create UIAlert*/
    -(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
    {
        //creating controller
        UIAlertController * actionController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
        
        [actionController addAction:defaultAction];
        
        [self presentViewController:actionController animated:YES completion:nil];
    }//eom

#pragma mark - tap gestures functions
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

#pragma mark - textfields  functions

        /* shows and hides the label above the textfield depending if the textfield is blank or filled */
        - (IBAction)textFieldValuesChanged:(UITextField *)sender
        {
            int labelID = (int)sender.tag;
            
            if(labelID == 3)//cellphone
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
            
            if(textField == self.cateringCompanyWebsite){
                [self.cateringCompanyWebsite resignFirstResponder];
                [self.cateringCompanySocialMedia becomeFirstResponder];
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.cateringCompanyDescription){
                [self.cateringCompanyDescription resignFirstResponder];
                [self.cateringCompanyWebsite becomeFirstResponder];
            }
            else if(textView == self.cateringCompanySocialMedia){
                [self.cateringCompanySocialMedia resignFirstResponder];
            }
            
            return YES;
        }//eom

#pragma mark - scrollview functions

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
