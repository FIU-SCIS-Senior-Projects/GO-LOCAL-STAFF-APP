//
//  StaffRegistration16ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration14ViewController.h"
#import "StaffDatabase.h"

#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration14ViewController ()
{

    StaffDatabase *staffDB;
    
    UIImage * selfiePhoto;
    UIImage * bodyPhoto;
}
@end

@implementation StaffRegistration14ViewController

@synthesize scrollView, registeredStaff;


- (void)viewDidLoad {
    [super viewDidLoad];
   
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [registeredStaff printUserData];//testing
    
}//eom


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    
    if(!self.agreeTermsSwitch.on)
    {
        [self showAlert:@"Registration Field" withMessage:@"Please read and agree to terms" and:@"Okay"];
        return 0;
    }
    
    //getting images from coredata
    UIImage * selfieImageResult = [staffDB getSelfiePhoto];
    if(selfieImageResult)
    {
        self->selfiePhoto = selfieImageResult;
    }
    UIImage * bodyImageResult = [staffDB getSelfiePhoto];
    if(bodyImageResult)
    {
        self->bodyPhoto = bodyImageResult;
    }
    
    return 1;
}//eom


/* terms and agreements */
- (IBAction)agreeTermsValueChanged:(id)sender
{
    
    if(self.agreeTermsSwitch.on)
    {
        bool result = [self verifyDataEnter];
        if(result)
        {
            //since user to terms, display 'submit registration' button
            self.submitButton.hidden = NO;
            [self sendDataToServer];
        }
    }
    else
    {
        self.submitButton.hidden = YES;
    }
    
}//eo-action

/* sends data to server */
-(void)sendDataToServer
{
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_registration.php";//hard coding website
    
        /*** preparing data to be sent ***/
        NSDictionary * staffInfo = [registeredStaff getStaffInfo];
    
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
    
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:staffInfo options:0 error:&error];
        [request setHTTPBody:postdata];
    
    
        NSLog(@" sending post data: %@", postdata);
    
//        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        [NSURLConnection connectionWithRequest:request delegate:self];
}//eo-action

/* responce from server */
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    NSLog(@" responce: %@", httpResponse.description);
    
    NSInteger statusCode = httpResponse.statusCode;
    
    NSLog(@" status Code: %ld", (long)statusCode);
//    NSString *string = [NSString stringWithFormat:@"%ld", (long)statusCode];
    
}//eo-action

/* data received from server */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
    NSString *dataResponce = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
    NSLog(@" responce from server %@",dataResponce);
}

/* error occurred sending data to server */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@" Failed with error '%@'", error);
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




@end
