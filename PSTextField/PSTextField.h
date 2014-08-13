//
//  PSTextField.h
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PSDataValidationType)
{
    PSDataValidationTypePassword = 1,   //alphanumeric password like hs939wd!
    PSDataValidationTypeUserName,       //alphanumeric username like john231
    PSDataValidationTypeFirstName,      //First name like Ramesh, Suresh, Gita etc
    PSDataValidationTypeLastName,       //Last name Yadav, Naidu etc
    PSDataValidationTypeEmail,          //Email id vishu@subdomain.domain
    PSDataValidationTypeMobileNumber,   //Mobile number - +911234567890
    PSDataValidationTypeDate,
    PSDataValidationTypeTime,
    PSDataValidationTypePlace,
    PSDataValidationTypeCity,
    PSDataValidationTypeState,
    PSDataValidationTypeCountry,
    PSDataValidationTypeDefault         //Will check for empty string
};

@interface PSTextField : UITextField

@property(nonatomic, assign) PSDataValidationType dataValidationType;

- (void)validateInput;

@end
