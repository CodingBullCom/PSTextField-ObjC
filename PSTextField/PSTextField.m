//
//  PSTextField.m
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import "PSTextField.h"
#import "PSErrorAlertView.h"
#import "NSString+Validation.h"

@interface PSTextField()
{
    CGFloat popUpTriangleHorizontalRightMargin;
}
@property(nonatomic,strong) NSError *error;

@end

@implementation PSTextField

- (void)validateInput
{
    NSError __autoreleasing *error = nil;
    BOOL isDataFoundValid = YES;                //By default, we assume user has keyed correct input.
    
    switch (_dataValidationType) {
            
        case PSDataValidationTypePassword:
            isDataFoundValid = [self.text validatePassword:&error];
            break;
        case PSDataValidationTypeUserName:
            isDataFoundValid = [self.text validateUserName:&error];
            break;
        case PSDataValidationTypeFirstName:
            isDataFoundValid = [self.text validateFirstName:&error];
            break;
        case PSDataValidationTypeLastName:
            isDataFoundValid = [self.text validateLastName:&error];
            break;
        case PSDataValidationTypeEmail:
            isDataFoundValid = [self.text validateEmail:&error];
            break;
        case PSDataValidationTypeMobileNumber:
            isDataFoundValid = [self.text validatePhoneNumber:&error];
            break;
        case PSDataValidationTypeDate:
            isDataFoundValid = [self.text validateDate:&error];
            break;
        case PSDataValidationTypeTime:
            isDataFoundValid = [self.text validateTime:&error];
            break;
        case PSDataValidationTypePlace:
            isDataFoundValid = [self.text validatePlace:&error];
            break;
        case PSDataValidationTypeCity:
            isDataFoundValid = [self.text validateCity:&error];
            break;
        case PSDataValidationTypeState:
            isDataFoundValid = [self.text validateState:&error];
            break;
        case PSDataValidationTypeCountry:
            isDataFoundValid = [self.text validateCountry:&error];
            break;
        case PSDataValidationTypeDefault:
            isDataFoundValid = [self.text validateEmpty:&error];
            break;
    }
    
    if(isDataFoundValid == NO)
    {
        self.error = error;
        [self addErrorInfoDisclosure];
    }else{
        [self removeErrorInfoDisclosure];
    }
}

- (void)addErrorInfoDisclosure
{
    UIButton *infoDisclosure = [UIButton buttonWithType:UIButtonTypeInfoDark];
    infoDisclosure.tintColor = [UIColor redColor];
    infoDisclosure.transform = CGAffineTransformMakeRotation(M_PI);
    [infoDisclosure addTarget:self
                       action:@selector(displayErrorAlert)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self setRightView:infoDisclosure];
    [self setRightViewMode:UITextFieldViewModeAlways];
    popUpTriangleHorizontalRightMargin = infoDisclosure.center.x;
}

- (void)removeErrorInfoDisclosure
{
    [self setRightView:nil];
}

- (void)displayErrorAlert
{
    NSString *errorMessage = self.error.userInfo[NSLocalizedDescriptionKey];
    PSErrorAlertView *errorAlertView = [[PSErrorAlertView alloc] initWithErrorMessage:errorMessage];
    CGPoint popupViewTriangleTopTipPoint = CGPointMake(self.frame.size.width-popUpTriangleHorizontalRightMargin,
                                                       self.frame.size.height);
    errorAlertView.popUpTriangleTipPoint = [self convertPoint:popupViewTriangleTopTipPoint toView:nil];
    errorAlertView.popUpTriangleHorizontalRightMargin = popUpTriangleHorizontalRightMargin;
    [errorAlertView displayAlert];
}

- (void)awakeFromNib
{
    //setting default validation to validate for empty text.
    self.dataValidationType = PSDataValidationTypeDefault;
}
@end
