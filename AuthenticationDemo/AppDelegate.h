//
//  AppDelegate.h
//  AuthenticationDemo
//
//  Created by Julian Ceipek on 10/12/12.
//  Copyright (c) 2012 SLAC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> //, NSURLConnectionDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextField *username;
@property (assign) IBOutlet NSTextField *password;
@property (assign) IBOutlet NSTextField *responseField;

@property (assign) IBOutlet NSButton *authButton;

- (IBAction)authenticateClicked:(id)sender;

@end

AFHTTPClient *someClient;
