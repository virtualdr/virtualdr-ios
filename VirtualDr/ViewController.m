//
//  ViewController.m
//  VirtualDr
//
//  Created by TL-01 on 23/06/2016.
//  Copyright © 2016 Trangolabs. All rights reserved.
//

#import "ViewController.h"
#import "NJKWebViewProgressView.h"
#import "AppConstants.h"

@interface ViewController ()
{

//    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
}
@property (weak, nonatomic) IBOutlet NJKWebViewProgressView *progressView;

@end

@implementation ViewController{

    UIImageView *splashImageView;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *splashImage = nil;
    
    if (IS_IPHONE_4) {
        splashImage = [UIImage imageNamed:@"640x960.png"];
    }else if (IS_IPHONE_5) {
        splashImage = [UIImage imageNamed:@"640x1136.png"];
        
    }else if (IS_IPHONE_6) {
        splashImage = [UIImage imageNamed:@"750x1334.png"];
        
    }else if (IS_IPHONE_6_PLUS) {
        splashImage = [UIImage imageNamed:@"1242x2208.png"];
        
    }else if (IS_IPAD || IS_IPADPro) {
        splashImage = [UIImage imageNamed:@"1536x2048.png"];
    }
    
    splashImageView = [[UIImageView alloc] initWithImage:splashImage];
    splashImageView.frame=[[UIScreen mainScreen] bounds];
    [splashImageView setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:splashImageView];
    [self.view bringSubviewToFront:splashImageView];
   
    
    [self preferredStatusBarStyle];
    NSURL *url = [[NSURL alloc]initWithString:@"https://www.i-gp.uk/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
    
    _progressProxy = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    
    
    
//    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    [_progressView setFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.view addSubview:_progressView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_progressView removeFromSuperview];
}


#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    
    NSLog(@"progress :%f",progress);
    
    if (progress>0.9) {
        
    [UIView animateWithDuration:0.5f
                          delay:2.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
//                         splashImageView.alpha = .0f;
//                         CGFloat x = -60.0f;
//                         CGFloat y = -120.0f;
//                         splashImageView.frame = CGRectMake(x,
//                                                            y,
//                                                            splashImageView.frame.size.width-2*x,
//                                                            splashImageView.frame.size.height-2*y);
                     } completion:^(BOOL finished){
                         if (finished) {
                             [splashImageView removeFromSuperview];
                         }
                     }];

    }

    
//    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}


@end
