//
//  AppDelegate.m
//  AuthenticationDemo
//
//  Created by Julian Ceipek on 10/12/12.
//  Copyright (c) 2012 SLAC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize username;
@synthesize password;
@synthesize authButton;
@synthesize responseField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSURL *url = [NSURL URLWithString:@"https://ohack-fwolin.herokuapp.com"];
    someClient = [[AFHTTPClient alloc] initWithBaseURL:url];
}

- (IBAction)authenticateClicked:(id)sender {    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            [username stringValue], @"username",
                            [password stringValue], @"password",
                            nil];
    
    NSURLRequest *request = [someClient requestWithMethod:@"POST" path:@"/api/exchangelogin" parameters:params];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *response = [NSString stringWithString:operation.responseString];
        [responseField setStringValue:response];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [responseField setStringValue:@"Error!"];
        NSLog(@"Error! %@", operation.error);
    }];
    
    [[[NSOperationQueue alloc] init] addOperation:operation];
    
}

@end