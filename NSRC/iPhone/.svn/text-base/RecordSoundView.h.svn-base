//
//  RecordSoundView.h
//  NSRC
//
//  Created by System Administrator on 8/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RecordVC.h"

@protocol RecordSoundViewDelegate

- (void) recordPrayerVoice;
- (void) sendPrayerVoice;

@end


@interface RecordSoundView : UIView <RecordVCDelegate> {
	IBOutlet UIView					*mSendView;
	id<RecordSoundViewDelegate>		delegate;
}

@property (nonatomic, retain) id<RecordSoundViewDelegate>	delegate;

- (void) showInitView;

- (IBAction) recordPrayerRequest : (id) sender;
- (IBAction) sendPrayer : (id) sender;
- (IBAction) cancelPrayer : (id) sender;

@end
