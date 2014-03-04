//
//  INFO_4290_Final_ProjectAppDelegate.h
//  Friend Quiz
//
//  Created by Christian Retureta on 2014-01-29.
//  Copyright (c) 2014 Christian Retureta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface INFO_4290_Final_ProjectAppDelegate : UIResponder <UIApplicationDelegate, FBLoginViewDelegate>

@property (strong, nonatomic) UIWindow *window;



-(BOOL)checkFacebookSession; 

@end
