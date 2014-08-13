//
//  NSString+Validation.h
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PSDataValidationErrorCode) {
    
    PSEmailLengthZeroErrorCode = 1000,              //Blank Email field
    PSEmailInvalidFormatErrorCode,                  //Email format invalid

    PSUserNameLengthZeroErrorCode,                  //Blank Username field
    PSUserNameLengthMinimumErrorCode,               //Username can't be less than minimum 7 character
    PSUserNameInvalidFormatErrorCode,               //Username format invalid

    PSFirstNameLengthZeroErrorCode,                 //Blank first name
    PSFirstNameInvalidFormatErrorCode,              //Any other character than A-Z or a-z or blankspace
    PSFirstNameMaxAllowedCharsErrorCode,            //Maximum allowed charcters (44 is considered for demo).

    PSLastNameLengthZeroErrorCode,                  //Blank last name
    PSLastNameInvalidFormatErrorCode,               //Any other character than A-Z or a-z or blankspace
    PSLastNameMaxAllowedCharsErrorCode,             //Maximum allowed charcters (44 is considered for demo).

    PSPasswordLengthZeroErrorCode,                  //Blank password
    PSPasswordLengthMinimumErrorCode,               //minimum length, (7 is considered for demo).
    PSPasswordInvalidFormatErrorCode,               //invalid characters

    PSCountryISDCodeLengthZeroErrorCode,
    PSInvalidCountryISDCodeErrorCode,
    PSPhoneNumberLengthZeroErrorCode,
    PSInvalidPhoneNumberErrorCode,
    
    PSCountryNameLengthZeroErrorCode,
    PSCountryNameInvalidFormatErrorCode,

    PSStateNameLengthZeroErrorCode,
    PSStateNameInvalidFormatErrorCode,

    PSCityNameLengthZeroErrorCode,
    PSCityNameInvalidFormatErrorCode,

    PSPlaceNameLengthZeroErrorCode,
    PSPlaceNameInvalidFormatErrorCode,

    PSDateLengthZeroErrorCode,
    PSTimeLengthZeroErrorCode,
    
    PSEmptyDataValidationErrorCode,
    
};

@interface NSString (Validation)

- (BOOL)validateUserName: (NSError **)error;
- (BOOL)validatePassword: (NSError **)error;
- (BOOL)validateFirstName: (NSError **)error;
- (BOOL)validateLastName: (NSError **)error;
- (BOOL)validateEmail: (NSError **)error;
- (BOOL)validateCountryCode: (NSError **)error;
- (BOOL)validatePhoneNumber: (NSError **)error;
- (BOOL)validateDate: (NSError **)error;
- (BOOL)validateTime: (NSError **)error;
- (BOOL)validatePlace: (NSError **)error;
- (BOOL)validateCity: (NSError **)error;
- (BOOL)validateState: (NSError **)error;
- (BOOL)validateCountry: (NSError **)error;
- (BOOL)validateEmpty: (NSError **)error;
@end
