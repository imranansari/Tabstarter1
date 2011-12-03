//
//  CurrentTimeViewController.h
//  Tabstarter1
//
//  Created by Imran Ansari on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebViewJavascriptBridge.h"


@interface CurrentTimeViewController : UIViewController <WebViewJavascriptBridgeDelegate>

@property (strong, nonatomic) WebViewJavascriptBridge *javascriptBridge;
@property (strong, nonatomic) UIWebView *webView;

@end
