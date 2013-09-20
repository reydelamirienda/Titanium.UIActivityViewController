//
//  EsOyatsuAvcActivityViewControllerProxy.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/18/13.
//
//

#import "EsOyatsuAvcActivityViewControllerProxy.h"
#import "EsOyatsuAvcApplicationActivityProxy.h"
#import "ApplicationActivity.h"

#import "TiApp.h"
#import "TiUtils.h"

@implementation EsOyatsuAvcActivityViewControllerProxy


-(NSArray*)buildActivities
{
    NSMutableArray* result = nil;
    if (_applicationActivities != nil) {
        result = [NSMutableArray array];
        for (int i = 0; i < _applicationActivities.count; i++) {
            EsOyatsuAvcApplicationActivityProxy* aap = [_applicationActivities objectAtIndex:i];
            UIActivity* act = [aap asActivity];
            [result addObject:act];
        }
    }
    return result;
}

-(void) open:(id)args
{
	ENSURE_UI_THREAD_0_ARGS

    NSMutableArray* activityItems = [NSMutableArray array];
    
    NSString* text = [self valueForKey:@"text"];
    if (text != nil) {
        [activityItems addObject:text];
    }
    
    id image = [self valueForKey:@"image"];
    if (image != nil) {
        UIImage* uiimage = [TiUtils image:image proxy:self];
        if (uiimage != nil) {
            [activityItems addObject:uiimage];
        }
    }
    
    NSArray *applicationActivities = [self buildActivities];
    
	UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:applicationActivities];
    
    if (_excluded != nil) {
        [controller setExcludedActivityTypes:_excluded];
    }
    
    [controller setCompletionHandler:^(NSString *act, BOOL done) {
        NSMutableDictionary *event = [[[NSMutableDictionary alloc] initWithObjectsAndKeys:NUMBOOL(done), @"success", nil] autorelease];
		if (act != nil) {
            [event setValue:act forKey:@"activity"];
        }
        [self fireEvent:@"completed" withObject:event];
	}];
    
	[[TiApp app] showModalController:controller animated:YES];
}

@end
