//
//  MainMenuViewController.m
//  Friend Quiz
//
//  Created by Christian Retureta on 2014-02-10.
//  Copyright (c) 2014 Christian Retureta. All rights reserved.
//

#import "MainMenuViewController.h"
#import "INFO_4290_Final_ProjectAppDelegate.h"
#import "INFO_4290_Final_ProjectViewController.h"
#import "SideMenuViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "SWRevealViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController{
    
    
    INFO_4290_Final_ProjectAppDelegate *appDelegate;
}

@synthesize nameLabel, pictureView, loginView, sideBarButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Load the Facebook Login classes so the picture and login information appears
    [FBLoginView class];
    [FBProfilePictureView class];
    
    loginView.delegate = self;
    
    
    
    appDelegate = (INFO_4290_Final_ProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    SideMenuViewController *sideMenuController = [[SideMenuViewController alloc]init];
    
    
   // sideBarButton.target = self.
   // [appDelegate checkFacebookSession];
	// Do any additional setup after loading the view.
    
    if([FBSession activeSession].state == FBSessionStateCreatedTokenLoaded){
        
        
        NSLog(@"Facebook user logged in!!!!");
        
    }
    
    
}
-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    
    
    
    pictureView.profileID = user.id;
    
    NSString *username = user.name;
    NSString *welcomeText = @"Welcome ";
    
    NSString *combinedText = [welcomeText stringByAppendingString:username];
    
    
    nameLabel.text = combinedText;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    
  
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    
    self.pictureView.profileID = nil;
    nameLabel.text = @"";
    
    //Return to the first scene
    //INFO_4290_Final_ProjectViewController *viewController = [[INFO_4290_Final_ProjectViewController alloc]init];
    
 //   [self presentViewController:viewController animated:YES completion:nil];
    
    
    
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    
    
    
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
