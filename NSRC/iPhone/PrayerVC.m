//
//  PrayerVC.m
//  NSRC
//
//  Created by System Administrator on 8/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate_iPhone.h"

#import "PrayerVC.h"
#import "CommonData.h"

#import "RecordSoundView.h"
#import "RecordVC.h"

@implementation PrayerVC

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
	[self showInitView];
    [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) showInitView {
	
	float originY = 0.0;
	
	[mPrayerScrollView addSubview:mTitleView];
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		mTitleView.frame = CGRectMake(0, 0, mTitleView.frame.size.width, 100);	
		originY += 100 + PRAYER_VIEW_SPACING;

	} else {
		mTitleView.frame = CGRectMake(0, 0, mTitleView.frame.size.width, 60);
		originY += 60 + PRAYER_VIEW_SPACING;
	}
	
		
	[mPrayerScrollView addSubview:mRecordSoundView];
	mRecordSoundView.delegate = self;
	[mRecordSoundView showInitView];
	
 	mRecordSoundView.frame = CGRectMake(0, originY, mRecordSoundView.frame.size.width, 60);
	originY += 60 + PRAYER_VIEW_SPACING;
	
	[mPrayerScrollView addSubview:mFirstPictureView];
	mFirstPictureView.frame = CGRectMake(0, originY, mFirstPictureView.frame.size.width, mFirstPictureView.frame.size.height);
	
	originY += mFirstPictureView.frame.size.height + PRAYER_VIEW_SPACING;
	
	[mPrayerScrollView addSubview:mFirstAddressView];
	mFirstAddressView.frame = CGRectMake(0, originY, mFirstAddressView.frame.size.width, mFirstAddressView.frame.size.height);
	
	originY += mFirstAddressView.frame.size.height + PRAYER_VIEW_SPACING;
	
	[mPrayerScrollView addSubview:mSecondPictureView];
	mSecondPictureView.frame = CGRectMake(0, originY, mSecondPictureView.frame.size.width, mSecondPictureView.frame.size.height);
	
	originY += mSecondPictureView.frame.size.height + PRAYER_VIEW_SPACING;
	
	[mPrayerScrollView addSubview:mSecondAddressView];
	mSecondAddressView.frame = CGRectMake(0, originY, mSecondAddressView.frame.size.width, mSecondAddressView.frame.size.height);
	
	originY += mSecondAddressView.frame.size.height + PRAYER_VIEW_SPACING;
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		mPrayerScrollView.contentSize = CGSizeMake(768, originY);
	} else {
		mPrayerScrollView.contentSize = CGSizeMake(320, originY);
	}
}

- (IBAction) addressButtonClicked : (id) sender {
	UIButton *selectedButton = (UIButton *) sender;
	
	if ( selectedButton.tag == 1 ) {

		// Where is Apple on the map anyway?
		NSString* addressText = @"3130 Mayfield Road Cleveland, Hts OH 44118";
		// URL encode the spaces
		addressText =  [addressText stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];	
		NSString* urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", addressText];
		// lets throw this text on the log so we can view the url in the event we have an issue
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlText]];
	}
	
	if ( selectedButton.tag == 2 ) {
		
		// Where is Apple on the map anyway?
		NSString* addressText = @"Akron 1061 Clearview Avenue Akron, OH 44314";
		// URL encode the spaces
		addressText =  [addressText stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];	
		NSString* urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", addressText];
		// lets throw this text on the log so we can view the url in the event we have an issue
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlText]];
	}
}

- (IBAction) callButtonClicked : (id) sender {
	UIButton *selectedButton = (UIButton *) sender;
	
	if ( selectedButton.tag == 1 ) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://2163970987"]];
	}
	
	if ( selectedButton.tag == 2 ) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://2163970987"]];
	}
}

#pragma mark RecordSoundViewDelegate

- (void) recordPrayerVoice {
	
	if ( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
		RecordVC *recordVC = [[[RecordVC alloc] initWithNibName:@"RecordPage-iPad" bundle:nil] autorelease];
		recordVC.delegate = mRecordSoundView;
		[self presentModalViewController:recordVC animated:YES];
	} else {
		RecordVC *recordVC = [[[RecordVC alloc] initWithNibName:@"RecordVC" bundle:nil] autorelease];
		recordVC.delegate = mRecordSoundView;
		[self presentModalViewController:recordVC animated:YES];
	}
}

- (void) sendPrayerVoice {
	[self addMailComposerView];
}

- (void)addMailComposerView {
	
	AppDelegate_iPhone *appDelegate = (AppDelegate_iPhone *) [[UIApplication sharedApplication] delegate];
	
	if ( [self checkMailCompose] == NO )
		return;
	
	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	NSData *audioData = [NSData dataWithContentsOfURL:appDelegate.mPrayerUrl];
	
	[picker setSubject:@"Prayer Request"];
	
	NSArray *toRecipients = [NSArray arrayWithObject:@"nsrcprayerrequests@gmail.com"]; 
	[picker setToRecipients:toRecipients];
	
	[picker setMessageBody:@"Prayer request audio file attached." isHTML:YES];
	[picker addAttachmentData:audioData mimeType:@"message/rfc822" fileName:@"prayer.caf"];

	
	[self presentModalViewController:picker animated:YES];
	
    [picker release];
	
}

- (BOOL) checkMailCompose {
	NSString *feedbackMsg;
    // The MFMailComposeViewController class is only available in iPhone OS 3.0 or later. 
    // So, we must verify the existence of the above class and provide a workaround for devices running 
    // earlier versions of the iPhone OS. 
    // We display an email composition interface if MFMailComposeViewController exists and the device 
    // can send emails. Display feedback message, otherwise.
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
    if (mailClass != nil) {
		//[self displayMailComposerSheet];
        // We must always check whether the current device is configured for sending emails
        if ([mailClass canSendMail]) {
			return YES;
        }
        else {
            feedbackMsg = @"Device not configured to send mail.";
        }
    }
    else    {
        feedbackMsg = @"Device not configured to send mail.";
    }
	
	AppDelegate_iPhone *appDelegate = (AppDelegate_iPhone *) [[UIApplication sharedApplication] delegate];
	[appDelegate showAlertMessage:@"Error" :feedbackMsg :@"Ok"]; 
	
	return NO;
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {	
	NSLog(@"mail composer error: %@", [error description]);
	
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
