//
//  EsOyatsuAvcApplicationActivityProxy.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "TiApp.h"
#import "TiUtils.h"
#import "EsOyatsuAvcModule.h"
#import "EsOyatsuAvcApplicationActivityProxy.h"
#import "ApplicationActivity.h"

@implementation EsOyatsuAvcApplicationActivityProxy

// Getter for the image. If
-(UIImage*)imageOrDefault
{
    if (_image) {
        return [TiUtils image:_image proxy:self];
    } else {
        return [TiUtils image:@"modules/es.oyatsu.avc/activity.png" proxy:self];
    }
}


-(UIActivity*)asActivity
{
    return [ApplicationActivity activityWithProxy:self ofCategory:_category];
}

-(BOOL)performActivity:(ApplicationActivity*)activity withItems:(NSArray *)items
{
    if (self.onPerformActivity != nil) {
        NSLog(@"invoking onPerformActivity %@ %@", self.type, self.title);
        id ret = [self.onPerformActivity call:items thisObject:self];
        return [TiUtils boolValue:ret];
    } else {
        NSLog(@"ApplicationActivityProxy calling performActivity with no callback, will do nothing!");
        return YES;
    }
}
@end
