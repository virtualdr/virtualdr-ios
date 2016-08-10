//
//  ViewController.h
//  VirtualDr
//
//  Created by TL-01 on 23/06/2016.
//  Copyright © 2016 Trangolabs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NJKWebViewProgress.h"
@interface ViewController : UIViewController<UIWebViewDelegate, NJKWebViewProgressDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

