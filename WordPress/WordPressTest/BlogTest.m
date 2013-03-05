//
//  BlogTest.m
//  WordPress
//
//  Created by Jorge Bernal on 3/5/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import "BlogTest.h"
#import "Blog.h"
#import "Media.h"
#import "CoreDataTestHelper.h"

@implementation BlogTest {
    Blog *_blog;
}

- (void)setUp {
    _blog = (Blog *)[[CoreDataTestHelper sharedHelper] insertEntityWithName:@"Blog"];
    _blog.xmlrpc = @"http://test.blog/xmlrpc.php";
    _blog.url = @"http://test.blog/";
}

- (void)testGetImageResizeDimensions {
    NSDictionary *expectedDefaults = @{
                                       @"smallSize": [NSValue valueWithCGSize:MediaSizeDefaultSmall],
                                       @"mediumSize": [NSValue valueWithCGSize:MediaSizeDefaultMedium],
                                       @"largeSize": [NSValue valueWithCGSize:MediaSizeDefaultLarge],
                                       };

    NSDictionary *imageDimensions = [_blog getImageResizeDimensions];
    STAssertEqualObjects(imageDimensions, expectedDefaults, nil);

    NSMutableDictionary *expected = [expectedDefaults mutableCopy];
    _blog.options = @{
                      @"thumbnail_size_w": @{@"value": @200},
                      @"thumbnail_size_h": @{@"value": @150},
                      @"medium_size_w": @{@"value": @400},
                      @"medium_size_h": @{@"value": @300},
                      @"large_size_w": @{@"value": @600},
                      @"large_size_h": @{@"value": @450},
                      };
    expected[@"smallSize"] = [NSValue valueWithCGSize:CGSizeMake(200, 150)];
    expected[@"mediumSize"] = [NSValue valueWithCGSize:CGSizeMake(400, 300)];
    expected[@"largeSize"] = [NSValue valueWithCGSize:CGSizeMake(600, 450)];
    imageDimensions = [_blog getImageResizeDimensions];
    STAssertEqualObjects(imageDimensions, expected, nil);
}

@end
