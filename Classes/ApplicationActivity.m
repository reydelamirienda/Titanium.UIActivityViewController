//
//  ApplicationActivity.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "TiBase.h"
#import "ApplicationActivity.h"

@implementation ApplicationActivity

- (NSString *) activityType
{
    return self.proxy.type;
}

- (NSString *) activityTitle
{
    return self.proxy.title;
}

- (UIImage *) activityImage
{
    return self.proxy.image;
}

- (void) prepareWithActivityItems:(NSArray *) activityItems
{
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (UIViewController *)activityViewController {
    // In the future we can allow apps to display a full sharing UI from here
    return nil;
}

- (void) performActivity
{
    [self.proxy performActivity];
    [self activityDidFinish:YES];
}

- (instancetype) initWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;
{
    self = [super init];
    if (self) {
        self.proxy = proxy;
    }
    return self;
}

+ (ApplicationActivity*) activityWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;
{
    return [[ApplicationActivity alloc] initWithProxy:proxy];
}

@end
