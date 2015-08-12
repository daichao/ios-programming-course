//
//  MeetupCommunicator.m
//  BrowseMeetup
//
//  Created by bokeadmin on 15/8/12.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import "MeetupCommunicator.h"
#import "MeetupCommunicatorDelegate.h"

#define API_KEY @"406f3528e64af326f432e7822f73"
#define PAGE_COUNT 20

@implementation MeetupCommunicator
-(void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate{
    NSString *urlAsString=[NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=%f&lon=%f&page=%d&key=%@",coordinate.latitude,coordinate.longitude,PAGE_COUNT,API_KEY];
    NSURL *url=[[NSURL alloc]initWithString:urlAsString];
    NSLog(@"%@",urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc]initWithURL:url] queue:[[NSOperationQueue alloc]init]     completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            [self.delegate fetchingGroupsFailedWithError:error];
        }else{
            [self.delegate receiveGroupsJSON:data];
        }
    }];
}
@end
