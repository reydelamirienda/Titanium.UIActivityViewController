//
//  EsOyatsuAvcImportToCalendarActivityProxy.h
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/20/13.
//
//

#import "TiProxy.h"
#import "ActivityProxy.h"
#import <EventKitUI/EKEventEditViewController.h>
#import "CalendarModule.h"

@interface EsOyatsuAvcImportToCalendarActivityProxy : TiProxy <ActivityProxy>

@property(retain, nonatomic) CalendarModule* calendar;

@end

@interface EKImportToCalendarActivity : UIActivity <EKEventEditViewDelegate>

@property(retain, nonatomic) EKEventStore* store;

@end

