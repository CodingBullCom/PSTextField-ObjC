//
//  PSErrorAlertView.h
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSErrorAlertView : UIView

@property(nonatomic, assign) CGPoint popUpTriangleTipPoint;
@property(nonatomic, assign) CGFloat popUpTriangleHorizontalRightMargin;

- (void)displayAlert;
- (id)initWithErrorMessage: (NSString *)errorMsg;

@end
