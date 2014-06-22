//
//  FirstViewController.m
//  Prototype
//
//  Created by Haozhu Wang on 6/12/14.
//  Copyright (c) 2014 Haozhu Wang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize popView;
@synthesize picker;
@synthesize okayButton;
@synthesize cancelButton;
@synthesize dateLabel;
@synthesize dateF;
@synthesize imagePickerController;
@synthesize imagePicked;
@synthesize cameraMessage;
@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize patientViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    dateF=[[NSDateFormatter alloc]init];
    [dateF setDateFormat:@"MM/dd/yyyy"];
    if (imagePickerController == nil)
    {
        imagePickerController = [[ UIImagePickerController alloc] init];
        [imagePickerController setDelegate:self];
    }
    cameraMessage = [[UIAlertView alloc] initWithTitle:@"Get Photo" message:@"Photo Choices" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Photo Library", @"Take Photo", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showDatePicker:(id)sender
{
   
    if (popView == nil)
    {
        popView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 260)];
        [popView setBackgroundColor:[UIColor whiteColor]];
    }
    if(picker == nil)
    {
        picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,0, 320, 216)];
        [picker setBackgroundColor:[UIColor blueColor]];
        picker.datePickerMode=UIDatePickerModeDate;
        [popView addSubview:picker];
    }
    // Add picker to alert
    if(okayButton == nil)
    {
        okayButton = [[UIButton alloc] initWithFrame:CGRectMake(80,220, 80, 30)];
        [okayButton setTitle:@"Ok" forState:UIControlStateNormal];
        [okayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [okayButton setBackgroundColor:[UIColor grayColor]];
        [okayButton addTarget:self action:@selector(selectDate) forControlEvents:UIControlEventTouchUpInside];
        [popView addSubview:okayButton];
    }
    if(cancelButton == nil)
    {
        cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(200,220, 80, 30)];
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelButton setBackgroundColor:[UIColor grayColor]];
        [cancelButton addTarget:self action:@selector(removeFromViewScreen) forControlEvents:UIControlEventTouchUpInside];
        [popView addSubview:cancelButton];
    }
    
    
    [self.view addSubview:popView];
    
}

-(void) removeFromViewScreen
{
    [popView removeFromSuperview];
}

-(void) selectDate
{
    NSDate* pickedDate= [picker date];
    [[NSUserDefaults standardUserDefaults] setObject:pickedDate forKey:@"bdate"];
    
    [dateLabel setText:[dateF stringFromDate:pickedDate]];
    [self removeFromViewScreen];
    
}

-(IBAction)photoSelectAction:(id)sender
{
    [cameraMessage show];
    
}

-(IBAction)customization:(id)sender
{
    if(patientViewController == nil)
    {
        patientViewController= [[PatientViewController alloc] initWithNibName:@"PatientViewController" bundle:nil];
    }
    [self presentViewController:patientViewController animated:YES completion:nil];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [firstNameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
}

/*delegate alert*/
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Photo Library"])
    {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
    else if([title isEqualToString:@"Take Photo"])
    {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}

/*delegate method*/
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [imagePicked setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
