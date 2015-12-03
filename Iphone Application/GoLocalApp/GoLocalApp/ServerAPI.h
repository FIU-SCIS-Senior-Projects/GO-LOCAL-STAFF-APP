//
//  ServerAPI.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 12/2/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerAPI : NSObject
{
    NSDictionary * urlList;
}



//shared Model
+(ServerAPI *)sharedAPIModel;


-(NSString *) registerUserVerifySMSPt1;
-(NSString *) registerUserVerifySMSPt2;
-(NSString *) termsAgreements;
-(NSString *) searchTalent;
-(NSString *) registration;
-(NSString *) login;
-(NSString *) searchStaffDetail;
-(NSString *) forgotPasswordPt1;
-(NSString *) forgotPasswordPt2;

@end
