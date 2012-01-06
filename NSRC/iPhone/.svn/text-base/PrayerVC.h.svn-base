//
//  PrayerVC.h
//  NSRC
//
//  Created by System Administrator on 8/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecordSoundView.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface PrayerVC : UIViewController <RecordSoundViewDelegate, MFMailComposeViewControllerDelegate> {
	
	IBOutlet UIScrollView		*mPrayerScrollView;
	IBOutlet RecordSoundView	*mRecordSoundView;
	IBOutlet UIView				*mFirstPictureView;
	IBOutlet UIView				*mFirstAddressView;
	IBOutlet UIView				*mSecondPictureView;
	IBOutlet UIView				*mSecondAddressView;
	IBOutlet UIView				*mTitleView;
}

- (void) showInitView;
- (IBAction) addressButtonClicked : (id) sender;
- (IBAction) callButtonClicked : (id) sender;

- (void)addMailComposerView;
- (BOOL) checkMailCompose;

@end
