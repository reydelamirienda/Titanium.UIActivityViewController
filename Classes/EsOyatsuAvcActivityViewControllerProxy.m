//
//  EsOyatsuAvcActivityViewControllerProxy.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/18/13.
//
//

#import "EsOyatsuAvcActivityViewControllerProxy.h"
#import "ActivityProxy.h"

#import "TiApp.h"
#import "TiUtils.h"
#import "TiFile.h"

@implementation EsOyatsuAvcActivityViewControllerProxy

-(NSArray*)buildActivities
{
    NSMutableArray* result = nil;
    if (_applicationActivities != nil) {
        result = [NSMutableArray array];
        for (UIActivity<ActivityProxy>* aap in _applicationActivities) {
            UIActivity* act = [aap asActivity];
            [result addObject:act];
        }
    }
    return result;
}

-(void) performWithItems:(id)args
{
    [self rememberSelf];
 	ENSURE_UI_THREAD_1_ARG(args)
    NSArray *varargs = args;
    
    NSMutableArray* activityItems = [NSMutableArray array];
    for (id obj in varargs) {
        UIImage* img = [TiUtils image:obj proxy:self];
        if (img != nil) {
            [activityItems addObject:img];
        } else if ([obj isKindOfClass:[NSString class]]) {
            NSURL *url = [NSURL URLWithString:obj];
            if (url != nil && ([url.scheme isEqualToString:@"http"] || [url.scheme isEqualToString:@"https"])) {
                [activityItems addObject:url];
            } else {
                [activityItems addObject:obj];
            }
        } else if ([obj isKindOfClass:[TiFile class]]) {
            TiFile* file = obj;
            NSURL *url = [NSURL fileURLWithPath:file.path];
            [activityItems addObject:url];
        } else {
            [activityItems addObject:obj];
        }
    }

    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                             applicationActivities:[self buildActivities]];

    if (_excluded != nil) {
        [controller setExcludedActivityTypes:_excluded];
    }

    controller.completionWithItemsHandler = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
        NSMutableDictionary *event = [[NSMutableDictionary alloc] initWithDictionary:@{ @"success": @(completed) }];
        if (activityType != nil) {
            [event setValue:activityType forKey:@"activity"];
        }
        [self fireEvent:@"completed" withObject:event];
        controller.completionWithItemsHandler = nil;
        [controller autorelease];
        [self forgetSelf];
        [self autorelease];
    };

    [self retain];
    [[TiApp app].controller presentViewController:controller animated:YES completion:nil];
}

@end
