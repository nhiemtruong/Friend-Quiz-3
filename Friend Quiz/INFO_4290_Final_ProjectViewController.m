//
//  INFO_4290_Final_ProjectViewController.m
//  Friend Quiz
//
//  Created by Christian Retureta on 2014-01-29.
//  Copyright (c) 2014 Christian Retureta. All rights reserved.
//

#import "INFO_4290_Final_ProjectViewController.h"
#import "INFO_4290_Final_ProjectAppDelegate.h"
#import "MainMenuViewController.h"
#import "MainViewController.h"

@interface INFO_4290_Final_ProjectViewController ()

@end

@implementation INFO_4290_Final_ProjectViewController {
    
    INFO_4290_Final_ProjectAppDelegate *appDelegate;
    
    
}
@synthesize loginView, profilePic;


- (void) viewWillAppear:(BOOL)animated{
    

    
    
    

    
}



-(void)viewDidAppear:(BOOL)animated{
    //inherit the shared app delegate object.
    appDelegate= (INFO_4290_Final_ProjectAppDelegate *)[[UIApplication sharedApplication]delegate];
    //Refer to the check Facebook Session method in the App Delegate.m file
    [appDelegate checkFacebookSession];
    
    //initialize an object from the main view controller
    MainMenuViewController *mVC = [[MainMenuViewController alloc]init];
    //If User is logged in (Method is in the AppDelegate.m class
    if([appDelegate checkFacebookSession] == TRUE){
        
        
        NSLog(@"Logged in to Facebook !!");
        
        //Go to the next scene if the user is logged in, referencing the button's segue identifier
       // [self performSegueWithIdentifier:@"startGameSegue" sender:self];
        
        [self performSegueWithIdentifier:@"gameSegue" sender:self];
        
        
        
        
    }
    else{
        
        //   [self performSegueWithIdentifier:@"startGameSegue" sender:self];
        
        NSLog(@"Not logged in to Facebook at all!");
        
    }
    


    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    loginView.readPermissions = @[@"basic_info",@"email",@"user_likes"];
    
    loginView.delegate = self;

    
  
    
  //  FBLoginView *loginView = [[FBLoginView alloc] init];
    // Align the button in the center horizontally
    //loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
    //[self.view addSubview:loginView];
    
    //changes from Christian
    
  
    
}



/*
-(BOOL)checkFacebookSession
{
    if([FBSession activeSession].state == FBSessionStateCreatedTokenLoaded)
        
    {
        
        
        
        
        NSLog(@"Logged in to Facebook");
        UIAlertView *alertDialog;
        
        alertDialog = [[UIAlertView alloc]initWithTitle:@"Facebook" message:@"You are logged in to Facebook" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"No", nil];
        
        [alertDialog show];
        
        return YES;
    
    }
        else{
            
            
            NSLog(@"Not logged in to Facebook");
            return NO;
        }
    
}
*/
    
-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    
    

    self.profilePic.profileID = user.id;
    
   }

// Logged-in user experience
-(void) loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    
    
    self.statusLabel.text = @"You are logged in as, ";
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    
    
    
    
    self.profilePic.profileID = nil;
   
    
}





// Handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
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

    
    
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:(@"startGameSegue")])
    
    {
        
        
    
        MainMenuViewController *viewController = [segue destinationViewController];
        
      //  [self performSegueWithIdentifier:@"startGameSegue" sender:self];
        
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
