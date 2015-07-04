//
//  StackTableViewCell.h
//  Levitee
//
//  Created by Dave Peck on 7/3/15.
//  Copyright (c) 2015 Tyler Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackTableViewCell : UITableViewCell

@property (assign) BOOL isLoading;

- (UIImage *)snapshot;

@end
