//
//  FirstQuartzAppDelegate.h
//  FirstQuartz
//
//  Created by Kim Hunter on 23/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FirstQuartzAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
