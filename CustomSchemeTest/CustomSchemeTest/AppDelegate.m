//
//  AppDelegate.m
//  App-Launcher
//
//  Created by rodo on 19/06/2021.
//  Copyright © 2021 rodo. All rights reserved.
//

#import "AppDelegate.h"
#define AS(A,B)    [(A) stringByAppendingString:(B)]

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

NSString *urlString=@"";

- (void)handleAppleEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
    urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    // do something with the URL string
    NSLog(@"EVENT URL = %@", urlString);
}

- (void)awakeFromNib {
	[[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleAppleEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
    NSLog(@"applicationDidFinish, initial URL = %@", urlString);
	[_window setTitle:AS(@"INITIAL URL:", urlString)];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}


@end
