//
//  StaffRegistration13ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration12ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *bodyImageView;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)takePhoto:(id)sender;

- (IBAction)selectExistingPhoto:(id)sender;

- (IBAction)submitForm:(id)sender;


@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end
