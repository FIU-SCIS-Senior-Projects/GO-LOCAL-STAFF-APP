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

/***************** JSON POST functions *******************/
        /* sends data to server */
        -(void)sendDataToServer
        {
                NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_registration.php";//hard coding website
            
            
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
        - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
            NSString *dataResponce = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
            NSLog(@" responce from server %@",dataResponce);
        }

        /* error occurred sending data to server */
        -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
        {
            NSLog(@" Failed with error '%@'", error);
        }//eom



        /*prepare staff data to json*/
        -(NSMutableDictionary *) prepareData
        {
            //creating initial list
            NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
            
            finalList[@"registrationType"]     = [registeredStaff getAccountType];
            
            //adding view controller 0 info
            finalList[@"firstName"]     = [registeredStaff getFirstName];
            finalList[@"middleName"]    = [registeredStaff getMiddleName];
            finalList[@"lastName"]      = [registeredStaff getLastName];
            finalList[@"nickName"]      = [registeredStaff getNickName];
            finalList[@"email"]         = [registeredStaff getEmail];
            finalList[@"username"]      = [registeredStaff getUserName];
            finalList[@"password"]      = [registeredStaff getPassword];
            finalList[@"dob"]           = [registeredStaff getDateOfBirth];
            
            NSLog(@"After view controller 0");
            NSLog(@" %@", finalList);
            NSLog(@"");
            
            //adding view controller 1 info
            finalList[@"cellphone"]             = [registeredStaff getCellPhone];
            
            
            NSLog(@"After view controller 1");
            NSLog(@" %@", finalList);
            NSLog(@"");
            
            
            //adding view controller 2 info
            finalList[@"address"]               = [registeredStaff getAddress];
            finalList[@"city"]               = [registeredStaff getAddressCity];
            finalList[@"state"]               = [registeredStaff getAddressState];
            finalList[@"zipcode"]               = [registeredStaff getAddressZipcode];
            finalList[@"gender"]                = [registeredStaff getGender];
            finalList[@"genderType"]            = [NSString stringWithFormat:@"%d", [registeredStaff isMale]];
            finalList[@"languages"]             = [registeredStaff getLanguages];
            
            
            NSLog(@"After view controller 2");
            NSLog(@" %@", finalList);
            NSLog(@"");
            
            //adding view controller 3 info
            
            finalList[@"experience"]                    = [registeredStaff getExperience];
            
            NSLog(@"services are : %@ ", [registeredStaff getServices]);
            if( [registeredStaff getServices].count > 0 )
            {
                NSLog(@"services selected %@", [registeredStaff getServices]);
                
                finalList[@"services"] = [registeredStaff getServices];
                
                if( [registeredStaff isDJ] )
                {
                    NSLog(@"DJ!!!!");
                    finalList[@"selectedDJ"]                = [NSString stringWithFormat:@"%d", [registeredStaff isDJ] ];
                    finalList[@"djInfo"]                    = [registeredStaff getDJInfo];
                }
                if( [registeredStaff isLiveBand] )
                {
                    
                    NSLog(@"Live Band");
                    finalList[@"selectedLiveBand"]          = [NSString stringWithFormat:@"%d", [registeredStaff isLiveBand] ];
                    finalList[@"liveBandInfo"]              = [registeredStaff getLiveBandInfo];
                }
                if( [registeredStaff isCateringCompany] )
                {
                    
                    NSLog(@"Catering Company!!!");
                    finalList[@"selectedCateringCompany"]   = [NSString stringWithFormat:@"%d", [registeredStaff isCateringCompany] ];
                    finalList[@"cateringCompanyInfo"]       = [registeredStaff getCateringCompanyInfo];
                }
                if( [registeredStaff isOtherServices] )
                {
                    
                    NSLog(@"Other Service!!!!");
                    finalList[@"selectedOtherServices"]     = [NSString stringWithFormat:@"%d", [registeredStaff isOtherServices] ];
                    finalList[@"otherServicesInfo"]         = [registeredStaff getOtherServicesInfo];
                }
                
                
                NSLog(@"After view controller 3");
                NSLog(@" %@", finalList);
                NSLog(@"");
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
                
                
                NSLog(@"After view controller 8");
                NSLog(@" %@", finalList);
                NSLog(@"");
                
                //females only
                if(![registeredStaff isMale])
                {
                    //adding view controller 9 info
                    finalList[@"chestSize"]            = [registeredStaff getChestSize];
                    finalList[@"waistSize"]            = [registeredStaff getWaistSize];
                    finalList[@"hipsSize"]             = [registeredStaff getHipSize];
                    finalList[@"dressSize"]            = [registeredStaff getDressSize];
                    
                    NSLog(@"After view controller 9");
                    NSLog(@" %@", finalList);
                    NSLog(@"");
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
            
            
            NSLog(@"After view controller 10");
            NSLog(@" %@", finalList);
            NSLog(@"");
            
            //adding view controller 13 info
            finalList[@"DirectDeposit"]                 =  [NSString stringWithFormat:@"%d",[registeredStaff wantsDirectDeposit]];
            finalList[@"DirectDepositRoutingNumber"]    = [registeredStaff getdirectDepositRoutingNumber];
            finalList[@"DirectDepositAccountNumber"]    = [registeredStaff getdirectDepositAccountNumber];
            
            
            NSLog(@"After view controller 13");
            NSLog(@" %@", finalList);
            NSLog(@"");
            
            return finalList;
            
        }//eom

 
 //    NSError *error;
 //    NSData *postdata = [NSJSONSerialization dataWithJSONObject:req options:0 error:&error];

 
 
//    //example 1
//    NSMutableDictionary *req =[NSMutableDictionary  dictionaryWithObjectsAndKeys:@"feed/http://feeds.feedburner.com/design-milk", @"id", nil];
//    req[@"title"] = @"Design Milk";
//
//    NSLog(@" NSMutableDictionary = %@", req);
//
//    NSDictionary *itemToAdd = [[NSDictionary alloc] initWithObjectsAndKeys:
//                               @"user/category/test", @"id", @"test", @"label", nil];
//
//    NSMutableArray *listToAdd = [[NSMutableArray alloc] init];
//    [listToAdd addObject:itemToAdd];
//
//    [req setObject:listToAdd forKey:@"categories"];
//
//    NSLog(@" final is %@", req);
//
//
//    //example 2
//    NSMutableDictionary *json= [[NSMutableDictionary alloc] init];
//    [json setObject:@"4992" forKey:@"cat_id"];
//    [json setObject:@"Toshiba" forKey:@"brand"];
//    //create weight object
//    NSMutableDictionary *weight= [[NSMutableDictionary alloc] init];
//    [weight setObject:@"1000000" forKey:@"gte"];
//    [weight setObject:@"1500000" forKey:@"lt"];
//    //attach the object
//    [json setObject:weight forKey:@"weight"];
//    //create sitedetails objects
//    NSMutableDictionary *sitedetails= [[NSMutableDictionary alloc] init];
//    [sitedetails setObject:@"newegg.com" forKey:@"name"];
//    //create latestoffers objects
//    NSMutableDictionary *latestoffers= [[NSMutableDictionary alloc] init];
//    [latestoffers setObject:@"USD" forKey:@"currency"];
//    //new dictionary for price
//    [sitedetails setObject:latestoffers forKey:@"latestoffers"];
//    [json setObject:sitedetails forKey:@"sitedetails"];
//    NSLog(@"%@",json);

@end
