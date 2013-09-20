/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "EsOyatsuAvcModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation EsOyatsuAvcModule

#pragma mark Internal

MAKE_SYSTEM_PROP(ACTIVITY_CATEGORY_ACTION,  UIActivityCategoryAction);
MAKE_SYSTEM_PROP(ACTIVITY_CATEGORY_SHARE,   UIActivityCategoryShare);

MAKE_SYSTEM_STR(ACTIVITY_TYPE_FACEBOOK,     UIActivityTypePostToFacebook);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_TWITTER,      UIActivityTypePostToTwitter);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_WEIBO,        UIActivityTypePostToWeibo);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_MESSAGE,      UIActivityTypeMessage);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_MAIL,         UIActivityTypeMail);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_PRINT,        UIActivityTypePrint);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_COPY,         UIActivityTypeCopyToPasteboard);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_TO_CONTACT,   UIActivityTypeAssignToContact);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_CAMERA_ROLL,  UIActivityTypeSaveToCameraRoll);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_TO_READING_LIST, UIActivityTypeAddToReadingList);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_FLICKR,       UIActivityTypePostToFlickr);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_VIMEO,        UIActivityTypePostToVimeo);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_TENCENT_WEIBO, UIActivityTypePostToTencentWeibo);
MAKE_SYSTEM_STR(ACTIVITY_TYPE_AIRDROP,      UIActivityTypeAirDrop);

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"4a814f45-3433-44eb-86b2-d4291c2d8b39";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"es.oyatsu.avc";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

@end
