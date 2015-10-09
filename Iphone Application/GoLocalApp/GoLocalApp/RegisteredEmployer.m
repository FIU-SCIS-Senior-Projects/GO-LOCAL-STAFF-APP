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
    [self setPhoneNumber:@" "];
    [self setTypeOfEmployer:@" "];
    [self setAddress:@" "];
    [self setCity:@" "];
    [self setState:@" "];
    [self setZipCode:@" "];
    [self setIsuranceStatus: NO];
    

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

    //view controller 1
-(void) setPhoneNumber:(NSString *)phoneProvided
{
    phoneNumber = phoneProvided;
}

    //view controller 2
-(void) setEmployerName:(NSString *)employerNameProvided
{
    employerName = employerNameProvided;
}

-(void) setAddress:(NSString *)addressProvided
{
    address = addressProvided;
}

-(void) setCity:(NSString *)cityProvided
{
    city = cityProvided;
}

-(void) setState:(NSString *)stateProvided
{
    state = stateProvided;
}

-(void) setZipCode:(NSString *)zipCodeProvided
{
    zipCode = zipCodeProvided;
}

-(void) setTypeOfEmployer:(NSString *)typeOfEmployerProvided
{
    typeOfEmployer = typeOfEmployerProvided;
}

-(void) setIsuranceStatus:(BOOL)insuranceStatus
{
    employerhasInsurance = insuranceStatus;
}


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

-(NSString *) getPhoneNumber
{
    return phoneNumber;
}

-(NSString *) getEmployerName
{
    return employerName;
}

-(NSString *) getTypeOfEmployer
{
    return typeOfEmployer;
}

-(NSString *) getAddress
{
    return address;
}

-(NSString *) getCity
{
    return city;
}

-(NSString *) getState
{
    return state;
}

-(NSString *) getZipCode
{
    return zipCode;
}

-(BOOL) hasInsurance
{
    return employerhasInsurance;
}



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
