//
//  MediaVC.m
//  NSRC
//
//  Created by System Administrator on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "AppDelegate_iPhone.h"

#import "MediaVC.h"


@implementation MediaVC

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)loadWebData {

	if ( [mWebView isLoading] == NO ) {
		[mAcitivityIndicator startAnimating];
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL_MEDIA] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
		[mWebView loadRequest:request];		
	}

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[mAcitivityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[mAcitivityIndicator stopAnimating];
}


- (void)dealloc {
    [super dealloc];
}


@end
