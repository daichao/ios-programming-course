//
//  Group.h
//  BrowseMeetup
//
//  Created by bokeadmin on 15/8/12.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *description;
@property(strong,nonatomic)NSString *who;
@property(strong,nonatomic)NSString *country;
@property(strong,nonatomic)NSString *city;

@end
