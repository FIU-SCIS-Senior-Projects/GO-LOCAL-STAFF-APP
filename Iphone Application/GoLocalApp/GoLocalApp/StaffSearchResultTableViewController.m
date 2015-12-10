//
//  StaffSearchResultTableViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "StaffSearchResultTableViewController.h"
#import "StaffSearchResultTableViewCell.h"
#import "StaffSearchResultProfileViewController.h"
#import "EmployerMapViewController.h"

#import "ServerAPI.h"

@interface StaffSearchResultTableViewController ()
{
    //arrays
    NSArray * sortByOptions;
    NSArray * orderByOptions;
    
    //pickers
    UIPickerView * sortByPickerView;
    UIPickerView * orderByPickerView;
    
    ServerAPI * api;
}
@end

@implementation StaffSearchResultTableViewController

@synthesize listOptions, profileImages, sortByTextFields, orderByTextFields;

//MARK: View Loading

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"StaffSearchResultTableViewController");
    
    NSLog(@"listOptions %@",listOptions);
    
    api = [[ServerAPI alloc]init];
    // preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    profileImages = [[NSMutableArray alloc] init];
    
    for( int i = 0; i < listOptions.count; i++ )
    {
        NSDictionary *temp = listOptions[i];
        
        NSString *imageName = [temp objectForKey:@"imageName"];
        if (imageName.length > 0)
        {
            UIImage * currImage = [self getImage:imageName];
            if (currImage != nil)
            {
                [profileImages addObject:currImage];
            }
        }
        //NSLog(@"Getting image for: %@", imageName);
        
        //profileImages[i] = [self getImage:imageName];
        
        //profileImages[i] = [self getImage:[temp objectForKey:@"imageName"]];
    }
    
    //    NSLog(@"Size of the array: %lu", (unsigned long)profileImages.count);
    
    
    //setting up pickers
    [self setUpAllPickers];
    
    //setting initial choices
    [self prepareSearchCriteriaInitialData];

    
}//eo-view


-(void)viewDidAppear:(BOOL)animated
{

}//eo-view


//MARK: Images

-(UIImage *)getImage: (NSString *)imageName
{
    
    NSString * serverPhotoAddress = api.uploads;
    
    //NSLog(@"Server address %@", serverPhotoAddress);
    
    serverPhotoAddress = [serverPhotoAddress stringByAppendingString:imageName];
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:serverPhotoAddress]]];
    
    //NSLog(@"Description: %@", img.description);
    
    return img;
    
    //    [image setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:serverPhotoAddress]]]];
    
}//eom

-(void)getImage: (NSString *)imageName : (UIImageView *)image
{
    NSString * serverPhotoAddress = api.uploads;
    
    serverPhotoAddress = [serverPhotoAddress stringByAppendingString:imageName];
    
    [image setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:serverPhotoAddress]]]];
    
}//eom


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}//eom

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listOptions.count;
}//eom


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StaffSearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchTalentResult" forIndexPath:indexPath];
    
    //curr row
    int row = (int)indexPath.row;
    
    //name
    NSDictionary * currPerson   = listOptions[row];
    NSString * firstName        = [currPerson objectForKey:@"firstName"];
    NSString * middleInitial    = [currPerson objectForKey:@"middleInitial"];
    NSString * lastName         = [currPerson objectForKey:@"lastName"];
    NSString * age              = [currPerson objectForKey:@"age"];
    
    NSString * name             = [firstName stringByAppendingString:@" "];
    name             = [name stringByAppendingString:middleInitial];
    
    cell.nameLabel.text = name;
    cell.lastNameLabel.text = lastName;
    cell.ageLabel.text = age;
    
    NSString *gender = [currPerson objectForKey:@"gender"];
    
    if( [gender isEqualToString:@"0"] )
    {
        [cell.gender setImage:[UIImage imageNamed:@"femaleA"]];
    }
    else
    {
        [cell.gender setImage:[UIImage imageNamed:@"maleA"]];
    }
    
    [cell.image setImage:profileImages[row]];
    
    //NSString *imageName = [currPerson objectForKey:@"imageName"];
    //NSLog(@"The image name is: %@", imageName);
    
    //[self getImage:[currPerson objectForKey:@"imageName"] :cell.image];
    

    return cell;
}//eom


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [listOptions removeObjectAtIndex:indexPath.row];
        [profileImages removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [[segue identifier] isEqualToString:@"showStaffSearchProfile"]  )
    {
        StaffSearchResultProfileViewController * detailView = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        //curr row
        int row = (int)myIndexPath.row;
        
        //current staff
        NSDictionary * currPerson   = listOptions[row];
        
//        NSLog(@"Count of currPerson: %lu", (unsigned long)[currPerson count]);
//        
//        for( id item in currPerson )
//        {
//            NSLog(@"%@", item);
//        }
        
//        NSLog(@"NAME: %@", [currPerson objectForKey:@"firstName"]);
        
        //passing all the information about the current staff selected
        detailView.staffDetail = currPerson;
    }
    else if( [[segue identifier] isEqualToString:@"goToStaffSearchMap"]  )
    {
        EmployerMapViewController *mapView = [segue destinationViewController];
        
        mapView.staffDetail = listOptions;
    }
}//eom


/* */
- (IBAction)goToMapMode:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"goToStaffSearchMap" sender:self];
}//eo-action



#pragma mark - prepare search criteria

/* sets up the initial selection for the search criteria selections  */
-(bool)prepareSearchCriteriaInitialData
{
    self.sortByTextFields.text  = sortByOptions[0];
    self.orderByTextFields.text = orderByOptions[0];
    
    return TRUE;
}//eom


/*  */
-(bool)prepareSearchCriteriaFinalData
{
    //sort selections
    NSString * sortBy   = self.sortByTextFields.text;
    NSString * orderBy  = self.orderByTextFields.text;
    
    BOOL ascending = true;
    
    //check if descending order
    if( [orderBy isEqualToString:@"Descending"])
    {
        ascending = false;
    }
    
    
    //Sorting
    if( [sortBy isEqualToString:@"Name"]   )
    {
        if(ascending)
        {
            [self sortNameAscending];
        }
        else
        {
            [self sortNameDescending];
        }
    }
    else if( [sortBy isEqualToString:@"Age"])
    {
        if(ascending)
        {
            [self sortAgeAscending];
        }
        else
        {
            [self sortAgeDescending];
        }
    }
    else if( [sortBy isEqualToString:@"Gender"])
    {
        if(ascending)
        {
            [self sortGenderAscending];
        }
        else
        {
            [self sortGenderDescending];
        }
    }
    
    NSLog(@"sort outcome: %@", listOptions);//testing
    
    return TRUE;
}//eom

//  MARK:   Sorting Functions

/* sorts the results in ascending order by their Name */
-(void)sortNameAscending
{
    int inner = 0;
    for(int outer = 1; outer < listOptions.count; outer++)
    {
        //curr dict
        NSDictionary * currDict = listOptions[outer];
        UIImage *currImg        = profileImages[outer];
        
        for(inner = outer; (inner > 0)
            && ([ [currDict objectForKey:@"firstName"] caseInsensitiveCompare:( [listOptions[inner-1] objectForKey:@"firstName"])
                 ] < 0 ) ; inner--)
        {
            listOptions[inner] = listOptions[inner-1];
            profileImages[inner] = profileImages[inner-1];
        }//eo-inner fl
        
        listOptions[inner] = currDict;
        profileImages[inner] = currImg;
        
    }//eo-outer fl
}//eom

/* sorts the results in descending order by their Name */
-(void)sortNameDescending
{
    int inner = 0;
    for(int outer = 1; outer < listOptions.count; outer++)
    {
        //curr dict
        NSDictionary * currDict = listOptions[outer];
        UIImage *currImg        = profileImages[outer];
        
        for(inner = outer; (inner > 0)
            && ([ [currDict objectForKey:@"firstName"] caseInsensitiveCompare:( [listOptions[inner-1] objectForKey:@"firstName"])
                 ] > 0 ) ; inner--)
        {
            listOptions[inner] = listOptions[inner-1];
            profileImages[inner] = profileImages[inner-1];
        }//eo-inner fl
        
        listOptions[inner] = currDict;
        profileImages[inner] = currImg;
        
    }//eo-outer fl
}//eom

/* sorts the results in ascending order by their Age */
-(void)sortAgeAscending
{
    int inner = 0;
    for(int outer = 1; outer < listOptions.count; outer++)
    {
        //curr dict
        NSDictionary * currDict = listOptions[outer];
        UIImage *currImg        = profileImages[outer];
        
        for(inner = outer; (inner > 0)
            &&
            ( (int)[[currDict objectForKey:@"age"] integerValue]
             <= (int)[[listOptions[inner-1] objectForKey:@"age"] integerValue] ) ; inner--)
        {
            listOptions[inner] = listOptions[inner-1];
            profileImages[inner] = profileImages[inner-1];
        }//eo-inner fl
        
        listOptions[inner] = currDict;
        profileImages[inner] = currImg;
    }//eo-outer fl
}//eom

/* sorts the results in descending order by their Age */
-(void)sortAgeDescending
{
    int inner = 0;
    for(int outer = 1; outer < listOptions.count; outer++)
    {
        //curr dict
        NSDictionary * currDict = listOptions[outer];
        UIImage *currImg        = profileImages[outer];
        
        for(inner = outer; (inner > 0)
            &&
            ( (int)[[currDict objectForKey:@"age"] integerValue]
             >= (int)[[listOptions[inner-1] objectForKey:@"age"] integerValue] ) ; inner--)
        {
            listOptions[inner] = listOptions[inner-1];
            profileImages[inner] = profileImages[inner-1];
        }//eo-inner fl
        
        listOptions[inner] = currDict;
        profileImages[inner] = currImg;
        
    }//eo-outer fl
}//eom

/* sorts the results in ascending order by their Gender */
-(void)sortGenderAscending
{
    int inner = 0;
    for(int outer = 1; outer < listOptions.count; outer++)
    {
        //curr dict
        NSDictionary * currDict = listOptions[outer];
        UIImage *currImg        = profileImages[outer];
        
        for(inner = outer; (inner > 0)
            &&
            ( (int)[[currDict objectForKey:@"gender"] integerValue]
             <= (int)[[listOptions[inner-1] objectForKey:@"gender"] integerValue] ) ; inner--)
        {
            listOptions[inner] = listOptions[inner-1];
            profileImages[inner] = profileImages[inner-1];
        }//eo-inner fl
        
        listOptions[inner] = currDict;
        profileImages[inner] = currImg;
    }//eo-outer fl
}//eom


/* sorts the results in descending order by their Gender */
-(void)sortGenderDescending
{
    int inner = 0;
    for(int outer = 1; outer < listOptions.count; outer++)
    {
        //curr dict
        NSDictionary * currDict = listOptions[outer];
        UIImage *currImg        = profileImages[outer];
        
        for(inner = outer; (inner > 0)
            &&
            ( (int)[[currDict objectForKey:@"gender"] integerValue]
             >= (int)[[listOptions[inner-1] objectForKey:@"gender"] integerValue] ) ; inner--)
        {
            listOptions[inner] = listOptions[inner-1];
            profileImages[inner] = profileImages[inner-1];
        }//eo-inner fl
        
        listOptions[inner] = currDict;
        profileImages[inner] = currImg;
        
    }//eo-outer fl
}//eom


#pragma mark - Pickers
/* sets up all pickers */
-(void)setUpAllPickers
{
    //sort by
    [self setUpSortBy];
    sortByOptions = [[NSArray alloc]
                     initWithObjects:@"Name",
                     @"Age",
                     @"Gender",
                     nil];
    
    //order by
    [self setUpOrderBy];
    orderByOptions = [[NSArray alloc]
                      initWithObjects:@"Ascending",
                      @"Descending",
                      nil];
}//eom

/* sets up the sort by textfield with a uipicker */
-(void)setUpSortBy
{
    // create a UIPicker view as a custom keyboard view
    sortByPickerView = [[UIPickerView alloc] init];
    [sortByPickerView sizeToFit];
    sortByPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    //sortByPickerView.delegate = self;
    //sortByPickerView.dataSource = self;
    sortByPickerView.showsSelectionIndicator = YES;
    
    //updating keyboard as uipicker
    self.sortByTextFields.inputView = sortByPickerView;
    
    // creating toolbar for 'Cancel' and 'Done' actions
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    keyboardDoneButtonView.barStyle = UIBarStyleBlack;
    keyboardDoneButtonView.translucent = YES;
    keyboardDoneButtonView.tintColor = nil;
    [keyboardDoneButtonView sizeToFit];
    
    //creating empty UIBarItem to force first item to the right
    UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //creating 'Done' UIBarItem to be the exit point for the picker
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(cancelClicked:)];
    
    //creating 'Done' UIBarItem to be the exit point for the picker
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(doneClicked:)] ;
    //adding UIBarItems to the Keyboard/Picker
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
    
    
    // Plug the keyboardDoneButtonView into the text field.
    self.sortByTextFields.inputAccessoryView = keyboardDoneButtonView;
}//eom


/* sets up the sort by textfield with a uipicker */
-(void)setUpOrderBy
{
    // create a UIPicker view as a custom keyboard view
    orderByPickerView = [[UIPickerView alloc] init];
    [orderByPickerView sizeToFit];
    orderByPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    //orderByPickerView.delegate = self;
    //orderByPickerView.dataSource = self;
    orderByPickerView.showsSelectionIndicator = YES;
    
    //updating keyboard as uipicker
    self.orderByTextFields.inputView = orderByPickerView;
    
    // creating toolbar for 'Cancel' and 'Done' actions
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    keyboardDoneButtonView.barStyle = UIBarStyleBlack;
    keyboardDoneButtonView.translucent = YES;
    keyboardDoneButtonView.tintColor = nil;
    [keyboardDoneButtonView sizeToFit];
    
    //creating empty UIBarItem to force first item to the right
    UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //creating 'Done' UIBarItem to be the exit point for the picker
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(cancelClicked:)];
    
    //creating 'Done' UIBarItem to be the exit point for the picker
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(doneClicked:)] ;
    //adding UIBarItems to the Keyboard/Picker
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
    
    
    // Plug the keyboardDoneButtonView into the text field.
    self.orderByTextFields.inputAccessoryView = keyboardDoneButtonView;
}//eom

/* */
- (void)doneClicked:(id)sender
{
    [self.sortByTextFields resignFirstResponder];
    [self.orderByTextFields resignFirstResponder];
    
    [self prepareSearchCriteriaFinalData];
    
    [self.tableView reloadData];
    
}//eom


/* */
- (void)cancelClicked:(id)sender
{
    [self.sortByTextFields resignFirstResponder];
    [self.orderByTextFields resignFirstResponder];
}//eom



#pragma mark - UIPickerView Delegate

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}//eom

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //orderBy
    if(pickerView == orderByPickerView)
    {
        return [orderByOptions count];
    }
    
    //sortBy
    return [sortByOptions count];
    
}//wom

//
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

//
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //orderBy
    if(pickerView == orderByPickerView)
    {
        return [orderByOptions objectAtIndex:row];
    }
    
    //sortBy
    return [sortByOptions objectAtIndex:row];
}//eom

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    ///orderBy
    if(pickerView == orderByPickerView)
    {
        //updating values
        self->orderByTextFields.text = [orderByOptions objectAtIndex:row];
    }
    //sortBy
    else if(pickerView == sortByPickerView)
    {
        //updating values
        self.sortByTextFields.text = [sortByOptions objectAtIndex:row];
    }
}//eom

//MARK: Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}//eom


@end
