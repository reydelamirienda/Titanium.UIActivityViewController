//
//  EsOyatsuAvcImportToCalendarActivityProxy.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/20/13.
//
//

#define USE_TI_CALENDAR

#import "TiCalendarCalendar.h"
#import "TiCalendarEvent.h"
#import "TiUtils.h"

#import "EsOyatsuAvcImportToCalendarActivityProxy.h"

@implementation EsOyatsuAvcImportToCalendarActivityProxy

-(UIActivity*) asActivity
{
    EKImportToCalendarActivity* act = [[EKImportToCalendarActivity alloc] initWithProxy:self toStore:_calendar.store];
    return act;
}

@end

@implementation EKImportToCalendarActivity

- (instancetype) initWithProxy:(EsOyatsuAvcImportToCalendarActivityProxy *)proxy toStore:(EKEventStore *)store;
{
    self = [super init];
    if (self) {
        _proxy = proxy;
        _store = store;
    }
    return self;
}

- (EKEvent*) buildEvent:(id)obj withStore:(EKEventStore*)store
{
    if (![obj isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSDictionary * dict = obj;
    NSDate *begin = [dict valueForKey:@"begin"];
    if (begin == nil || ![begin isKindOfClass:[NSDate class]]) {
        return nil;
    }
    NSDate *end = [dict valueForKey:@"end"];
    if (end == nil || ![end isKindOfClass:[NSDate class]]) {
        return nil;
    }
    NSString *title = [dict valueForKey:@"title"];
    NSString *notes = [dict valueForKey:@"notes"];
    NSString *location = [dict valueForKey:@"location"];
    
    EKEvent* event = [EKEvent eventWithEventStore:store];
    event.startDate = begin;
    event.endDate = end;
    event.title = [dict valueForKey:@"title"];
    event.notes = [dict valueForKey:@"notes"];
    event.location = [dict valueForKey:@"location"];
    event.URL = [dict valueForKey:@"url"];
    return event;
}

- (NSString *) activityType
{
    return @"es.oyatsu.avc.EKImportToCalendar";
}

- (NSString *) activityTitle
{
    return @"Export to Calendar";
}

- (UIImage *) activityImage
{
    return [TiUtils image:@"modules/es.oyatsu.avc/NHCalendarActivityIcon.png" proxy:_proxy];
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems
{
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[EKEvent class]]) {
            return YES;
        } else if ([obj isKindOfClass:[TiCalendarEvent class]]) {
            return YES;
        } else if ([self buildEvent:obj withStore:_store]) {
            return YES;
        }
    }
    return NO;
}

- (void) prepareWithActivityItems:(NSArray *) activityItems
{
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[EKEvent class]]) {
            _event = obj;
        } else if ([obj isKindOfClass:[TiCalendarEvent class]]) {
            TiCalendarEvent* e = obj;
            _event = e.event;
        } else {
            EKEvent* event = [self buildEvent:obj withStore:_store];
            if (event) {
                _event = event;
            }
        }
    }
}

-(UIViewController*) activityViewController
{
    EKEventEditViewController* eevc = [[EKEventEditViewController alloc] init];
    eevc.eventStore = _store;
    eevc.event = _event;
    eevc.editViewDelegate = self;
    return eevc;
}

-(void) eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self activityDidFinish: (action != EKEventEditViewActionCanceled)];
}

@end
