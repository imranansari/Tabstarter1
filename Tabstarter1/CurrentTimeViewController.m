//
//  CurrentTimeViewController.m
//  Tabstarter1
//
//  Created by Imran Ansari on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"
#import "WebViewJavascriptBridge.h"

@implementation CurrentTimeViewController

@synthesize javascriptBridge;
@synthesize webView;

- (id)init
{
    // Call the superclass's designated initializer
    self = [super initWithNibName:nil
                           bundle:nil];
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];

        [tbi setTitle:@"Search"];
    }
    
    return self;
}

- (void)viewDidLoad
{
   
    NSLog(@"Loaded the view for CurrentTime controller");
    [super viewDidLoad];
        
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds]; 
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:4567/form"]]];
    
    javascriptBridge = [WebViewJavascriptBridge javascriptBridge];
    javascriptBridge.delegate = self;
    webView.delegate = javascriptBridge;
    
    [javascriptBridge sendMessage:@"HI" toWebView:webView];
    
    [self.view addSubview:webView];
    [webView release];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
}

- (void)handleMessage:(NSString *)message fromWebView:(UIWebView *)theWebView {
    NSLog(@"ExampleWebViewJavascriptBridgeDelegate received message: %@", message);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JSON passed from WebView" 
                                                    message: message 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


@end
