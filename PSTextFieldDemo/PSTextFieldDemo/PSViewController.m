//
//  PSViewController.m
//  PSTextFieldDemo
//
//  Created by Pawan Kumar Singh on 13/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import "PSViewController.h"
#import "PSTextField.h"

@interface PSViewController ()

@property (nonatomic, weak) IBOutlet PSTextField *userNameTxtFld;
@property (nonatomic, weak) IBOutlet PSTextField *password;
@property (nonatomic, weak) IBOutlet PSTextField *firstName;
@property (nonatomic, weak) IBOutlet PSTextField *lastName;

@end

@implementation PSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _userNameTxtFld.dataValidationType = PSDataValidationTypeUserName;
    _password.dataValidationType = PSDataValidationTypePassword;
    _firstName.dataValidationType = PSDataValidationTypeFirstName;
    _lastName.dataValidationType = PSDataValidationTypeLastName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate - 
- (void)textFieldDidEndEditing:(PSTextField *)textField
{
    [textField validateInput];
}

- (BOOL)textFieldShouldReturn:(PSTextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
