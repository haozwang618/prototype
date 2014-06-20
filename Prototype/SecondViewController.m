//
//  SecondViewController.m
//  Prototype
//
//  Created by Haozhu Wang on 6/12/14.
//  Copyright (c) 2014 Haozhu Wang. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize patientTableView;
@synthesize patientViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [patientTableView setDataSource:self];
    [patientTableView setDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier =@"patientCell";
    return [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(patientViewController == nil)
    {
        patientViewController= [[PatientViewController alloc] initWithNibName:@"PatientViewController" bundle:nil];
    }
    [self presentViewController:patientViewController animated:YES completion:nil];
}

@end
