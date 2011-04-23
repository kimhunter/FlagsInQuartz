//
//  MyClass.m
//  FirstQuartz
//
//  Created by Kim Hunter on 23/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyView.h"


@implementation MyView

- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}
- (void)drawRect:(NSRect)dirtyRect
{
    CGRect rect = [self frame];
    [self drawUnionFlagInRect:rect];
}

- (void)drawUnionFlagInRect:(CGRect) rect
{
    CGContextRef c = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    [self drawStAndrewsInRect:rect];
    CGContextSetRGBStrokeColor(c, .9, 0, 0, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.09);

    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 0, 0);
    CGContextAddLineToPoint(c, rect.size.width, rect.size.height);
    CGContextMoveToPoint(c, 0, rect.size.height);
    CGContextAddLineToPoint(c, rect.size.width, 0);
    CGContextDrawPath(c, kCGPathStroke);

    CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.2);

    CGContextBeginPath(c);
    CGContextMoveToPoint(c, CGRectGetMidX(rect), 0);
    CGContextAddLineToPoint(c, CGRectGetMidX(rect), rect.size.height);
    CGContextMoveToPoint(c, 0, CGRectGetMidY(rect));
    CGContextAddLineToPoint(c, rect.size.width, CGRectGetMidY(rect));
    CGContextDrawPath(c, kCGPathStroke);

    CGContextSetRGBStrokeColor(c, .9, 0, 0, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.1);
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, CGRectGetMidX(rect), 0);
    CGContextAddLineToPoint(c, CGRectGetMidX(rect), rect.size.height);
    CGContextMoveToPoint(c, 0, CGRectGetMidY(rect));
    CGContextAddLineToPoint(c, rect.size.width, CGRectGetMidY(rect));
    CGContextDrawPath(c, kCGPathStroke);
}

- (void)drawSuisseInRect:(CGRect) rect
{
    CGContextRef c = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetRGBFillColor(c, 1, 0, 0, 1);
    CGContextAddRect(c, rect);
    CGContextDrawPath(c, kCGPathFill);
    
    CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.25);
    CGContextBeginPath(c);

   
    float crossScale = 0.7;
    CGContextMoveToPoint(c, CGRectGetMidX(rect),CGRectGetMidY(rect)-CGRectGetMidY(rect) * crossScale);
    CGContextAddLineToPoint(c, CGRectGetMidX(rect), CGRectGetMidY(rect) * (1+crossScale)); 
    CGContextMoveToPoint(c, CGRectGetMidX(rect)-(CGRectGetMidY(rect) * crossScale), CGRectGetMidY(rect));
    CGContextAddLineToPoint(c, CGRectGetMidX(rect)+(CGRectGetMidY(rect) * crossScale), CGRectGetMidY(rect));

    CGContextDrawPath(c, kCGPathStroke);
}

- (void)drawTriColorInRect:(CGRect) rect
{
    CGContextRef c = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    rect.size.width /= 3;
    CGContextSetRGBFillColor(c, 0, 0, 0.8, 1);
    CGContextAddRect(c, rect);
    CGContextDrawPath(c, kCGPathFill);

    rect.origin.x += rect.size.width;
    CGContextSetRGBFillColor(c, 1, 1, 1, 1);
    CGContextAddRect(c, rect);
    CGContextDrawPath(c, kCGPathFill);

    rect.origin.x += rect.size.width;
    CGContextSetRGBFillColor(c, 1, 0, 0, 1);
    CGContextAddRect(c, rect);
    CGContextDrawPath(c, kCGPathFill);

}

- (void)drawStAndrewsInRect:(CGRect) rect
{
    CGContextRef c = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    //blue background
    CGContextSetRGBFillColor(c, 0, 0, 0.8, 1);
    CGContextAddRect(c, rect);
    CGContextDrawPath(c, kCGPathFill);
    
    //white crosses
    CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.2);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 0, 0);
    CGContextAddLineToPoint(c, rect.size.width, rect.size.height);
    CGContextMoveToPoint(c, 0, rect.size.height);
    CGContextAddLineToPoint(c, rect.size.width, 0);    
    CGContextDrawPath(c, kCGPathStroke);
}
- (void)dealloc
{
    [super dealloc];
}

@end
