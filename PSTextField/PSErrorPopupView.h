//
//  PSErrorPopupView.h
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSErrorPopupView : UIView

- (id)initWithFrame: (CGRect)frame
       errorMessage: (NSString *)errorMessage
    triangleCenterX: (CGFloat)pointX;

@end
