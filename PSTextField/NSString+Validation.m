//
//  NSString+Validation.m
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import "NSString+Validation.h"

NSString  *PSDataValidationErrorDomain             = @"com.pserror.inputvalidation";

NSString const *PSEmailLengthZeroErrorDesc              = @"Email field empty.";
NSString const *PSEmailInvalidFormatErrorDesc           = @"Email address is not valid.";
NSString const *PSUserNameLengthZeroErrorDesc           = @"Username field empty.";
NSString const *PSUserNameInvalidFormatErrorDesc        = @"User name can not contain special characters.";
NSString const *PSUserNameLengthMinimumErrorDesc        = @"User name can not be less than 7 characters.";
NSString const *PSPersonNameValidationErrorDesc         = @"Invalid Name.";

NSString const *PSFirstNameEmptyErrorDesc               = @"First name can't be empty.";
NSString const *PSFirstNameMaxAllowedCharsErrorDesc     = @"First name can't be more than 44 characters.";
NSString const *PSFirstNameInvalidFormatErrorDesc       = @"First name can't contain special characters.";

NSString const *PSLastNameEmptyErrorDesc                = @"Last name can't be empty";
NSString const *PSLastNameMaxAllowedCharsErrorDesc      = @"Last name can't be more than 44 characters.";
NSString const *PSLastNameInvalidFormatErrorDesc        = @"Last name can't contain special characters";

NSString const *PSPasswordInvalidFormatErrorDesc        = @"Invalid Password.";
NSString const *PSPasswordLengthZeroErrorDesc           = @"Password field empty.";
NSString const *PSPasswordLengthMinimumErrorDesc        = @"Password should be minimum 7 characters.";
NSString const *PSPersonNameLengthZeroErrorDesc         = @"Username field can't be empty.";
NSString const *PSCountryISDCodeLengthZeroErrorDesc     = @"Enter country code.";
NSString const *PSInvalidCountryISDCodeErrorDesc        = @"Enter valid country code.";
NSString const *PSPhoneNumberLengthZeroErrorDesc        = @"Enter phone number.";
NSString const *PSInvalidPhoneNumberErrorDesc           = @"Enter valid phone number.";
NSString const *PSEmptyStringErrorDesc                  = @"This field can't be empty.";

NSString const *PSDateEmptyErrorDesc                    = @"Date can't be empty.";
NSString const *PSTimeEmptyErrorDesc                    = @"Time can't be empty.";

NSString const *PSPlaceNameEmptyErrorDesc               = @"Place can't be empty.";
NSString const *PSPlaceNameInvalidFormatErrorDesc       = @"Place name is invalid.";

NSString const *PSCityNameEmptyErrorDesc                = @"City can't be empty.";
NSString const *PSCityNameInvalidFormatErrorDesc        = @"City name is invalid.";

NSString const *PSStateNameEmptyErrorDesc               = @"State can't be empty.";
NSString const *PSStateNameInvalidFormatErrorDesc       = @"State name is invalid.";

NSString const *PSCountryNameEmptyErrorDesc             = @"Country can't be empty.";
NSString const *PSCountryNameInvalidFormatErrorDesc     = @"Country name is invalid.";

@implementation NSString (Validation)

- (BOOL)validateFirstName  : (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *firstNameRegex = @"[A-Za-z. ]{1,44}";
    NSPredicate *firstName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", firstNameRegex];
    
    if(!self || [self length] == 0){
        
        errorCode = PSFirstNameLengthZeroErrorCode;
        errorDescStr = (NSString *)PSFirstNameEmptyErrorDesc;
        
    }else if([self length] > 44){
        
        errorCode = PSFirstNameMaxAllowedCharsErrorCode;
        errorDescStr = (NSString *)PSFirstNameMaxAllowedCharsErrorDesc;
        
    }else if (![firstName evaluateWithObject:self]) {
        
        errorCode = PSFirstNameInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSFirstNameInvalidFormatErrorDesc;
        
    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO){
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validateLastName  : (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *firstNameRegex = @"[A-Za-z. ]{1,44}";
    NSPredicate *firstName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", firstNameRegex];
    
    if(!self || [self length] == 0){
        
        errorCode = PSLastNameLengthZeroErrorCode;
        errorDescStr = (NSString *)PSLastNameEmptyErrorDesc;
        
    }else if([self length] > 44){
        
        errorCode = PSLastNameMaxAllowedCharsErrorCode;
        errorDescStr = (NSString *)PSLastNameMaxAllowedCharsErrorDesc;
        
    }else if (![firstName evaluateWithObject:self]) {
        
        errorCode = PSLastNameInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSLastNameInvalidFormatErrorDesc;
        
    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO){
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validateEmail : (NSError * __autoreleasing *)error
{
    
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    
    NSString *emailRegex = @"[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *email = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if(!self || [self length] == 0){
        
        errorCode =  PSEmailLengthZeroErrorCode;
        errorDescStr = (NSString *)PSEmailLengthZeroErrorDesc;
        
    }else if (![email evaluateWithObject:self]) {
        
        errorCode =  PSEmailInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSEmailInvalidFormatErrorDesc;
        
    }else{
        
        *error = nil;
        success = YES;
    }
    
    if(success == NO)
    {
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:PSEmailLengthZeroErrorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validateUserName  : (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *userNameRegex = @"[A-Z0-9a-z._-]{7,32}";
    NSPredicate *userName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", userNameRegex];
    
    if(!self || [self length] == 0){
        
        errorCode = PSUserNameLengthZeroErrorCode;
        errorDescStr = (NSString *)PSUserNameLengthZeroErrorDesc;
        
    }else if(self.length < 7){
        
        errorCode = PSUserNameLengthMinimumErrorCode;
        errorDescStr = (NSString *)PSUserNameLengthMinimumErrorDesc;
        
    }else if (![userName evaluateWithObject:self]) {
        errorCode = PSUserNameInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSUserNameInvalidFormatErrorDesc;
        
    }else{
        if (error != NULL)*error = nil;
        success = YES;
    }
    
    if(success == NO)
    {
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validatePassword  : (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *passwordRegex = @"[A-Z0-9a-z]{7,32}";
    NSPredicate *password = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    
    if(!self || [self length]== 0){
        
        errorCode = PSPasswordLengthZeroErrorCode;
        errorDescStr = (NSString *)PSPasswordLengthZeroErrorDesc;
        
    }else if(self.length < 7){
        errorCode = PSPasswordLengthMinimumErrorCode;
        errorDescStr = (NSString *)PSPasswordLengthMinimumErrorDesc;
        
    }else if (![password evaluateWithObject:self]) {

        errorCode = PSPasswordInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSPasswordInvalidFormatErrorDesc;
        
    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO)
    {
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
    
}

-(BOOL)validateCountryCode : (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *phoneRegex = @"[+][0-9]{1,4}";
    NSPredicate *countryCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    if(!self || [self length]== 0){
        errorCode = PSCountryISDCodeLengthZeroErrorCode;
        errorDescStr = (NSString *)PSCountryISDCodeLengthZeroErrorDesc;

        if (error != NULL)
        {
            *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                         code: PSCountryISDCodeLengthZeroErrorCode
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSCountryISDCodeLengthZeroErrorDesc, NSLocalizedDescriptionKey,nil]];
        }
        
    }
    else if(![countryCodeTest evaluateWithObject:self])
    {
        errorCode = PSInvalidCountryISDCodeErrorCode;
        errorDescStr = (NSString *)PSInvalidCountryISDCodeErrorDesc;
        
    }else{
                *error = nil;
            success = YES;
    }
    
    if(success == NO)
    {
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validatePhoneNumber : (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *phoneRegex = @"[0-9]{7,12}";
    NSPredicate *phoneNumberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    if(!self || [self length]== 0){
        errorCode = PSPhoneNumberLengthZeroErrorCode;
        errorDescStr = (NSString *)PSPhoneNumberLengthZeroErrorDesc;        
    }
    else if(![phoneNumberPredicate evaluateWithObject:self])
    {
            errorCode = PSInvalidPhoneNumberErrorCode;
            errorDescStr = (NSString *)PSInvalidPhoneNumberErrorDesc;

    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO)
    {
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey:errorDescStr}];
    }
    return success;
}

- (BOOL)validateEmpty: (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    if(!self || [self length]== 0){
        *error = [NSError errorWithDomain: PSDataValidationErrorDomain
                                     code: PSEmptyDataValidationErrorCode
                                 userInfo:@{NSLocalizedDescriptionKey:PSEmptyStringErrorDesc}];
    }else{
        success = YES;
    }
    return success;
}

- (BOOL)validateDate: (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    if(!self || [self length]== 0){
        *error = [NSError errorWithDomain: PSDataValidationErrorDomain
                                     code: PSDateLengthZeroErrorCode
                                 userInfo:@{NSLocalizedDescriptionKey:PSDateEmptyErrorDesc}];
    }else{
        success = YES;
    }
    return success;
}

- (BOOL)validateTime: (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    if(!self || [self length]== 0){
        *error = [NSError errorWithDomain: PSDataValidationErrorDomain
                                     code: PSTimeLengthZeroErrorCode
                                 userInfo:@{NSLocalizedDescriptionKey:PSTimeEmptyErrorDesc}];
    }else{
        success = YES;
    }
    return success;
}

- (BOOL)validatePlace: (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *placeNameRegex = @"[A-Za-z ]{1,44}";
    NSPredicate *placeName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", placeNameRegex];
    
    if(!self || [self length] == 0){
        
        errorCode = PSPlaceNameLengthZeroErrorCode;
        errorDescStr = (NSString *)PSPlaceNameEmptyErrorDesc;
        
    }else if (![placeName evaluateWithObject:self]) {
        
        errorCode = PSPlaceNameInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSPlaceNameInvalidFormatErrorDesc;
        
    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO){
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validateCity: (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *cityNameRegex = @"[A-Za-z ]{1,44}";
    NSPredicate *cityName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cityNameRegex];
    
    if(!self || [self length] == 0){
        
        errorCode = PSCityNameLengthZeroErrorCode;
        errorDescStr = (NSString *)PSCityNameEmptyErrorDesc;
        
    }else if (![cityName evaluateWithObject:self]) {
        
        errorCode = PSCityNameInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSCityNameInvalidFormatErrorDesc;
        
    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO){
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validateState: (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *stateNameRegex = @"[A-Za-z ]{1,44}";
    NSPredicate *stateName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stateNameRegex];
    
    if(!self || [self length] == 0){
        
        errorCode = PSStateNameLengthZeroErrorCode;
        errorDescStr = (NSString *)PSStateNameEmptyErrorDesc;
        
    }else if (![stateName evaluateWithObject:self]) {
        
        errorCode = PSStateNameInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSStateNameInvalidFormatErrorDesc;
        
    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO){
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

- (BOOL)validateCountry: (NSError * __autoreleasing *)error
{
    BOOL success = NO;
    PSDataValidationErrorCode errorCode = PSEmptyDataValidationErrorCode;
    NSString *errorDescStr = (NSString*)PSEmptyStringErrorDesc;
    NSString *countryNameRegex = @"[A-Za-z ]{1,44}";
    NSPredicate *countryName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", countryNameRegex];
    
    if(!self || [self length] == 0){
        
        errorCode = PSCountryNameLengthZeroErrorCode;
        errorDescStr = (NSString *)PSCountryNameEmptyErrorDesc;
        
    }else if (![countryName evaluateWithObject:self]) {
        
        errorCode = PSCountryNameInvalidFormatErrorCode;
        errorDescStr = (NSString *)PSCountryNameInvalidFormatErrorDesc;
        
    }else{
        *error = nil;
        success = YES;
    }
    
    if(success == NO){
        *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                     code:errorCode
                                 userInfo:@{NSLocalizedDescriptionKey: errorDescStr}];
    }
    return success;
}

@end
