//
//  ContactVC.m
//  NSRC
//
//  Created by System Administrator on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate_iPhone.h"

#import "ContactVC.h"


@implementation ContactVC

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

- (IBAction) showSocialNetWorkButtonClicked : (id) sender {
	UIButton *selectedButton = (UIButton *) sender;
	
	switch (selectedButton.tag) {
		case 0:
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/Radio1000?ref=ts"]];
			break;
			
		case 1:
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/nsrcministries"]];
			break;
		
		case 2:
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/newspiritrevivalctr"]];
			break;
			
		case 3:
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://market.android.com/details?id=com.gurucorp.radio"]];
			break;

		case 4:
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.thewordnetwork.org/"]];
			break;

		default:
			break;
	}
	
}

- (IBAction) showDonationPageButtonClicked : (id) sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/us/cgi-bin/webscr?cmd=_flow&SESSION=T-mbwdR59-05OS8AVy-saycosiPt43AHkjkf47NWw6Xis0Q-xW9KuiXylYq&dispatch=5885d80a13c0db1f8e263663d3faee8deaa77efc63a6eb429928d42bdf5d9d2c"]];
}

- (IBAction) callButtonClicked : (id) sender {
	
	UIButton *selectedButton = (UIButton *) sender;
	
	if ( selectedButton.tag == 10 ) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:18779877249"]];
	}
	
	if ( selectedButton.tag == 11 ) {
		mContactView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
		[self.view addSubview:mContactView];
		
	}
	
}

- (IBAction) visitWebsiteButtonClicked : (id) sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.gurudesigncorp.com"]];
	[mContactView removeFromSuperview];
}

- (IBAction) emailToCompanyButtonClicked : (id) sender {
	[self addMailComposerView];
}

- (IBAction) callCompanyButtonClicked : (id) sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://2162566420"]];
	[mContactView removeFromSuperview];
}

- (IBAction) backButtonClicked : (id) sender {
	[mContactView removeFromSuperview];
}

- (void)addMailComposerView {
	
	if ( [self checkMailCompose] == NO )
		return;
	
	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
		
	[picker setSubject:@"Email from NSRC app"];
	
	NSArray *toRecipients = [NSArray arrayWithObject:@"support@gurudesigncorp.com"]; 
	[picker setToRecipients:toRecipients];
	
	[picker setMessageBody:@"" isHTML:YES];
	
	
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
