//
//  MeetupCommunicator.h
//  BrowseMeetup
//
//  Created by bokeadmin on 15/8/12.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@protocol MeetupCommunicatorDelegate;

@interface MeetupCommunicator : NSObject
@property(weak,nonatomic)id<MeetupCommunicatorDelegate>delegate;
-(void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;

@end
