//
//  StaffRegistration16ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration14ViewController.h"
#import "StaffDatabase.h"
#import "StaffHomeViewController.h"

#import "RegisteredStaff.h" //needed for staff registration
#import "ServerAPI.h"

@interface StaffRegistration14ViewController ()
{

    StaffDatabase *staffDB;
    BOOL aggrementRetrieved;
    UIImage * selfiePhoto;
    UIImage * bodyPhoto;
    ServerAPI * api;
}
@end

@implementation StaffRegistration14ViewController

@synthesize scrollView, registeredStaff, termsAndAgreements;


- (void)viewDidLoad {
    [super viewDidLoad];
    api = [[ServerAPI alloc]init];
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self getTermsAndAGreementsFromDB];
//    [registeredStaff printUserData];//testing
}//eom


#pragma mark - verify data
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


#pragma mark - terms and agreements
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
            }
        }
        else
        {
            self.submitButton.hidden = YES;
        }
        
    }//eo-action

    /* gets the terms and agreements from DB  */
    -(void)getTermsAndAGreementsFromDB
    {
        NSString *serverAddress = api.termsAgreements;
        
        /*** preparing data to be sent ***/
        NSMutableDictionary * staffInfo = [self prepareAgreementData];
        NSLog(@"");
        NSLog(@" about to send the following data: %@", staffInfo);
        NSLog(@"");
        
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
        
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:staffInfo options:0 error:&error];
        
        [request setHTTPBody:postdata];
        
       // NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
       // NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
    }//eom


    /* prepares the aggreement data */
    -(NSMutableDictionary *) prepareAgreementData
    {
        //creating initial list
        NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
        
        finalList[@"registrationType"]  = [registeredStaff getAccountType];

        return finalList;
    }//eom

#pragma mark - sending data
    - (IBAction)termsAgreed:(UIButton *)sender
    {
         [self sendDataToServer];
    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
//        if([segue.identifier isEqualToString:@"staffRegistered"])
//        {
//            UINavigationController *navigationController = [segue destinationViewController];
//            StaffHomeViewController *controller = (StaffHomeViewController *) navigationController.topViewController;
//            controller.staffID = staffID;
//        }
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

#pragma mark - JSON POST functions

        /* 
         processing server responce
         */
        -(void) processingServerResponce:(NSDictionary *) responce
        {
            //    NSLog(@"[1] responce: %@", responce);
            
            NSDictionary * userResults      = [responce objectForKey:@"results"];
            int responceType                = [[userResults objectForKey:@"responseType"] intValue];
            
            NSLog(@"[1] results is %@", userResults);
            NSLog(@"[1] responceType is %d", responceType);
            if(responceType > 0) //responce was good
            {
                
                //message
             //   NSDictionary * responceMessage  = [userResults objectForKey:@"message"];
             //   NSString * message              = [NSString stringWithFormat:@"%@", responceMessage];
                
                //agreement
                NSDictionary * agreementMessage = [userResults objectForKey:@"agreement"];
                NSString * agreeement           = [NSString stringWithFormat:@"%@", agreementMessage];
                
                //userID
                NSDictionary * userIDInt = [userResults objectForKey:@"userID"];
                NSString * userID = [NSString stringWithFormat:@"%@", userIDInt];
                
                //agreement
                if(responceType == 2)
                {
                    self.termsAndAgreements.text = agreeement;
                }
                else if(responceType == 1)
                {
                    
                    UIAlertView * alert =[[UIAlertView alloc] initWithTitle:@"Registration"
                              message:@"Successfully registered"
                              delegate:self
                              cancelButtonTitle:@"Okay"
                       otherButtonTitles: nil];
                    
                    [alert show];//display alert
                    
                     UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"Staff" bundle:nil];
                     
                     //instantiate navigation controller for staff home
                     UINavigationController *staffNavController = [newSB instantiateViewControllerWithIdentifier:@"staffNavigationController"];
                     
                     //updating transition
                     [staffNavController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                     
                     //passing data to employer navigation
                     StaffHomeViewController *homeStaffView = (StaffHomeViewController *)[staffNavController topViewController];
                     homeStaffView.staffID = [userID intValue];
                     
                     //performing change
                     [self presentViewController:staffNavController animated:YES completion:nil];
                }
            }
            else
            {
                //notifying user code was accepted
                [self showAlert:@"Registration" withMessage:@"We Apologize but our system is currently down" and:@"Okay"];
            }
        }//eom


        /* sends data to server */
        -(void)sendDataToServer
        {
                NSString *serverAddress = api.registration;

                /*** preparing data to be sent ***/
                NSMutableDictionary * staffInfo = [self prepareData];
                NSLog(@"");
                NSLog(@" about to send the following data: %@", staffInfo);
                NSLog(@"");

                /*** Sending data ***/
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                                initWithURL:[NSURL URLWithString:  serverAddress ]];
            
                [request setHTTPMethod:@"POST"]; //request type
                
                //sending data
                NSError *error;
                NSData *postdata = [NSJSONSerialization dataWithJSONObject:staffInfo options:0 error:&error];
            
                [request setHTTPBody:postdata];
            
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
        - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
        {
            
            NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            NSLog(@"[1] from server replied: %@",rawExhibits);
//    
//            NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"[2] responce from server %@",dataResponce);
//    
//            // Get JSON objects into initial array
//            NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
//            NSLog(@"[3] responce from server %@",rawExhibits2);
            
            //processing responce
            [self processingServerResponce:rawExhibits];
        }

        /* error occurred sending data to server */
        -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
        {
            NSLog(@" Failed with error '%@'", error);
        }//eom


        /*
         prepare staff data to json
         */
        -(NSMutableDictionary *) prepareData
        {
            //creating initial list
            NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
            
            finalList[@"registrationType"]     = [registeredStaff getAccountType];
            finalList[@"staffID"]              = [registeredStaff getStaffID];

//            //adding view controller 0 info
//            finalList[@"firstName"]     = [registeredStaff getFirstName];
//            finalList[@"middleName"]    = [registeredStaff getMiddleName];
//            finalList[@"lastName"]      = [registeredStaff getLastName];
//            finalList[@"nickName"]      = [registeredStaff getNickName];
//            finalList[@"email"]         = [registeredStaff getEmail];
//            finalList[@"username"]      = [registeredStaff getUserName];
//            finalList[@"password"]      = [registeredStaff getPassword];
//            finalList[@"dob"]           = [registeredStaff getDateOfBirth];
//            
//            NSLog(@"After view controller 0");
//            NSLog(@" %@", finalList);
//            NSLog(@"");
            
//            //adding view controller 1 info
//            finalList[@"phone"]             = [registeredStaff getCellPhone];
//            
//            
//            NSLog(@"After view controller 1");
//            NSLog(@" %@", finalList);
//            NSLog(@"");
            
            
            //adding view controller 2 info
            finalList[@"address"]               = [registeredStaff getAddress];
            finalList[@"city"]                  = [registeredStaff getAddressCity];
            finalList[@"state"]                 = [registeredStaff getAddressState];
            finalList[@"zipcode"]               = [registeredStaff getAddressZipcode];
            finalList[@"gender"]                = [registeredStaff getGender];
            finalList[@"genderType"]            = [NSString stringWithFormat:@"%d", [registeredStaff isMale]];
            finalList[@"languages"]             = [registeredStaff getLanguages];
            
            
//            NSLog(@"After view controller 2");
//            NSLog(@" %@", finalList);
//            NSLog(@"");
            
            //adding view controller 3 info
            
            finalList[@"experience"]                    = [registeredStaff getExperience];
            
//            NSLog(@"services are : %@ ", [registeredStaff getServices]);
            if( [registeredStaff getServices].count > 0 )
            {
//                NSLog(@"services selected %@", [registeredStaff getServices]);
                
                finalList[@"services"] = [registeredStaff getServices];
                
                if( [registeredStaff isDJ] )
                {
//                    NSLog(@"DJ!!!!");
                    finalList[@"selectedDJ"]                = [NSString stringWithFormat:@"%d", [registeredStaff isDJ] ];
                    finalList[@"djInfo"]                    = [registeredStaff getDJInfo];
                }
                if( [registeredStaff isLiveBand] )
                {
                    
//                    NSLog(@"Live Band");
                    finalList[@"selectedLiveBand"]          = [NSString stringWithFormat:@"%d", [registeredStaff isLiveBand] ];
                    finalList[@"liveBandInfo"]              = [registeredStaff getLiveBandInfo];
                }
                if( [registeredStaff isCateringCompany] )
                {
                    
//                    NSLog(@"Catering Company!!!");
                    finalList[@"selectedCateringCompany"]   = [NSString stringWithFormat:@"%d", [registeredStaff isCateringCompany] ];
                    finalList[@"cateringCompanyInfo"]       = [registeredStaff getCateringCompanyInfo];
                }
                if( [registeredStaff isOtherServices] )
                {
                    
//                    NSLog(@"Other Service!!!!");
                    finalList[@"selectedOtherServices"]     = [NSString stringWithFormat:@"%d", [registeredStaff isOtherServices] ];
                    finalList[@"otherServicesInfo"]         = [registeredStaff getOtherServicesInfo];
                }
                
                
//                NSLog(@"After view controller 3");
//                NSLog(@" %@", finalList);
//                NSLog(@"");
            }
            else
            {
                
                //adding view controller 8 info
                finalList[@"driverLicense"]         =  [NSString stringWithFormat:@"%d",[registeredStaff hasDriverLicense]];
                finalList[@"commercialLicense"]     =  [NSString stringWithFormat:@"%d",[registeredStaff hasCommercialDriverLicense]];
                finalList[@"Tattoos"]               =  [NSString stringWithFormat:@"%d",[registeredStaff hasTattoos]];
                finalList[@"Piercings"]             =  [NSString stringWithFormat:@"%d",[registeredStaff hasPiercings]];
                
                if([registeredStaff getEthnicity])
                {
                    finalList[@"ethnicity"]             = [registeredStaff getEthnicity];
                    finalList[@"ethnicityCode"]         = [registeredStaff getEthnicityCode];
                }
                
                if([registeredStaff getHeight])
                {
                    finalList[@"height"]                = [registeredStaff getHeight];
                }
                
                if([registeredStaff getWeight])
                {
                    finalList[@"weight"]                = [registeredStaff getWeight];
                }
                
                finalList[@"eyeColor"]              = [registeredStaff getEyeColor];
                finalList[@"hairColor"]             = [registeredStaff getHairColor];
                finalList[@"pantSize"]              = [registeredStaff getPantSize];
                finalList[@"shoeSize"]              = [registeredStaff getShoeSize];
                finalList[@"tshirtSize"]            = [registeredStaff getTshirtSize];
                
                
//                NSLog(@"After view controller 8");
//                NSLog(@" %@", finalList);
//                NSLog(@"");
                
                //females only
                if(![registeredStaff isMale])
                {
                    //adding view controller 9 info
                    finalList[@"chestSize"]            = [registeredStaff getChestSize];
                    finalList[@"waistSize"]            = [registeredStaff getWaistSize];
                    finalList[@"hipsSize"]             = [registeredStaff getHipSize];
                    finalList[@"dressSize"]            = [registeredStaff getDressSize];
                    
//                    NSLog(@"After view controller 9");
//                    NSLog(@" %@", finalList);
//                    NSLog(@"");
                }
            }//eo male or female (NON-SERVICE TALENT)
            
            
            
            //adding view controller 10 info
            finalList[@"ProfessionalInsurance"] = [NSString stringWithFormat:@"%d",[registeredStaff hasProfessionalInsurance]];
            finalList[@"Incorporated"] = [NSString stringWithFormat:@"%d",[registeredStaff isCorporated]];
            if([registeredStaff isCorporated])
            {
                finalList[@"ein"]          = [registeredStaff getEIN];
                finalList[@"businessName"] = [registeredStaff getBusinessName];
            }
            else
            {
                finalList[@"ssn"]          = [registeredStaff getSSN];
            }
            finalList[@"desiredHourlyRate"] = [registeredStaff getDesiredHourlyRate];
            finalList[@"desiredWeeklyRate"] = [registeredStaff getDesiredWeeklyRate];
            finalList[@"travelPercentage"]  = [registeredStaff getTravelPercentage];
            
            
//            NSLog(@"After view controller 10");
//            NSLog(@" %@", finalList);
//            NSLog(@"");
            
            //adding view controller 13 info
            finalList[@"DirectDeposit"]                 =  [NSString stringWithFormat:@"%d",[registeredStaff wantsDirectDeposit]];
            finalList[@"DirectDepositRoutingNumber"]    = [registeredStaff getdirectDepositRoutingNumber];
            finalList[@"DirectDepositAccountNumber"]    = [registeredStaff getdirectDepositAccountNumber];
            
            
//            NSLog(@"After view controller 13");
//            NSLog(@" %@", finalList);
//            NSLog(@"");
            
            return finalList;
            
        }//eom


@end
