//
//  RegisteredEmployer.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisteredEmployer : NSObject
{
    
    NSString *accountType;
    int EmployerID;
    
    //view controller 0
    NSString *firstName;
    NSString *middleName;
    NSString *lastName;
    NSString *email;
    NSString *username;
    NSString *password;
    
    //view controller 1
    NSString *phoneNumber;
    
    //view controller 2
    NSString *employerName;
    NSString *typeOfEmployer;
    NSString *address;
    NSString *city;
    NSString *state;
    NSString *zipCode;
    BOOL employerhasInsurance;
    
    //view controller 3
    NSMutableArray *EmployeesInterested;
    
}

//accessors
-(NSString *) getAccountType;
-(NSString *) getEmployerID;
-(NSString *) getFirstName;
-(NSString *) getMiddleName;
-(NSString *) getLastName;
-(NSString *) getEmail;
-(NSString *) getUserName;
-(NSString *) getPassword;
-(NSString *) getPhoneNumber;
-(NSString *) getEmployerName;
-(NSString *) getTypeOfEmployer;
-(NSString *) getAddress;
-(NSString *) getCity;
-(NSString *) getState;
-(NSString *) getZipCode;
-(BOOL) hasInsurance;

//mutators
-(void) setEmployerID:(NSString *) employerIDProvided;
-(void) setName:(NSString *)fName withMiddleInitial:(NSString *)middleInitial andLastName:(NSString *)lName;
-(void) setEmail:(NSString *) emailProvided;
-(void) setUserName:(NSString *) usernameProvided;
-(void) setPassword:(NSString *) passwordProvided;
-(void) setPhoneNumber:(NSString *) phoneProvided;
-(void) setEmployerName:(NSString *) employerNameProvided;
-(void) setTypeOfEmployer:(NSString *) typeOfEmployerProvided;
-(void) setAddress:(NSString *) addressProvided;
-(void) setCity:(NSString *) cityProvided;
-(void) setState:(NSString *) stateProvided;
-(void) setZipCode:(NSString *) zipCodeProvided;
-(void) setIsuranceStatus:(BOOL) insuranceStatus;

-(void) printUserData;
@end
