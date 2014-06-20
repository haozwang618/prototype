//
//  FirstViewController.h
//  Prototype
//
//  Created by Haozhu Wang on 6/12/14.
//  Copyright (c) 2014 Haozhu Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imagePicked;
@property (strong,nonatomic) UIView * popView;
@property (strong,nonatomic) UIDatePicker *picker;
@property (strong,nonatomic) UIButton * okayButton;
@property (strong,nonatomic) UIButton * cancelButton;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) NSDateFormatter* dateF;
@property (strong, nonatomic) UIImagePickerController *imagePickerController;

-(IBAction)showDatePicker:(id)sender;
@end
