//
//  StaffSearchResultProfileViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "StaffSearchResultProfileViewController.h"

@interface StaffSearchResultProfileViewController ()

@end

@implementation StaffSearchResultProfileViewController

@synthesize staffDetail, talentDetailImageView, nameLabel, middleInitialLabel, lastNameLabel, ageLabel, genderLabel, languagesLabel, ethnicityLabel, weightLabel, heightLabel, eyeColorLabel, hairColorLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}//eo-view

-(void)viewDidAppear:(BOOL)animated
{
    //[self sendSearchDataToServer];
    
}//eo-view

-(void)viewWillAppear:(BOOL)animated
{
    [self sendSearchDataToServer];
}

#pragma mark -
-(void)updateUSerInfo: (NSDictionary *) currentUser
{
    nameLabel.text              = [currentUser objectForKey:@"firstName"];
    [nameLabel sizeToFit];
    middleInitialLabel.text     = [currentUser objectForKey:@"middleInitial"];
    [middleInitialLabel sizeToFit];
    lastNameLabel.text          = [currentUser objectForKey:@"lastName"];
    [lastNameLabel sizeToFit];
    ageLabel.text               = [currentUser objectForKey:@"age"];
    ethnicityLabel.text         = [currentUser objectForKey:@"ethnicity"];
    NSString *weight            = [currentUser objectForKey:@"weight"];
    weightLabel.text            = [weight stringByAppendingString:@" lbs"];
    heightLabel.text            = [currentUser objectForKey:@"height"];
    eyeColorLabel.text          = [currentUser objectForKey:@"eyeColor"];
    hairColorLabel.text         = [currentUser objectForKey:@"hairColor"];
    
    NSString *gender            = [currentUser objectForKey:@"gender"];
    
    if( [gender isEqualToString:@"0"] )
        genderLabel.text = @"Female";
    else
        genderLabel.text = @"Male";
    
    NSString *languages         = [currentUser objectForKey:@"nativeLanguage"];
    
    NSString *tempLanguage      = [currentUser objectForKey:@"secondLanguage"];
    
    if( [tempLanguage length] != 0 )
    {
        languages               = [languages stringByAppendingString:@", "];
        languages               = [languages stringByAppendingString:tempLanguage];
    }
    
    tempLanguage                = [currentUser objectForKey:@"thirdLanguage"];
    
    if( [tempLanguage length] != 0 )
    {
        languages               = [languages stringByAppendingString:@", "];
        languages               = [languages stringByAppendingString:tempLanguage];
    }
    
    languagesLabel.text         = languages;
    [languagesLabel sizeToFit];
    
    [self getImage:[currentUser objectForKey:@"imageName"]];
    

    
}//eom

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Methods

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

-(void)getImage: (NSString *)imageName
{
    NSString * serverPhotoAddress = @"http://192.241.186.107/Website/uploads/";
    
    serverPhotoAddress = [serverPhotoAddress stringByAppendingString:imageName];
    
    talentDetailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:serverPhotoAddress]]];
    
}//eom


#pragma mark - JSON server response
/* processing server response */
-(void) processServerDataResponse:(NSDictionary *) responce
{
    NSLog(@"INSIDE RESPONCE");
    //    NSLog(@"responce: %@", responce);
    
    NSDictionary * userResults      = [responce objectForKey:@"results"];
    
    int responceType                = [[userResults objectForKey:@"responseType"] intValue];
    
    //message
    //        NSDictionary * responceMessage  = [userResults objectForKey:@"message"];
    //        NSString * message              = [NSString stringWithFormat:@"%@", responceMessage];
    
    NSLog(@"results is %@", userResults);
    NSLog(@"responceType is %d", responceType);
    if(responceType > 0) //responce was good
    {
        //data
        NSDictionary * responceData  = [userResults objectForKey:@"data"];
        
        NSLog(@"**************************************************");
        
        NSLog(@"NAME: %@", [responceData objectForKey:@"firstName"]);
        
//        nameLabel.text = [responceData objectForKey:@"firstName"];
//        middleInitialLabel.text = [responceData objectForKey:@"middleInitial"];
//        lastNameLabel.text = [responceData objectForKey:@"lastName"];
//        
//        NSString *gender = [responceData objectForKey:@"gender"];
//        genderLabel.text = ([gender isEqualToString:@"0"]) ? @"Female" : @"Male";
//        
//        NSString *languages = [responceData objectForKey:@"nativelanguage"];
//        
//        languages = [languages stringByAppendingString:[responceData objectForKey:@"secondLanguage"]];
//        
//        languages = [languages stringByAppendingString:[responceData objectForKey:@"thirdLanguage"]];
//        
//        weightLabel.text = [responceData objectForKey:@"weight"];
//        heightLabel.text = [responceData objectForKey:@"height"];
//        eyeColorLabel.text = [responceData objectForKey:@"eyeColor"];
//        hairColorLabel.text = [responceData objectForKey:@"hairColor"];
//        
//        [self getImage:[responceData objectForKey:@"imageName"]];
        
        [self updateUSerInfo:responceData];
        
    }
    else if(responceType < 1) //invalid response
    {
        //notifying user code was accepted
        NSString * messsageToDisplay = @"No staff found";
        [self showAlert:@"Staff Detailed View" withMessage:messsageToDisplay and:@"OK"];
    }
}//eom


#pragma mark - JSON functions

/* sends search data to server */
-(void)sendSearchDataToServer
{
    NSLog(@"SENDING SEARCH DATA TO SERVER");
    NSString *serverAddress = @"http://192.241.186.107/Website/jsonPOST_getSearchStaffDetail.php";
    
    // preparing data to be sent
    NSMutableDictionary * searchData = [self prepareServerData];
    NSLog(@"");
    NSLog(@" about to send the following data: %@", searchData);
    NSLog(@"");
    
    //adding data to request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL URLWithString:  serverAddress ]];
    
    [request setHTTPMethod:@"POST"]; //request type
    
    //sending data
    NSError *error;
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:searchData options:0 error:&error];
    
    [request setHTTPBody:postdata];
    
    //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}//eo-action

/* prepares the data that will be sent to server */
-(NSMutableDictionary *) prepareServerData
{
    //creating initial list
    NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
    
    //staffID
    finalList[@"staffID"]   = [staffDetail objectForKey:@"staffID"];
    
    return finalList;
}//eom

/* error occurred sending data to server */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@" Failed with error '%@'", error);
}//eom

/* data received from server */
- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    //        NSLog(@"[1] from server replied: %@",rawExhibits);
    //
    //        NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //        NSLog(@"[2] responce from server %@",dataResponce);
    //
    //        // Get JSON objects into initial array
    //        NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    //        NSLog(@"[3] responce from server %@",rawExhibits2);
    
    //processing responce
    [self processServerDataResponse:rawExhibits];
    
}//eom

/* responce from server */
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    NSLog(@" responce: %@", httpResponse.description);
    
}//eo-action


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
