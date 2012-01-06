//
//  RecordVC.m
//  NSRC
//
//  Created by System Administrator on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "AppDelegate_iPhone.h"

#import "RecordVC.h"


@implementation RecordVC
@synthesize delegate;

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
	mIsRecord = YES;
	mIsPlay = YES;
	
	//Instanciate an instance of the AVAudioSession object.
	AVAudioSession * audioSession = [AVAudioSession sharedInstance];
	
	//Setup the audioSession for playback and record. 
	//We could just use record and then switch it to playback leter, but
	//since we are going to do both lets set it up once.
	[audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: &error];
	//Activate the session
	[audioSession setActive:YES error: &error];
	
	mRecordedTmpFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent: [NSString stringWithFormat: @"%.0f.%@", [NSDate timeIntervalSinceReferenceDate] * 1000.0, @"caf"]]];
	NSLog(@"Using File called: %@",mRecordedTmpFile);
	
	NSMutableDictionary* recordSetting = [[NSMutableDictionary alloc] init];
	[recordSetting setValue :[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
	[recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey]; 
	[recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
	
	mRecorder = [[AVAudioRecorder alloc] initWithURL:mRecordedTmpFile settings:recordSetting error:&error];
	
	mPlayButton.enabled = NO;
	mUseButton.enabled = NO;

    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction) recordButtonClicked : (id) sender {

	if(mIsRecord)
	{
		
		mRecordTime = 0;

		mPlayButton.enabled = YES;
		mUseButton.enabled = YES;
		mRecordBackground.hidden = NO;
		mTimeLabel.hidden = NO;
		mIsRecord = NO;
		
		
		if ( mUseVoiceButton.alpha == 1.0 ) {
			[UIView beginAnimations:nil context:nil];
			[UIView setAnimationDuration:0.5];
			[UIView setAnimationDelegate:self];
			
			mUseVoiceButton.alpha = 0.0;
			mDiscardButton.alpha = 0.0;		
			
			mUseVoiceButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
			mDiscardButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
			
			[UIView commitAnimations];
			
		}
				
		mRecordTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateRecordTime) userInfo:nil repeats:YES];
		[mRecordTimer fire];
		
		[mRecordButton setImage:[UIImage imageNamed:@"img_btn_recordstop.png"] forState:UIControlStateNormal];
		[mPlayButton setEnabled:NO];
			
		[mRecorder setDelegate:self];
		[mRecorder prepareToRecord];
		[mRecorder record];
		
	}
	else
	{
		[mRecordTimer invalidate];
		mRecordTimer = nil;
		[mPlayButton setEnabled:YES];
		
		mRecordBackground.hidden = YES;
		mTimeLabel.hidden = YES;
				
		mIsRecord = YES;
		[mRecordButton setImage:[UIImage imageNamed:@"img_btn_record.png"] forState:UIControlStateNormal];

		NSLog(@"Using File called: %@",mRecordedTmpFile);
		//Stop the recorder.
		[mRecorder stop];
	}
	
}

- (void) updateRecordTime {
	
	NSInteger minutes = mRecordTime / 60;
	NSInteger second = mRecordTime % 60;
	
	NSString *timeString = [NSString stringWithFormat:@"Recording %.2d:%.2d", minutes, second];
	
	mTimeLabel.text = timeString;
	
	mRecordTime ++;
}

- (IBAction) playButtonClicked : (id) sender {
	
	//The play button was pressed... 
	//Setup the AVAudioPlayer to play the file that we just recorded.
	[mAvPlayer release];
	mAvPlayer = nil;
	
	mAvPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mRecordedTmpFile error:&error];

	[mAvPlayer prepareToPlay];
	[mAvPlayer play];
}

- (IBAction) useButtonClicked : (id) sender {
	if ( mAvPlayer != nil )
		[mAvPlayer stop];
	
	if ( [mRecorder isRecording] ) {
		[mRecordTimer invalidate];
		mRecordTimer = nil;
		[mPlayButton setEnabled:YES];
		
		mRecordBackground.hidden = YES;
		mTimeLabel.hidden = YES;
		
		mIsRecord = YES;
		[mRecordButton setImage:[UIImage imageNamed:@"img_btn_record.png"] forState:UIControlStateNormal];
		
		NSLog(@"Using File called: %@",mRecordedTmpFile);
		//Stop the recorder.
		[mRecorder stop];
	}
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	
	mUseVoiceButton.alpha = 1.0;
	mDiscardButton.alpha = 1.0;		

	mUseVoiceButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
	mDiscardButton.transform = CGAffineTransformMakeScale(1.0, 1.0);
	
	[UIView commitAnimations];
	
	
}

- (IBAction) useVoiceButtonClicked : (id) sender {
	
	AppDelegate_iPhone *appDelegate = (AppDelegate_iPhone *) [[UIApplication sharedApplication] delegate];
	appDelegate.mPrayerUrl = mRecordedTmpFile;
	[delegate updateRecordSoundView];
	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction) discardButtonClicked : (id) sender {
	[self dismissModalViewControllerAnimated:YES];
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
