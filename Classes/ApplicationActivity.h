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

@interface ApplicationActivity : UIActivity

@property (strong, nonatomic) EsOyatsuAvcApplicationActivityProxy *proxy;

- (instancetype) initWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;

+ (ApplicationActivity*) activityWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;

@end
