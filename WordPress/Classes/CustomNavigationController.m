//
//  CustomNavigationController.m
//  WordPress
//
//  Created by Adrian Fisher-Fleming on 3/8/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import "CustomNavigationController.h"
#import "MediaObjectViewController.h"

@implementation CustomNavigationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    NSLog(@"self.viewControllers lastObject: %@", [[self.viewControllers lastObject] class]);
	if([[self.viewControllers lastObject] class] == [MediaObjectViewController class]){
        MediaObjectViewController *media = (MediaObjectViewController *)[self.viewControllers lastObject] ;
        if(media.delegate)
            [media.delegate animateOut];
		UIViewController *viewController = [super popViewControllerAnimated:NO];
		return viewController;
	} else {
		return [super popViewControllerAnimated:animated];
	}
}
@end