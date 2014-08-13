//
//  PSErrorAlertView.m
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import "PSErrorAlertView.h"
#import "PSErrorPopupView.h"

@interface PSErrorAlertView ()

@property(nonatomic, weak) NSString *errorMsg;
@property(nonatomic, weak) PSErrorPopupView *popupView;

@end

@implementation PSErrorAlertView

- (void)displayAlert
{
    [self addPopupView];
    id appDelegate = [[UIApplication sharedApplication] delegate];
    [[appDelegate window] addSubview:self];
}

- (id)initWithErrorMessage: (NSString *)errorMsg
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        //for testing purpose
        self.errorMsg = errorMsg;
        UITapGestureRecognizer *tapGestureRecogniser =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(dismissErrorAlertView:)];
        [self addGestureRecognizer:tapGestureRecogniser];
    }
    return self;
}

- (void)addPopupView
{
    CGSize textSize = [_errorMsg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0]}];
    textSize = CGSizeMake(ceil(textSize.width)+10.0, ceil(textSize.height));    //Added 5 pixel margin from both ends.
    textSize.width = (textSize.width < 140.0) ? 140.0 : textSize.width;
    textSize.height = (textSize.height < 30.0) ? 30.0 : textSize.height;

    CGRect frame = CGRectZero;
    
    frame.origin.x = _popUpTriangleTipPoint.x + _popUpTriangleHorizontalRightMargin - textSize.width;
    frame.origin.y = _popUpTriangleTipPoint.y;
    frame.size = textSize;
    
    CGFloat triangleMidX = frame.size.width - _popUpTriangleHorizontalRightMargin;
    [self addSubview:[[PSErrorPopupView alloc] initWithFrame:frame
                                      errorMessage:_errorMsg
                                   triangleCenterX:triangleMidX]];
}

- (void)dismissErrorAlertView: (UITapGestureRecognizer *)gestureRecog
{
    [self removeFromSuperview];
}

@end
