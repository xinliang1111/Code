//
//  HomePageVC.m
//  NSRC
//
//  Created by System Administrator on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate_iPhone.h"

#import "HomePageVC.h"


@implementation HomePageVC

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
	
	mTopBarImageView.frame = CGRectMake(0, 0, mTopBarImageView.frame.size.width, mTopBarImageView.frame.size.height);
	[mBackgroundScrollView addSubview:mTopBarImageView];
	[mTopBarImageView release];
	
	UILabel *titleLabel;
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, mTopBarImageView.frame.size.height, 728, 518)];
		titleLabel.font = [UIFont systemFontOfSize:23.0];
		titleLabel.numberOfLines = 20;
	} else {
		titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, mTopBarImageView.frame.size.height, 305, 400)];
		titleLabel.font = [UIFont systemFontOfSize:15.0];
		titleLabel.numberOfLines = 20;
	}

	

	titleLabel.textAlignment = UITextAlignmentLeft;
	titleLabel.lineBreakMode = UILineBreakModeWordWrap;
	
	titleLabel.text = NSLocalizedString(@"STR_HOME_TITLE", @"");		  
	
	[mBackgroundScrollView addSubview:titleLabel];
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		
		mBottomButton.frame = CGRectMake(0, mTopBarImageView.frame.size.height + titleLabel.frame.size.height, 768, mBottomButton.frame.size.height);
		[mBackgroundScrollView addSubview:mBottomButton];
		
		mBackgroundScrollView.contentSize = CGSizeMake(768, mTopBarImageView.frame.size.height + titleLabel.frame.size.height + mBottomButton.frame.size.height);

	} else {
		
		mBottomButton.frame = CGRectMake(0, mTopBarImageView.frame.size.height + titleLabel.frame.size.height, 320, mBottomButton.frame.size.height);
		[mBackgroundScrollView addSubview:mBottomButton];
		
		mBackgroundScrollView.contentSize = CGSizeMake(320, mTopBarImageView.frame.size.height + titleLabel.frame.size.height + mBottomButton.frame.size.height);
	}
	
	[titleLabel release];
    [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction) showLinkButtonClicked : (id) sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL_GENESISBOOKS]];
}

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
    [super dealloc];
}


@end
