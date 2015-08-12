//
//  MeetupCommunicatorDelegate.h
//  BrowseMeetup
//
//  Created by bokeadmin on 15/8/12.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupCommunicatorDelegate <NSObject>
-(void)receiveGroupsJSON:(NSData*)objectNotation;
-(void)fetchingGroupsFailedWithError:(NSError*)error;
@end
