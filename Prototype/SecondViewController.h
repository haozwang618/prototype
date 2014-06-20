//
//  SecondViewController.h
//  Prototype
//
//  Created by Haozhu Wang on 6/12/14.
//  Copyright (c) 2014 Haozhu Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatientViewController.h"
@interface SecondViewController : UIViewController<UINavigationControllerDelegate,UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) PatientViewController *patientViewController;
@property (strong, nonatomic) IBOutlet UITableView *patientTableView;

@end
