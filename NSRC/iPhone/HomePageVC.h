//
//  HomePageVC.h
//  NSRC
//
//  Created by System Administrator on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomePageVC : UIViewController {
	IBOutlet UIScrollView		*mBackgroundScrollView;
	IBOutlet UIImageView		*mTopBarImageView;
	IBOutlet UIButton			*mBottomButton;
}

- (IBAction) showLinkButtonClicked : (id) sender;

@end
