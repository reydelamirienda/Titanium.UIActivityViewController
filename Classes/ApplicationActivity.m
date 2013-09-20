//
//  ApplicationActivity.m
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "TiBase.h"
#import "TiViewController.h"
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
    return [self.proxy imageOrDefault];
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
    [self activityDidFinish:[self.proxy performActivity:self withItems:_activityItems]];
}

- (instancetype) initWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;
{
    self = [super init];
    if (self) {
        self.proxy = proxy;
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

