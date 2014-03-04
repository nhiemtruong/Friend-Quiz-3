//
//  INFO_4290_Final_ProjectViewController.h
//  Friend Quiz
//
//  Created by Christian Retureta on 2014-01-29.
//  Copyright (c) 2014 Christian Retureta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>


@interface INFO_4290_Final_ProjectViewController : UIViewController <FBLoginViewDelegate>
@property (strong, nonatomic) IBOutlet FBLoginView *loginView;
//@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePic;

@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end
