//
//  EsOyatsuAvcImportToCalendarActivityProxy.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/20/13.
//
//

#import "TiCalendarCalendar.h"

#import "EsOyatsuAvcImportToCalendarActivityProxy.h"

@implementation EsOyatsuAvcImportToCalendarActivityProxy

-(UIActivity*) asActivity
{
    EKImportToCalendarActivity* act = [[EKImportToCalendarActivity alloc] init];
    act.store = _calendar.store;
    return act;
}

@end

@implementation EKImportToCalendarActivity

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
    return nil;
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void) prepareWithActivityItems:(NSArray *) activityItems
{
}

-(UIViewController*) activityViewController
{
    EKEventEditViewController* eevc = [[EKEventEditViewController alloc] init];
    eevc.eventStore = _store;
    eevc.editViewDelegate = self;
    return eevc;
}

-(void) eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action
{
    [self activityDidFinish: (action == EKEventEditViewActionCanceled)];
}

@end