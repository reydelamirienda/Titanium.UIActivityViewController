//
//  EsOyatsuAvcImportToCalendarActivityProxy.h
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/20/13.
//
//

#define USE_TI_CALENDAR

#import "TiProxy.h"
#import "ActivityProxy.h"
#import <EventKitUI/EKEventEditViewController.h>
#import "CalendarModule.h"

@interface EsOyatsuAvcImportToCalendarActivityProxy : TiProxy <ActivityProxy>

@property(retain, nonatomic) CalendarModule* calendar;

@end

@interface EKImportToCalendarActivity : UIActivity <EKEventEditViewDelegate> {
    EsOyatsuAvcImportToCalendarActivityProxy* _proxy;
    EKEvent* _event;
}

@property(retain, nonatomic) EKEventStore* store;

- (instancetype) initWithProxy:(EsOyatsuAvcImportToCalendarActivityProxy *)proxy toStore:(EKEventStore*)store;

@end

