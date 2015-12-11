//
//  EmployerHomeViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisteredEmployer.h"

@interface EmployerHomeViewController : UIViewController

@property (strong, nonatomic) RegisteredEmployer *registeredEmployer;
@property (nonatomic) NSString *username;



@end
