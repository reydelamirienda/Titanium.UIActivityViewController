//
//  EsOyatsuAvcApplicationActivityProxy.h
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "TiProxy.h"
#import "ActivityProxy.h"

@class ApplicationActivity;

@interface EsOyatsuAvcApplicationActivityProxy : TiProxy <ActivityProxy>

@property(retain, nonatomic) NSNumber* category;
@property(retain, nonatomic) NSString* type;
@property(retain, nonatomic) NSString* title;
@property(retain, nonatomic) id        image;

@property(retain, nonatomic) KrollCallback* onPerformActivity;

-(UIImage*)imageOrDefault;
-(BOOL)performActivity:(ApplicationActivity*)activity withItems:(NSArray*)items;

@end

@interface ApplicationActivity : UIActivity {
    NSArray* _activityItems;
}
@property (strong, nonatomic) EsOyatsuAvcApplicationActivityProxy *proxy;
- (instancetype) initWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy;
+ (ApplicationActivity*) activityWithProxy:(EsOyatsuAvcApplicationActivityProxy *)proxy ofCategory:(UIActivityCategory)category;
@end

@interface ApplicationShareActivity : ApplicationActivity
@end

@interface ApplicationActionActivity : ApplicationActivity
@end
