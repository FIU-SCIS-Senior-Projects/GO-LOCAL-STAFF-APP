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
    [self setEmail:@" "];
    [self setUserName:@" "];
    [self setPassword:@" "];
    [self setPhoneNumber:@" "];
    [self setTypeOfEmployer:@" "];
    [self setAddress:@" "];
    [self setCity:@" "];
    [self setState:@" "];
    [self setZipCode:@" "];
    [self setIsuranceStatus: NO];
    

}

//mutators


-(void) setEmployerID:(int) employerIDProvided
{
    EmployerID  =   employerIDProvided;
}

    //view controller 0
-(void) setName:(NSString *)fName withMiddleInitial:(NSString *)middleInitial andLastName:(NSString *)lName
{
    firstName = fName;
    middleName = middleInitial;
    lastName = lName;
    
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


-(NSString *) getEmployerID
{
    return EmployerID;
}

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
    NSLog(@" email:           %@", email);
    NSLog(@" password:        %@", password);
    NSLog(@" phoneNumber:     %@", phoneNumber);
    NSLog(@" employerName:    %@", employerName);
    NSLog(@" typeOfEmployer:  %@", typeOfEmployer);
    NSLog(@" address:         %@", address);
    NSLog(@" city:            %@", city);
    NSLog(@" zipCode:         %@", zipCode);
    NSLog(@" state:           %@", state);
    NSLog(@" hasInsurance:    %d", employerhasInsurance);
  
    
    NSLog(@" - - - - - - - - - - - - - ");
    
}//eom

@end
