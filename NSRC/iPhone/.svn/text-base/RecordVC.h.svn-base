//
//  RecordVC.h
//  NSRC
//
//  Created by System Administrator on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@protocol RecordVCDelegate

- (void) updateRecordSoundView;

@end


@interface RecordVC : UIViewController <AVAudioRecorderDelegate> {
	IBOutlet UIButton		*mRecordButton;
	IBOutlet UIButton		*mPlayButton;
	IBOutlet UIButton		*mUseButton;
	IBOutlet UIButton		*mRecordBackground;
	IBOutlet UILabel		*mTimeLabel;
	IBOutlet UIButton		*mUseVoiceButton;
	IBOutlet UIButton		*mDiscardButton;
	
	BOOL					mIsRecord;
	BOOL					mIsPlay;
	
	NSURL					*mRecordedTmpFile;
	AVAudioRecorder			*mRecorder;
	NSError					*error;
	
	AVAudioPlayer			*mAvPlayer;
	
	NSTimer					*mRecordTimer;
	NSInteger				mRecordTime;
	
	id<RecordVCDelegate>	delegate;
}

@property (nonatomic, retain) id<RecordVCDelegate>		delegate;

- (IBAction) recordButtonClicked : (id) sender ;
- (IBAction) playButtonClicked : (id) sender ;
- (IBAction) useButtonClicked : (id) sender;

- (IBAction) useVoiceButtonClicked : (id) sender;
- (IBAction) discardButtonClicked : (id) sender;

@end
