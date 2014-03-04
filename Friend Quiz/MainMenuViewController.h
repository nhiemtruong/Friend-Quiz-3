//
//  MainMenuViewController.h
//  Friend Quiz
//
//  Created by Christian Retureta on 2014-02-10.
//  Copyright (c) 2014 Christian Retureta. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "INFO_4290_Final_ProjectAppDelegate.h"

@interface MainMenuViewController : UIViewController <FBLoginViewDelegate>

@property (strong, nonatomic) IBOutlet FBProfilePictureView *pictureView;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet FBLoginView *loginView;
@property (strong, nonatomic) IBOutlet FBLoginView *loginView2;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@end
