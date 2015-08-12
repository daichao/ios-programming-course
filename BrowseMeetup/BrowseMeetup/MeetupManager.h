//
//  MeetupManager.h
//  BrowseMeetup
//
//  Created by bokeadmin on 15/8/12.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MeetupManagerDelegate.h"
#import "MeetupCommunicatorDelegate.h"
@class MeetupCommunicator;

@interface MeetupManager : NSObject<MeetupCommunicatorDelegate>
@property(strong,nonatomic)MeetupCommunicator *communicator;
@property(weak,nonatomic)id<MeetupManagerDelegate> delegate;
-(void)fetchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;
@end
