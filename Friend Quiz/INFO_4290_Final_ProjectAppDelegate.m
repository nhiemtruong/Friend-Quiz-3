//
//  INFO_4290_Final_ProjectAppDelegate.m
//  Friend Quiz
//
//  Created by Christian Retureta on 2014-01-29.
//  Copyright (c) 2014 Christian Retureta. All rights reserved.
//

#import "INFO_4290_Final_ProjectAppDelegate.h"
#import "INFO_4290_Final_ProjectViewController.h"
#import "MainMenuViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation INFO_4290_Final_ProjectAppDelegate 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [FBLoginView class];
    [FBProfilePictureView class];
    
    
    INFO_4290_Final_ProjectViewController *viewContoller= [[INFO_4290_Final_ProjectViewController alloc]init];
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc]init];
    

    
  // [self.window setRootViewController:viewContoller];
    
   // self.window.rootViewController = viewContoller;
 //   [self.window addSubview:viewContoller.view];
  //  [self.window addSubview:mainMenuViewController.view];
    
    

   
    
   // [self.window makeKeyAndVisible];
    
     [self checkFacebookSession];
    
    return YES;
    
    
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    
    
    
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;

}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//This method is impolemented to check if a Facebook Session is started.  IF it is it will return a TRUE value and it will confirm that the user is logged in.

- (NSDictionary*)parseURLParmams:(NSString *)query{
    
    
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableArray *params = [[NSMutableArray alloc]init];
    
    for (NSString *pair in pairs) {
        
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =[kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
     //   params[kv[0]]= val;
     
        
        
    }
    return params;
    
    
    
}

-(BOOL)checkFacebookSession
{
    if([FBSession activeSession].state == FBSessionStateCreatedTokenLoaded)
        
    {
        
        
        
        
        NSLog(@"Logged in to Facebook. Confirmed!!!");
        UIAlertView *alertDialog;
        
        alertDialog = [[UIAlertView alloc]initWithTitle:@"Facebook" message:@"You are logged in to Facebook" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alertDialog show];
        
        return TRUE;
     
    }
    else if (![FBSession activeSession].state == FBSessionStateCreatedTokenLoaded)
    
    {
        
        
        
        NSLog(@"Not logged in to Facebook");
        return FALSE;
    
    }
    
    return TRUE;

    
}


@end
