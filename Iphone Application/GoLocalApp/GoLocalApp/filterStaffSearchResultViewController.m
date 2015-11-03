//
//  filterStaffSearchResultViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/1/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "filterStaffSearchResultViewController.h"
#import "StaffSearchResultTableViewController.h"

@interface filterStaffSearchResultViewController ()
{
    //arrays
    NSArray * sortByOptions;
    NSArray * orderByOptions;
    
    //pickers
    UIPickerView * sortByPickerView;
    UIPickerView * orderByPickerView;
}
@end

@implementation filterStaffSearchResultViewController

@synthesize listOptions;
@synthesize totalStaff;
@synthesize sortByTextFields,orderByTextFields;


#pragma mark - views
/* */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}//eo-view

/* */
-(void)viewDidAppear:(BOOL)animated
{
    //updating labels based on data received
    [self receivePassData];
    
    //setting up pickers
    [self setUpAllPickers];
    
    //setting initial choices
    [self prepareSearchCriteriaInitialData];
}//eo-view

#pragma mark - receive pass data
-(void)receivePassData
{
    NSLog(@"%@", listOptions);//testing
    
    self.totalStaff.text = [NSString stringWithFormat: @"%lu Total Staffs", (unsigned long)listOptions.count];
}//eom

#pragma mark - prepare and go to next controller

/* */
- (IBAction)showResults:(UIButton *)sender
{
    bool result = [self prepareSearchCriteriaFinalData];
    if(result)
    {
        [self performSegueWithIdentifier:@"GoTostaffSearchResults" sender:self];
    }
}//eo-action

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"GoTostaffSearchResults"])
    {
        StaffSearchResultTableViewController *controller = (StaffSearchResultTableViewController *)segue.destinationViewController;
        
        controller.listOptions  = listOptions;
        controller.sortBy       = self.sortByTextFields.text;
        controller.orderBy      = self.orderByTextFields.text;
    }
}//eom


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
    
    NSString * sortBy   = self.sortByTextFields.text;
    NSString * orderBy  = self.orderByTextFields.text;
    
    
    return TRUE;
}//eom


#pragma mark - Pickers
/* sets up all pickers */
-(void)setUpAllPickers
{
    //sort by
    [self setUpSortBy];
    sortByOptions = [[NSArray alloc]
                     initWithObjects:@"Name",
                                     @"Profession",
                                     @"Distance",
                                     nil];
    
    //order by
    [self setUpOrderBy];
    orderByOptions = [[NSArray alloc]
                     initWithObjects:@"Ascending",
                                     @"Descending",
                                     @"Random",
                                     nil];
}//eom

/* sets up the sort by textfield with a uipicker */
-(void)setUpSortBy
{
    // create a UIPicker view as a custom keyboard view
    sortByPickerView = [[UIPickerView alloc] init];
    [sortByPickerView sizeToFit];
    sortByPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    sortByPickerView.delegate = self;
    sortByPickerView.dataSource = self;
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
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(cancelClicked:)];
    
    //creating 'Done' UIBarItem to be the exit point for the picker
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
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
    orderByPickerView.delegate = self;
    orderByPickerView.dataSource = self;
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
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(cancelClicked:)];
    
    //creating 'Done' UIBarItem to be the exit point for the picker
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
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

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
