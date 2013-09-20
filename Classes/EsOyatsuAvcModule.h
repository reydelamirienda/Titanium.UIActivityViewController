/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"

/**
 * This module bridges the UIActivityViewController
 * from iOS6 in order to implement sharing in an easy way.
 */
@interface EsOyatsuAvcModule : TiModule 

@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_FACEBOOK;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_TWITTER;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_WEIBO;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_MESSAGE;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_MAIL;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_PRINT;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_COPY;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_TO_CONTACT;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_CAMERA_ROLL;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_TO_READING_LIST;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_FLICKR;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_VIMEO;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_TENCENT_WEIBO;
@property(nonatomic,readonly) NSString *ACTIVITY_TYPE_AIRDROP;

@end
