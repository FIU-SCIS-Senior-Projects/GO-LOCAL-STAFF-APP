//
//  ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

@synthesize username, password;

/* */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupTextFields];
}//eom


/* */
- (IBAction)submitLogIn:(id)sender
{
    int loginResults = [self LogInUser];
    NSLog(@"results are %d", loginResults);
    if(loginResults > 0)
    {
        if(loginResults == 1)
        {
             [self performSegueWithIdentifier:@"staffHome" sender:self];
        }
        else if(loginResults == 2)
        {
             [self performSegueWithIdentifier:@"employerHome" sender:self];
        }
        
    }
    else
    {
        [self showAlert:@"Unable to signin" withMessage: @"login credentials invalid" and:@"Okay"];
    }
    
}//eom


/* Log in user in the database 
    return 1 - staff
    return 2 - employer
    return -1 - not valid user
 */
-(int)LogInUser
{

//    NSString *uname = self.username.text;
//    NSString *pass = self.password.text;
    
//    NSString *uname = @"luoandre29";
//    NSString *pass = @"2987Andres";
//    if( ( uname == self.username.text) && (pass == self.password.text) )
//    {
        return 1;
//    }
    
//    return -1;
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

/******** textfields  functions********/
    /* setup textfields */
    -(void) setupTextFields
    {
        //setup of texfields
        self.username.delegate           = self;
        self.password.delegate           = self;
    }//eom

    /* dimmisses UITextField as soon the background is touched */
    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
    {
        [self.username resignFirstResponder];
        [self.password resignFirstResponder];
    }//eom

    /* dimisses UITextField as soon the return key is pressed */
    -(BOOL)textFieldShouldReturn:(UITextField *)textField {
        
        if(textField == self.username){
            [self.username resignFirstResponder];
            [self.password becomeFirstResponder];
        }
        else if(textField == self.password){
            [self.password resignFirstResponder];
        }
        else{
            NSLog(@"none are the same");
        }
        
        return YES;
    }//eom


/* */
- (IBAction)unwoundStaff:(UIStoryboardSegue *)segue
{
    // No need to do anything here...
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
