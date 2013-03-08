//
//  PostMediaDelegate.h
//  WordPress
//
//  Created by Adrian Fisher-Fleming on 3/8/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PostMediaDelegate <NSObject>

@optional

/**
 * Animate the image back to the table cell (zoom out)
 */
- (void)animateOut;

@end
