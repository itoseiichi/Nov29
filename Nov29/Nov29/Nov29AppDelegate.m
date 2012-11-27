//
//  Nov29AppDelegate.m
//  Nov29
//
//  Created by Hachi on 11/25/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import "Nov29AppDelegate.h"
#import "View.h"
#import "View2.h"

@implementation Nov29AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	NSBundle *bundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);
	
	NSString *filename = [bundle pathForResource: @"winning" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filename);
	
	NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
	
	OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}
	
	UIScreen *screen = [UIScreen mainScreen];
    view = [[View alloc] initWithFrame: screen.applicationFrame];
	view2 = [[View2 alloc] initWithFrame: screen.applicationFrame];
    viewCount = 1;
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	[self.window makeKeyAndVisible];
    [self.window addSubview: view];
	return YES;

}


- (void) touchUpInside: (id) sender {
	//The sender is the button that was pressed.
	
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
	
	
	
	//UIScreen *screen = [UIScreen mainScreen];
    //self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	//[self.window makeKeyAndVisible];
	
	if (viewCount ==1){
		viewCount = 2;
		//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		AudioServicesPlaySystemSound(sid);
		[self.window addSubview: view2];
	} else if(viewCount == 2){
		viewCount = 1;
		[self.window addSubview: view];
	}
	
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

- (void) dealloc {
	OSStatus error = AudioServicesDisposeSystemSoundID(sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesDisposeSystemSoundID error == %ld", error);
	}
}

@end
