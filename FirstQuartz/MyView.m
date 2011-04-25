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
    CGContextRef c = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];

    rect.size = CGSizeMake(rect.size.width/2, rect.size.height/2);
	[self drawUnionFlagInRect:rect];
    
    rect.origin = CGPointMake(CGRectGetMidX([self frame]), CGRectGetMidY([self frame]));

    rect.origin.x = [self frame].origin.x;
    [self drawTriColorInRect:rect];

    
	
    rect.origin = CGPointMake(CGRectGetMidX([self frame]), [self frame].origin.y);
	[self drawSuisseInRect:rect];

	rect.origin = CGPointMake(CGRectGetMidX([self frame]), CGRectGetMidY([self frame]));
	CGContextClipToRect(c, rect);
    [self drawStAndrewsInRect:rect];



}

-(void)drawAustrailianFlagInRect:(CGRect) rect
{
    CGContextRef c = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetRGBFillColor(c, 0, 0, 0.8, 1);
    CGContextAddRect(c, rect);
    CGContextDrawPath(c, kCGPathFill);
    [self drawUnionFlagInRect:CGRectMake(rect.origin.x, CGRectGetMidY(rect), CGRectGetMidX(rect), CGRectGetMidY(rect))];
    

}
    - (void)drawUnionFlagInRect:(CGRect) rect
{
    CGContextRef c = (CGContextRef)[[NSGraphicsContext currentContext] graphicsPort];

    [self drawStAndrewsInRect:rect];
    
    CGContextSetRGBStrokeColor(c, .9, 0, 0, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.09);
    CGContextBeginPath(c);
	// red line bottom left to top right
    CGContextMoveToPoint(c, rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint(c, rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
	// top left to bottom right
    CGContextMoveToPoint(c, rect.origin.x, rect.origin.y + rect.size.height);
    CGContextAddLineToPoint(c, rect.origin.x+rect.size.width, rect.origin.y);
    CGContextDrawPath(c, kCGPathStroke);

    CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.2);
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, CGRectGetMidX(rect), rect.origin.y);
    CGContextAddLineToPoint(c, CGRectGetMidX(rect), rect.origin.y+rect.size.height);
    CGContextMoveToPoint(c, rect.origin.x, CGRectGetMidY(rect));
    CGContextAddLineToPoint(c,rect.origin.x + rect.size.width, CGRectGetMidY(rect));
    
    CGContextDrawPath(c, kCGPathStroke);

    CGContextSetRGBStrokeColor(c, .9, 0, 0, 1);
    CGContextSetLineWidth(c, rect.size.height * 0.1);
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, CGRectGetMidX(rect), rect.origin.y);
    CGContextAddLineToPoint(c, CGRectGetMidX(rect), rect.origin.y+rect.size.height);
    CGContextMoveToPoint(c, rect.origin.x, CGRectGetMidY(rect));
    CGContextAddLineToPoint(c, rect.origin.x+rect.size.width, CGRectGetMidY(rect));
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
    float crossSize = rect.size.height * crossScale;
    
    CGContextMoveToPoint(c, CGRectGetMidX(rect),CGRectGetMidY(rect)-(crossSize/2));
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
    
    CGContextMoveToPoint(c, rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint(c, rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);

    CGContextMoveToPoint(c, rect.origin.x, rect.origin.y+rect.size.height);
    CGContextAddLineToPoint(c, rect.origin.x+rect.size.width, rect.origin.y);    
    CGContextDrawPath(c, kCGPathStroke);
}
- (void)dealloc
{
    [super dealloc];
}

@end
