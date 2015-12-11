//
//  StaffRegistration12ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration11ViewController : UIViewController< UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIImageView *headshotImageView;

@property (weak, nonatomic) IBOutlet UILabel *notRequireForRegistrationLabel;

- (IBAction)takePhoto:(id)sender;

- (IBAction)selectExistingPhoto:(id)sender;

- (IBAction)submitForm:(id)sender;

@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end
