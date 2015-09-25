//
//  StaffRegistration1ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/25/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration1ViewController.h"
#import "StaffRegistration2ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration1ViewController ()
{

    
    //labels
    __weak IBOutlet UILabel *cellphoneLabel;
    
    
}

@end

@implementation StaffRegistration1ViewController

@synthesize scrollView,cellphone, registeredStaff;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    
    //    [registeredStaff printUserData];
    
}//eom

/* verifying input fields
 */
- (BOOL)verifyDataEnter
{
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    NSString * testing;
    NSString *trimmedString;
    
    testing = self.cellphone.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
        self.cellphone.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone number" and:@"Okay"];
        return 0;
    }
    else if( self.cellphone.text.length < 10)
    {
        [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
        return 0;
    }
    
    
    //updating values
    [registeredStaff setCellphone:self.cellphone.text withCarrer:@""];
    
     return 1;
}//eom



/* */
- (IBAction)submitForm:(id)sender {
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"goToStaffRegister2" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields on staffRegistration1");
    }
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToStaffRegister2"]){
        StaffRegistration2ViewController *controller = (StaffRegistration2ViewController *)segue.destinationViewController;
        
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
            
        }//eoom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }


/******** textfields  functions********/

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.cellphone){
                [self.cellphone resignFirstResponder];
            }
            
            [self scrollViewAdaptToStartEditingTextField:textField];//moving scrollview
            
            return YES;
        }//eom


        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }

        /* shows and hides the label above the textfield depending if the textfield is blank or filled */
        - (IBAction)textFieldValuesChanged:(UITextField *)sender {
            
            int labelID = (int)sender.tag;
            
            if(labelID == 0)//cellphone
            {
                if(self.cellphone.text.length == 0)
                {
                    [self->cellphoneLabel setHidden:YES];
                }
                else
                {
                    [self->cellphoneLabel setHidden:NO];
                }
            }
        }//eoa

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
