//
//  AutosavingIndicatorView.h
//  WordPress
//
//  Created by Jorge Bernal on 1/24/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Small toast-like indicator appearing on the post editor as it is autosaving.
 */
@interface AutosavingIndicatorView : UIView

/**
 Displays the autosave indicator and starts animating
 */
- (void)startAnimating;

/**
 Stops the autosave animation and dismisses the indicator
 
 @param success pass YES if the autosaving was successful, otherwise pass NO
 */
- (void)stopAnimatingWithSuccess:(BOOL)success;

@end
