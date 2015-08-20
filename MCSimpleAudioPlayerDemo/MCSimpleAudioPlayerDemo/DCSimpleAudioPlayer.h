//
//  DCSimpleAudioPlayer.h
//  MCSimpleAudioPlayerDemo
//
//  Created by bokeadmin on 15/8/20.
//  Copyright (c) 2015年 bokeadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<MediaToolbox/MediaToolbox.h>
typedef NS_ENUM(NSUInteger, DCSAPStatus)
{
    DCSAPStatusStopped=0,
    DCSAPStatusPlaying=1,
    DCSAPStatusWaiting=2,
    DCSAPStatusPaused=3,
};


@interface DCSimpleAudioPlayer : NSObject
@property(nonatomic,copy,readonly)NSString *filePath;
@property(nonatomic,assign,readonly)AudioFileTypeID fileType;

@property(nonatomic,readonly)DCSAPStatus status;
@property(nonatomic,readonly)BOOL isPlayingOrWaiting;
@property(nonatomic,assign,readonly)BOOL failed;

@property(nonatomic,assign)NSTimeInterval progress;
@property(nonatomic,readonly)NSTimeInterval duration;

-(instancetype)initWithFilePath:(NSString*)filePath fileType:(AudioFileTypeID)fileType;

-(void)play;
-(void)pause;
-(void)stop;

@end
