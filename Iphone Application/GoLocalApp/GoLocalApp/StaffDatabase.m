//
//  StaffDatabase.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/23/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "StaffDatabase.h"
#import "AppDelegate.h"

@implementation StaffDatabase

/* constructor*/
-(id) init
{
    self = [super init];
    if (self)
    {
        entityName = @"StaffUser";
    }
    return self;
}



#pragma mark - Core Data functions



/* saves photo to coredata */
-(BOOL)saveSelfieImage:(UIImage *)imageProvided
{
    //saving providing photo
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    
    NSData * imageData = UIImagePNGRepresentation(imageProvided);
    
    [newContact setValue:imageData forKey:@"selfiePhoto"];
    
    NSError *error;
    if ([context save:&error] == NO) {
        NSAssert(NO, @"Save should not fail\n%@", [error localizedDescription]);
        return FALSE;
    }
    
    return TRUE;
}//eom

/* saves photo to coredata */
-(BOOL)saveBodyImage:(UIImage *)imageProvided
{
    //saving providing photo
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newContact;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:context];
    
    NSData * imageData = UIImagePNGRepresentation(imageProvided);
    
    [newContact setValue:imageData forKey:@"bodyPhoto"];
    
    NSError *error;
    if ([context save:&error] == NO) {
        NSAssert(NO, @"Save should not fail\n%@", [error localizedDescription]);
        return FALSE;
    }
    
    return TRUE;
}//eom



/* retrieves selfie photo from core data and returns the UIImage */
-(UIImage *) getSelfiePhoto
{
    
    UIImage * finalImage;
    
    AppDelegate *appDelegate = [ [UIApplication sharedApplication] delegate ];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    //creating request to be made
    NSFetchRequest *request = [[ NSFetchRequest alloc] init];
    
    //creating the entity name and updating request with entity
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext: context];
    [request setEntity:entityDesc];
    
    //    //creating predicate and adding it to the request
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(selfiePhoto = %@)"];
    //    [request setPredicate:pred];
    
    //
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects =[context executeFetchRequest:request error:&error];
    if( [objects count] == 0)
    {
        NSLog(@"No matches");
        return finalImage;
    }
    else
    {
        matches = objects[0];
        NSData * picData = [matches valueForKey:@"selfiePhoto"];
        finalImage = [UIImage imageWithData:picData];
    }
    
    return finalImage;
}//eom


/* retrieves body photo from core data and returns the UIImage */
-(UIImage *) getBodyPhoto
{
    
    UIImage * finalImage;
    
    AppDelegate *appDelegate = [ [UIApplication sharedApplication] delegate ];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    //creating request to be made
    NSFetchRequest *request = [[ NSFetchRequest alloc] init];
    
    //creating the entity name and updating request with entity
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext: context];
    [request setEntity:entityDesc];
    
    //    //creating predicate and adding it to the request
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(selfiePhoto = %@)"];
    //    [request setPredicate:pred];
    
    //
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects =[context executeFetchRequest:request error:&error];
    if( [objects count] == 0)
    {
        NSLog(@"No matches");
        return finalImage;
    }
    else
    {
        matches = objects[0];
        NSData * picData = [matches valueForKey:@"bodyPhoto"];
        finalImage = [UIImage imageWithData:picData];
    }
    
    return finalImage;
}//eom









/* saving staff user basic info to coredata */
-(void)saveStaffUSerInfoToCoreData
{
    
//    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//    NSManagedObjectContext *context = [appDelegate managedObjectContext];
//    
//    NSManagedObject *newContact;
//    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"StaffUser" inManagedObjectContext:context];
//    
//    NSString *name = [self.firstName stringByAppendingFormat: @" %@ %@" ,self.middleName ,self.lastName ];
//    [newContact setValue:name forKey:@"name"];
//    
//    NSError *error;
//    [context save:&error];
    
}//eom




/* retrieves photo from core data and returns the UIImage */
-(BOOL) deleteAPhoto:(NSString *) photoType fromTable:(NSString *) entityName
{
    
    //    AppDelegate *appDelegate = [ [UIApplication sharedApplication] delegate ];
    //    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //
    //    //creating request to be made
    //    NSFetchRequest *request = [[ NSFetchRequest alloc] init];
    //
    //    //creating the entity name and updating request with entity
    //    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext: context];
    //    [request setEntity:entityDesc];
    //
    //    //    //creating predicate and adding it to the request
    //    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(selfiePhoto = %@)"];
    //    //    [request setPredicate:pred];
    //
    //    //
    //    NSManagedObject *matches = nil;
    //    NSError *error;
    //    NSArray *objects =[context executeFetchRequest:request error:&error];
    //    if( [objects count] == 0)
    //    {
    //        NSLog(@"No matches");
    //    }
    //    else
    //    {
    //        NSLog(@"objects: %@", objects);
    //        matches = objects[0];
    //        NSLog(@"found %@", matches);
    //        [context]
    //        [context deleteObject:[matches valueForKey:photoType]];
    //
    //        NSError *error2 = nil;
    //        if ([context save:&error2] == NO) {
    //            NSAssert(NO, @"Save should not fail\n%@", [error2 localizedDescription]);
    //            return FALSE;
    //        }
    //        return TRUE;
    //    }
    
    return FALSE;
}//eom


/* retrieves photo from core data and returns the UIImage */
-(UIImage *) retrievePhoto:(NSString *) photoType fromTable:(NSString *) entityName
{
    
    UIImage * finalImage;
    
    AppDelegate *appDelegate = [ [UIApplication sharedApplication] delegate ];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    //creating request to be made
    NSFetchRequest *request = [[ NSFetchRequest alloc] init];
    
    //creating the entity name and updating request with entity
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entityName inManagedObjectContext: context];
    [request setEntity:entityDesc];
    
    //    //creating predicate and adding it to the request
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(selfiePhoto = %@)"];
    //    [request setPredicate:pred];
    
    //
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects =[context executeFetchRequest:request error:&error];
    if( [objects count] == 0)
    {
        NSLog(@"No matches");
        return finalImage;
    }
    else
    {
        matches = objects[0];
        NSData * picData = [matches valueForKey:photoType];
        finalImage = [UIImage imageWithData:picData];
    }
    
    return finalImage;
}//eom




@end
