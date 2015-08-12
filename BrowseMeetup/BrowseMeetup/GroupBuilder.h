//
//  GroupBuilder.h
//  BrowseMeetup
//
//  Created by bokeadmin on 15/8/12.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuilder : NSObject
+(NSArray*)groupsFromJSON:(NSData *)objectNotation error:(NSError**)error;

@end
