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

- (BOOL)validateUserName: (NSError * __autoreleasing *)error;
- (BOOL)validatePassword: (NSError * __autoreleasing *)error;
- (BOOL)validateFirstName: (NSError * __autoreleasing *)error;
- (BOOL)validateLastName: (NSError * __autoreleasing *)error;
- (BOOL)validateEmail: (NSError * __autoreleasing *)error;
- (BOOL)validateCountryCode: (NSError * __autoreleasing *)error;
- (BOOL)validatePhoneNumber: (NSError * __autoreleasing *)error;
- (BOOL)validateDate: (NSError * __autoreleasing *)error;
- (BOOL)validateTime: (NSError * __autoreleasing *)error;
- (BOOL)validatePlace: (NSError * __autoreleasing *)error;
- (BOOL)validateCity: (NSError * __autoreleasing *)error;
- (BOOL)validateState: (NSError * __autoreleasing *)error;
- (BOOL)validateCountry: (NSError * __autoreleasing *)error;
- (BOOL)validateEmpty: (NSError * __autoreleasing *)error;
@end
