//
//  MeetupManagerDelegate.h
//  BrowseMeetup
//
//  Created by bokeadmin on 15/8/12.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupManagerDelegate <NSObject>
-(void)didReceiveGroups:(NSArray *)groups;
-(void)fetchingGroupsFailedWithError:(NSError*)error;
@end
