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
    UIActivityCategory category = [TiUtils intValue:_category];
    return [ApplicationActivity activityWithProxy:self ofCategory:category];
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


@implementation ApplicationActivity

- (NSString *) activityType
{
    return _proxy.type;
}

- (NSString *) activityTitle
{
    return _proxy.title;
}

- (UIImage *) activityImage
{
    return [_proxy imageOrDefault];
}

- (void) prepareWithActivityItems:(NSArray *) activityItems
{
    _activityItems = activityItems;
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

- (void) performActivity
{
    [self activityDidFinish:[_proxy performActivity:self withItems:_activityItems]];
}

- (instancetype) initWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;
{
    self = [super init];
    if (self) {
        _proxy = proxy;
    }
    return self;
}

+ (ApplicationActivity*) activityWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy ofCategory:(UIActivityCategory)category
{
    if (category == UIActivityCategoryAction) {
        return [[ApplicationActionActivity alloc] initWithProxy:proxy];
    } else {
        return [[ApplicationShareActivity alloc] initWithProxy:proxy];
    }
}

@end

@implementation ApplicationShareActivity

+(UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}

@end

@implementation ApplicationActionActivity

+(UIActivityCategory)activityCategory
{
    return UIActivityCategoryAction;
}

@end

