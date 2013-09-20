//
//  ApplicationActivity.h
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "TiProxy.h"
#import "EsOyatsuAvcApplicationActivityProxy.h"
#import <UIKit/UIKit.h>

@interface ApplicationActivity : UIActivity {
    NSArray* _activityItems;
}

@property (strong, nonatomic) EsOyatsuAvcApplicationActivityProxy *proxy;

- (instancetype) initWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;

+ (ApplicationActivity*) activityWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy ofCategory:(UIActivityCategory)category;

@end

@interface ApplicationShareActivity : ApplicationActivity
+ (UIActivityCategory)activityCategory;
@end

@interface ApplicationActionActivity : ApplicationActivity
@end
