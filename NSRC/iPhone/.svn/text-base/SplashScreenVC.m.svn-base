//
//  SplashScreenVC.m
//  NSRC
//
//  Created by System Administrator on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "AppDelegate_iPhone.h"

#import "SplashScreenVC.h"


@implementation SplashScreenVC

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	mBackgroundImageView.center = CGPointMake(mBackgroundImageView.center.x, mBackgroundImageView.center.y + 20);
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
	
}

- (void)viewDidAppear:(BOOL)animated {

}

- (void)animationDidStop:(NSString *)animationId finished:(NSNumber *)finished context:(void *)context {
	[mAudioPlayer stop];
	[self.view removeFromSuperview];
	AppDelegate_iPhone *appDelegate = (AppDelegate_iPhone *) [[UIApplication sharedApplication] delegate];
	[appDelegate.window addSubview:appDelegate.mTabBarController.view];	
}

- (void) animationStart {

	NSString *path = [[NSBundle mainBundle] pathForResource:@"flush_audio" ofType:@"wav"];
	NSURL *urlPath = [NSURL fileURLWithPath:path];
	mAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPath error:NULL];
	
	[mAudioPlayer play];

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:5.0];
	[UIView setAnimationDelegate:self];

	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		mBackgroundImageView.center = CGPointMake(mBackgroundImageView.center.x - 100, mBackgroundImageView.center.y);
	} else {
		mBackgroundImageView.center = CGPointMake(mBackgroundImageView.center.x - 50, mBackgroundImageView.center.y);		
	}

	mBackgroundImageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
	mBackgroundImageView.alpha = 1.0;	
	mForegroundImageView.alpha = 1.0;
	
	[UIView commitAnimations];	
}


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


- (void)dealloc {
	[mAudioPlayer release];
    [super dealloc];
}


@end
