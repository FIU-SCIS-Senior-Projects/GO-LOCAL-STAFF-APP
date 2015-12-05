//
//  ServerAPI.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 12/2/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "ServerAPI.h"

@implementation ServerAPI

-(id)init
{
    self = [super init];
    if (self)
    {
        NSString * serverBaseUrl = @"http://192.241.186.107/Website/";
        urlList = [[NSDictionary alloc] initWithObjectsAndKeys:
       [serverBaseUrl stringByAppendingString:@"jsonPOST_smsForgotPassword.php"]    ,@"forgotPassword_pt1",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_forgotPassword.php"]       ,@"forgotPassword_pt2",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_login.php"]                ,@"login",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_getSearchStaffDetail.php"] ,@"searchStaffDetail",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_registration.php"]         ,@"registration",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_getTermsAgreements.php"]   ,@"termsAgreements",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_searchTalent.php"]         ,@"searchTalent",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_sms.php"]                  ,@"registerUserVerifySMS_pt1",
       [serverBaseUrl stringByAppendingString:@"jsonPOST_smsCode.php"]              ,@"registerUserVerifySMS_pt2",
     [serverBaseUrl stringByAppendingString:@"uploads/"]                            ,@"uploads",
       nil];
        
        //NSLog(@" urlList has %@", urlList);
    }
    return self;
}


+(ServerAPI *)sharedAPIModel
{
    static dispatch_once_t once;
    static ServerAPI *sharedModel;
    dispatch_once(&once, ^{
        //        sharedModel = [[self alloc] init];
        sharedModel = [[super allocWithZone:NULL] init];
    });
    
    return sharedModel;
}//eom

-(NSString *) uploads
{
    NSString * url = [urlList objectForKey:@"uploads"];
    return url;
}//eom

-(NSString *) registerUserVerifySMSPt1
{
    NSString * url = [urlList objectForKey:@"registerUserVerifySMS_pt1"];
    return url;
}//eom


-(NSString *) registerUserVerifySMSPt2
{
    NSString * url = [urlList objectForKey:@"registerUserVerifySMS_pt2"];
    return url;
}//eom

-(NSString *) termsAgreements
{
    NSString * url = [urlList objectForKey:@"termsAgreements"];
    return url;
}//eom

-(NSString *) searchTalent
{
    NSString * url = [urlList objectForKey:@"searchTalent"];
    return url;
}//eom


-(NSString *) login
{
    NSString * url = [urlList objectForKey:@"login"];
    return url;
}//eom

-(NSString *) registration
{
    NSString * url = [urlList objectForKey:@"registration"];
    return url;
}//eom


-(NSString *) searchStaffDetail
{
    NSString * url = [urlList objectForKey:@"searchStaffDetail"];
    return url;
}//eom

-(NSString *) forgotPasswordPt1
{
    NSString * url = [urlList objectForKey:@"forgotPassword_pt1"];
    return url;
}//eom

-(NSString *) forgotPasswordPt2
{
    NSString * url = [urlList objectForKey:@"forgotPassword_pt2"];
    return url;
}//eom

@end
