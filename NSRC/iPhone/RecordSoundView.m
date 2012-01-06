//
//  RecordSoundView.m
//  NSRC
//
//  Created by System Administrator on 8/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RecordSoundView.h"


@implementation RecordSoundView
@synthesize	delegate;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void) showInitView {
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		mSendView.center = CGPointMake(-384, mSendView.center.y);
	} else {
		mSendView.center = CGPointMake(-160, mSendView.center.y);
	}
}

- (void) showSendView {
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		mSendView.center = CGPointMake(384, mSendView.center.y);		
	} else {
		mSendView.center = CGPointMake(160, mSendView.center.y);
	}


}

- (IBAction) recordPrayerRequest : (id) sender {
	[delegate recordPrayerVoice];
}

- (IBAction) sendPrayer : (id) sender {
	[delegate sendPrayerVoice];
}

- (IBAction) cancelPrayer : (id) sender {

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		mSendView.center = CGPointMake(-384, mSendView.center.y);
	} else {
		mSendView.center = CGPointMake(-160, mSendView.center.y);
	}
	
	mSendView.transform = CGAffineTransformMakeScale(1.0, 1.0);
	
	[UIView commitAnimations];	
}

- (void) updateRecordSoundView {
	[self showSendView];
}


- (void)dealloc {
    [super dealloc];
}


@end
