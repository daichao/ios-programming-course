//
//  DCColorDescription.m
//  Colorboard
//
//  Created by bokeadmin on 15/7/8.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import "DCColorDescription.h"

@implementation DCColorDescription
-(instancetype)init{
    self=[super init];
    if(self){
        _color=[UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        _name=@"Blue";
    }
    return  self;
}



@end
