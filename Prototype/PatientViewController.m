//
//  PatientViewController.m
//  Prototype
//
//  Created by Haozhu Wang on 6/19/14.
//  Copyright (c) 2014 Haozhu Wang. All rights reserved.
//

#import "PatientViewController.h"

@interface PatientViewController ()

@end

@implementation PatientViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goback
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
