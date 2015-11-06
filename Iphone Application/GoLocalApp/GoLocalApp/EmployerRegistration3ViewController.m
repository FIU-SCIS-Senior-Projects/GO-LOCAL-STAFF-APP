//
//  EmployerRegistration3ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerRegistration3ViewController.h"
#import "EmployerHomeViewController.h" //Needed for segue

#import "RegisteredEmployer.h" //Needed to access the model

@interface EmployerRegistration3ViewController ()

@end

@implementation EmployerRegistration3ViewController

@synthesize registeredEmployer, termsSwitch, registrationButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)agreementsToggle:(id)sender
{
    if( termsSwitch.on )
        [registrationButton setHidden:NO];
}

-(IBAction)submit:(id)sender
{
    [self sendData];
//    [self performSegueWithIdentifier:@"goToEmployerHome" sender:self];
}

#pragma mark - helper methods

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{


}//eom

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

#pragma mark - JSON methods

/****** JSON Methods *******/

//Encapsulates the data in a Dictionary to send to the server
-(NSMutableDictionary *) prepareDataToSend
{
    NSMutableDictionary *list = [[NSMutableDictionary alloc] init];
    
    
    list[@"registrationType"] = [registeredEmployer getAccountType];
    list[@"employerID"] = [registeredEmployer getEmployerID];
    list[@"employerName"] = [registeredEmployer getEmployerName];
    list[@"typeOfEmployer"] = [registeredEmployer getTypeOfEmployer];
    list[@"address"] = [registeredEmployer getAddress];
    list[@"city"] = [registeredEmployer getCity];
    list[@"state"] = [registeredEmployer getState];
    list[@"zipCode"] = [registeredEmployer getZipCode];
    
    if( [registeredEmployer hasInsurance] )
        list[@"hasInsurance"] = @"1";
    else
        list[@"hasInsurance"] = @"0";
    
    return list;
}


//Sends data of employer to the server
-(void) sendData
{
    NSString *serverAddress = @"http://192.241.186.107/Website/jsonPOST_registration.php";//hard coding website
    
    NSMutableDictionary *list = [self prepareDataToSend];
    NSLog(@"");
    NSLog(@" about to send the following data: %@", list);
    NSLog(@"");
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:serverAddress]];
    
    [request setHTTPMethod:@"POST"];
    
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:list options:0 error:&error];
    
    [request setHTTPBody:data];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void) processServerResponse:(NSDictionary *) responce
{
    //    NSLog(@"[1] responce: %@", responce);
    
    NSDictionary * userResults = [responce objectForKey:@"results"];
    int responceType = [[userResults objectForKey:@"responseType"] intValue];
    NSDictionary * responceMessage = [userResults objectForKey:@"message"];
    NSString * message = [NSString stringWithFormat:@"%@", responceMessage];
    
    NSLog(@"[1] results is %@", userResults);
    NSLog(@"[1] responceType is %d", responceType);
    if(responceType > 0) //responce was good
    {
        //notifying user that registration was successful
        [self showAlert:@"Success" withMessage:@"Registration was successful" and:@"Okay"];
  
        //instiate navigation controller for employer home
        UINavigationController *employerNavController = [self.storyboard instantiateViewControllerWithIdentifier:@"employerNavigationController"];
        
        //updating transition
        [employerNavController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        
        //passing data to employer navigation
//        EmployerHomeViewController *homeEmployerView = (EmployerHomeViewController *)[employerNavController topViewController];
        
        //performing change
        [self presentViewController:employerNavController animated:NO completion:nil];
     
    }
    else //invalid response
    {
        //notifying user code was accepted
        [self showAlert:@"Information invalid" withMessage:message and:@"Okay"];
    }
}//eom

/****** JSON POST METHODS *******/

/* responce from server */
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    NSLog(@" responce: %@", httpResponse.description);
    
    //            NSInteger statusCode = httpResponse.statusCode;
    //            NSLog(@" status Code: %ld", (long)statusCode);
    
    //    NSString *string = [NSString stringWithFormat:@"%ld", (long)statusCode];
    
}//eo-action


/* data received from server */
- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    
    NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    //        NSLog(@"[1] from server replied: %@",rawExhibits);
    
    //        NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //        NSLog(@"[2] responce from server %@",dataResponce);
    //
    //        // Get JSON objects into initial array
    //        NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    //        NSLog(@"[3] responce from server %@",rawExhibits2);
    
    //processing responce
    [self processServerResponse:rawExhibits];
    
    //        }
}//eom


@end
