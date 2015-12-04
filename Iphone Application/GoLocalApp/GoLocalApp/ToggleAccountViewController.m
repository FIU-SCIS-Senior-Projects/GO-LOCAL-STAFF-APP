//
//  ToggleAccountViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/11/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "ToggleAccountViewController.h"
#import "StaffHomeViewController.h"
#import "EmployerHomeViewController.h"


#import "ForgotPasswordViewController.h"
#import "PreRegistrationViewController.h"
#import "ServerAPI.h"

@interface ToggleAccountViewController ()
{
    ServerAPI * api;
}
@end

@implementation ToggleAccountViewController

@synthesize username, password;

//MARK: Memory
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [[ServerAPI alloc]init];
}

//MARK: Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)forgotPasswordRequest:(id)sender
{
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //instantiate view controller
    ForgotPasswordViewController *forgotPasswordViewController = [newSB instantiateViewControllerWithIdentifier:@"forgotPassword"];
    
    forgotPasswordViewController.hideReturnSignInButton = true;
    
    [self.navigationController pushViewController:forgotPasswordViewController animated:true];
}//eo-a

- (IBAction)signUpRequest:(id)sender
{
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //instantiate view controller
    PreRegistrationViewController *preRegistrationViewController = [newSB instantiateViewControllerWithIdentifier:@"preRegistration"];
    
    preRegistrationViewController.hideReturnSignInButton = true;
    
    [self.navigationController pushViewController:preRegistrationViewController animated:true];
    
}//eo-a

- (IBAction)submitLogIn:(id)sender
{
    [self sendDataLoginDataToServer];
}//eo-a


#pragma mark - Navigation
/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffHome"]){
        UINavigationController *navigationController = [segue destinationViewController];
        StaffHomeViewController *controller = (StaffHomeViewController *) navigationController.topViewController;
        controller.username = username.text;
    }
    else if([segue.identifier isEqualToString:@"employerHome"])
    {
        UINavigationController *navigationController = [segue destinationViewController];
        EmployerHomeViewController *controller = (EmployerHomeViewController *) navigationController.topViewController;
        controller.username = username.text;
    }
    
}//eom

//MARK: Log in  functions

/*
 process Server Responce
 */
-(void) processServerResponce:(NSDictionary *) responce
{
    //    NSLog(@"[1] responce: %@", responce);
    
    NSDictionary * userResults = [responce objectForKey:@"results"];
    int usertype = [[userResults objectForKey:@"usertype"] intValue];
    NSDictionary * responceMessage = [userResults objectForKey:@"message"];
    NSString * message = [NSString stringWithFormat:@"%@", responceMessage];
    
    NSLog(@"[1] results is %@", userResults);
    NSLog(@"[1] usertype is %d", usertype);
    
    /*
     return 1       - staff
     return 2       - employer
     return 0       - DB not responding
     return -1 -2   - valid user with INCORRECT Credentials
     return -3      - no user found
     return -4      - account locked
     */
    if(usertype == 2) //employer user
    {
        [self goToEmployerHome];
    }
    else if(usertype == 1) //staff user
    {
        [self goToStaffHome];
    }
    else if(usertype == 0)//db issues
    {
        [self showAlert:@"Log In" withMessage:@"We Apologize but our system is currently down" and:@"Okay"];
    }
    else if(usertype == -1)//invalid credentials
    {
        [self showAlert:@"Log In" withMessage:@"Invalid credentials" and:@"Okay"];
    }
    else if(usertype == -2)//account locked
    {
        //notifying user code was accepted
        [self showAlert:@"Log In" withMessage:@"Account locked, please reset your password" and:@"Okay"];
    }
    else if(usertype == -3)//no user found
    {
        [self showAlert:@"Log In" withMessage:@"No account found with the provided credentials" and:@"Okay"];
    }
    else //invalid response
    {
        //notifying user code was accepted
        [self showAlert:@"Log In" withMessage:message and:@"Okay"];
    }
    
}//eom

-(void) goToStaffHome
{
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"Staff" bundle:nil];
    
    //instantiate navigation controller for staff home
    UINavigationController *staffNavController = [newSB instantiateViewControllerWithIdentifier:@"staffNavigationController"];
    
    //updating transition
    [staffNavController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    //passing data to employer navigation
    //StaffHomeViewController *homeStaffView = (StaffHomeViewController *)[staffNavController topViewController];
    //homeStaffView.staffID = [userID intValue];
    
    //performing change
    [self presentViewController:staffNavController animated:NO completion:nil];
    
}//eom

-(void) goToEmployerHome
{
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"Employer" bundle:nil];
    
    //instantiate navigation controller for staff home
    UINavigationController *empNavController = [newSB instantiateViewControllerWithIdentifier:@"employerNavigationController"];
    
    //updating transition
    [empNavController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    //passing data to employer navigation
    //StaffHomeViewController *homeStaffView = (StaffHomeViewController *)[staffNavController topViewController];
    //homeStaffView.staffID = [userID intValue];
    
    //performing change
    [self presentViewController:empNavController animated:NO completion:nil];
    
}//eom

//MARK: Alert

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


//MARK: textfields functions

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
        
        [self sendDataLoginDataToServer];//submitting log in
    }
    
    return YES;
}//eom


//MARK: JSON POST functions

/* responce from server */
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    NSLog(@" responce: %@", httpResponse.description);
    
}//eo-action


/* data received from server */
- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    
    NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"[1] from server replied: %@",rawExhibits);
    
    NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"[2] responce from server %@",dataResponce);
    
    // Get JSON objects into initial array
    NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    NSLog(@"[3] responce from server %@",rawExhibits2);
    
    //processing responce
    [self processServerResponce:rawExhibits];
}//eom

/*
 - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
 {
 data = [[NSMutableData alloc] init];
 NSLog(@"Data Data , %@", data);
 }
 */

/* error occurred sending data to server */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@" Failed with error '%@'", error);
}//eom


/*
 
 */
-(void)sendDataLoginDataToServer
{
    NSString *serverAddress = api.login;
    
    /*** preparing data to be sent ***/
    NSMutableDictionary * logInfo = [self prepareLogInData];
    NSLog(@"");
    NSLog(@" about to send the following data: %@", logInfo);
    NSLog(@"");
    
    /*** Sending data ***/
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL URLWithString:  serverAddress ]];
    
    [request setHTTPMethod:@"POST"]; //request type
    
    //sending data
    NSError *error;
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:logInfo options:0 error:&error];
    
    [request setHTTPBody:postdata];
    
    //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}//eo-action


/*
 prepare log in data
 */
-(NSMutableDictionary *) prepareLogInData
{
    //creating initial list
    NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
    
    finalList[@"emailOrUsername"]     = self.username.text;
    finalList[@"password"]     = self.password.text;
    
    return finalList;
}//eom


@end
