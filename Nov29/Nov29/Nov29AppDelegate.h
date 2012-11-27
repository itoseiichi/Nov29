//
//  Nov29AppDelegate.h
//  Nov29
//
//  Created by Hachi on 11/25/12.
//  Copyright (c) 2012 Hachi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@class View;
@class View2;

@interface Nov29AppDelegate : UIResponder <UIApplicationDelegate>{
	SystemSoundID sid;
	View *view;
	View2 *view2;
	NSUInteger viewCount;	//1 for vote, 2 for return
	UIWindow *_window;
}

- (void) touchUpInside: (id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
