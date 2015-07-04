//
//  StackTableViewCell.m
//  Levitee
//
//  Created by Dave Peck on 7/3/15.
//  Copyright (c) 2015 Tyler Mitchell. All rights reserved.
//

#import "StackTableViewCell.h"

@interface StackTableViewCell ()
@property (nonatomic, strong) UIImage *cachedSnapshot;
@end

@implementation StackTableViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.isLoading = YES;
    self.alpha = 1.0;
    self.cachedSnapshot = nil;
}

- (UIImage *)snapshot {
    if (self.isLoading) return nil;
    //NSLog(@"CALLED");
    if (self.cachedSnapshot) return self.cachedSnapshot;
    
    UIImage* image;
    UIGraphicsBeginImageContextWithOptions(self.frame.size, true, 2.0f);
    //CGContextRef context = UIGraphicsGetCurrentContext();
    //[self.layer renderInContext:context];
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.cachedSnapshot = image;
    return image;
}

@end
