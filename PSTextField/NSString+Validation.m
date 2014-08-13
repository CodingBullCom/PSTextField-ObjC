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

- (BOOL)validateFirstName  : (NSError **)error
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

- (BOOL)validateLastName  : (NSError **)error
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

- (BOOL)validateEmail : (NSError **)error {
    
    BOOL success = NO;
    NSString *emailRegex = @"[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *email = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if(!self || [self length] == 0){
        if (error != NULL) *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                                        code:PSEmailLengthZeroErrorCode
                                                    userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSEmailLengthZeroErrorDesc, NSLocalizedDescriptionKey,nil]];
        
    }else if (![email evaluateWithObject:self]) {
        
        if (error != NULL) *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                                        code:PSEmailInvalidFormatErrorCode
                                                    userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSEmailInvalidFormatErrorDesc,NSLocalizedDescriptionKey,nil]];
    }else{
        if (error != NULL) *error = nil;
        success = YES;
    }
    return success;
}

- (BOOL)validateUserName  : (NSError **)error
{
    BOOL success = NO;
    NSString *userNameRegex = @"[A-Z0-9a-z._-]{7,32}";
    NSPredicate *userName = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", userNameRegex];
    
    if(!self || [self length] == 0){
        if (error != NULL)
        {
            *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                         code:PSUserNameLengthZeroErrorCode
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSUserNameLengthZeroErrorDesc, NSLocalizedDescriptionKey,nil]];
        }
    }else if(self.length < 7){
        if (error != NULL)
        {
            *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                         code:PSUserNameLengthMinimumErrorCode
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSUserNameLengthMinimumErrorDesc, NSLocalizedDescriptionKey,nil]];
        }
    }else if (![userName evaluateWithObject:self]) {
        if (error != NULL)
        {
            *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                         code:PSUserNameInvalidFormatErrorCode
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSUserNameInvalidFormatErrorDesc,NSLocalizedDescriptionKey,nil]];
        }
    }else{
        if (error != NULL)*error = nil;
        success = YES;
    }
    return success;
}

- (BOOL)validatePassword  : (NSError **)error
{
    BOOL success = NO;
    NSString *passwordRegex = @"[A-Z0-9a-z]{7,32}";
    NSPredicate *password = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    
    if(!self || [self length]== 0){
        if (error != NULL) *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                                        code:PSPasswordLengthZeroErrorCode
                                                    userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSPasswordLengthZeroErrorDesc, NSLocalizedDescriptionKey,nil]];
        
    }else if(self.length < 7){
        if (error != NULL)*error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                                       code:PSPasswordLengthMinimumErrorCode
                                                   userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSPasswordLengthMinimumErrorDesc, NSLocalizedDescriptionKey,nil]];
        
    }else if (![password evaluateWithObject:self]) {
        
        if (error != NULL)*error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                                       code:PSPasswordInvalidFormatErrorCode
                                                   userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSPasswordInvalidFormatErrorDesc,NSLocalizedDescriptionKey,nil]];
    }else{
        if (error != NULL)*error = nil;
        success = YES;
    }
    return success;
    
}

-(BOOL)validateCountryCode : (NSError **)error
{
    BOOL success = NO;
    NSString *phoneRegex = @"[+][0-9]{1,4}";
    NSPredicate *countryCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    if(!self || [self length]== 0){
        if (error != NULL)
        {
            *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                         code: PSCountryISDCodeLengthZeroErrorCode
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSCountryISDCodeLengthZeroErrorDesc, NSLocalizedDescriptionKey,nil]];
        }
        
    }
    else{
        
        if(![countryCodeTest evaluateWithObject:self])
        {
            if (error != NULL)
            {
                *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                             code:PSInvalidCountryISDCodeErrorCode
                                         userInfo:[NSDictionary dictionaryWithObjectsAndKeys:PSInvalidCountryISDCodeErrorDesc,NSLocalizedDescriptionKey,nil]];
            }
        }else{
            
            if (error != NULL)
                *error = nil;
            success = YES;
        }
    }
    return success;
}

- (BOOL)validatePhoneNumber : (NSError **)error
{
    BOOL success = NO;
    NSString *phoneRegex = @"[0-9]{7,12}";
    NSPredicate *countryCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    if(!self || [self length]== 0){
        if (error != NULL)
        {
            *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                         code: PSCountryISDCodeLengthZeroErrorCode
                                     userInfo:@{NSLocalizedDescriptionKey:PSPhoneNumberLengthZeroErrorDesc}];
        }
        
    }
    else{
        
        if(![countryCodeTest evaluateWithObject:self])
        {
            if (error != NULL)
            {
                *error = [NSError errorWithDomain:PSDataValidationErrorDomain
                                             code:PSInvalidCountryISDCodeErrorCode
                                         userInfo:@{NSLocalizedDescriptionKey:PSInvalidPhoneNumberErrorDesc}];
            }
        }else{
            
            if (error != NULL)
                *error = nil;
            success = YES;
        }
    }
    return success;
}

- (BOOL)validateEmpty: (NSError **)error
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

- (BOOL)validateDate: (NSError **)error
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

- (BOOL)validateTime: (NSError **)error
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

- (BOOL)validatePlace: (NSError **)error
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

- (BOOL)validateCity: (NSError **)error
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

- (BOOL)validateState: (NSError **)error
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

- (BOOL)validateCountry: (NSError **)error
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
