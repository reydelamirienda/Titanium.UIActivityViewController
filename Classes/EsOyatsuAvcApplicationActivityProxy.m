//
//  EsOyatsuAvcApplicationActivityProxy.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "EsOyatsuAvcApplicationActivityProxy.h"
#import "ApplicationActivity.h"

@implementation EsOyatsuAvcApplicationActivityProxy

-(UIActivity*)asActivity
{
    return [ApplicationActivity activityWithProxy:self];
}

-(void)performActivity
{
    if (self.onPerformActivity != nil) {
        NSLog(@"invoking onPerformActivity %@ %@", self.type, self.title);
        [self.onPerformActivity call:[[NSArray array] autorelease] thisObject:self];
    }
}
@end
