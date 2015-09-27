//
//  RegisteredEmployer.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "RegisteredEmployer.h"

@implementation RegisteredEmployer

/* constructor*/
-(id) init
{
    self = [super init];
    if (self)
    {
        [self updateAllWithBlankValues];
        
        //fetch back files from core data or receive user data from server
    }
    return self;
}

-(void) updateAllWithBlankValues
{
    accountType = @"Employer";
    [self setName:@" " withMiddleInitial:@" " andLastName:@" "];
    [self setNickname:@" "];
    [self setEmail:@" "];
    [self setUserName:@" "];
    [self setPassword:@" "];
    [self setDOB:@" "];

}

//mutators
    //view controller 0
-(void) setName:(NSString *)fName withMiddleInitial:(NSString *)middleInitial andLastName:(NSString *)lName
{
    firstName = fName;
    middleName = middleInitial;
    lastName = lName;
    
}//eom

-(void) setNickname:(NSString *) nicknameProvided
{
    nickName = nicknameProvided;
}//eom

-(void) setEmail:(NSString *) emailProvided
{
    email = emailProvided;
}//eom

-(void) setUserName:(NSString *) usernameProvided
{
    username = usernameProvided;
}//eom

-(void) setPassword:(NSString *) passwordProvided
{
    password = passwordProvided;
}//eom


-(void) setDOB:(NSString *) dobProvided
{
    dateOfBirth = dobProvided;
}//eom




//accessors

-(NSString *) getAccountType
{
    return accountType;
}//eom

-(NSString *) getFirstName
{
    return firstName;
}//eom

-(NSString *) getMiddleName
{
    return middleName;
}//eom

-(NSString *) getLastName
{
    return lastName;
}//eom


-(NSString *) getNickName
{
    return nickName;
}//eom


-(NSString *) getEmail
{
    return email;
}//eom

-(NSString *) getUserName
{
    return username;
}//eom

-(NSString *) getPassword
{
    return password;
}//eom

-(NSString *) getDateOfBirth
{
    return dateOfBirth;
}//eom



-(void) printUserData
{
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" ***********************************************");
    //view controller 1
    NSLog(@" account type:    %@", accountType);
    NSLog(@" firstName:       %@", firstName);
    NSLog(@" middleName:      %@", middleName);
    NSLog(@" lastName:        %@", lastName);
    NSLog(@" nickName:        %@", nickName);
    NSLog(@" email:           %@", email);
    NSLog(@" password:        %@", password);
    NSLog(@" dob:             %@", dateOfBirth);
  
    
    NSLog(@" - - - - - - - - - - - - - ");
    
}//eom

@end
