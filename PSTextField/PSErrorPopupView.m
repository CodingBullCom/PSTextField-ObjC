//
//  PSErrorPopupView.m
//  PSTextField
//
//  Created by Pawan Kumar Singh on 8/14/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

#import "PSErrorPopupView.h"

#define TRIANGLE_BASE_WIDTH 16.0
#define TRIANGLE_HEIGHT 10.0
#define RECTANGLE_HEIGHT 3.0

@interface PSErrorPopupView()

@property(nonatomic, weak) NSString *errorMsg;
@property(nonatomic, assign) CGFloat popUpPointX;

@end

@implementation PSErrorPopupView

- (id)initWithFrame: (CGRect)frame
       errorMessage: (NSString *)errorMessage
    triangleCenterX: (CGFloat)pointX
{
    frame.size.height += 13.0;
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.errorMsg = errorMessage;
        self.popUpPointX = pointX;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    
    //top triangle
    CGContextMoveToPoint(context, _popUpPointX, 0.0);
    CGContextAddLineToPoint(context, _popUpPointX-TRIANGLE_BASE_WIDTH/2, TRIANGLE_HEIGHT);
    CGContextAddLineToPoint(context, _popUpPointX+TRIANGLE_BASE_WIDTH/2, TRIANGLE_HEIGHT);
    CGContextAddLineToPoint(context, _popUpPointX, 0.0);
    
    CGContextAddRect(context, CGRectMake(0.0, TRIANGLE_HEIGHT, self.frame.size.width, RECTANGLE_HEIGHT));
    
    CGContextClosePath(context);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);          //Red color
    CGContextDrawPath(context, kCGPathFill);

    CGRect frame = CGRectMake(0.0, TRIANGLE_HEIGHT+RECTANGLE_HEIGHT, self.frame.size.width, self.frame.size.height);
    
    UILabel *errorLabel = [[UILabel alloc] initWithFrame:frame];
    errorLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.85];
    errorLabel.textAlignment = NSTextAlignmentCenter;
    errorLabel.textColor = [UIColor whiteColor];
    errorLabel.font = [UIFont systemFontOfSize:13.0];
    errorLabel.text = _errorMsg;
    [self addSubview:errorLabel];
    
}


@end
