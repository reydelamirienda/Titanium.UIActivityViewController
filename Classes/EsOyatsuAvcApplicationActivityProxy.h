//
//  EsOyatsuAvcApplicationActivityProxy.h
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "TiProxy.h"

@class ApplicationActivity;

@interface EsOyatsuAvcApplicationActivityProxy : TiProxy {
}

@property(retain, nonatomic) NSNumber* category;
@property(retain, nonatomic) NSString* type;
@property(retain, nonatomic) NSString* title;
@property(retain, nonatomic) id        image;

@property(retain, nonatomic) KrollCallback* onPerformActivity;

-(UIImage*)imageOrDefault;
-(ApplicationActivity*)asActivity;
-(BOOL)performActivity:(ApplicationActivity*)activity withItems:(NSArray*)items;

@end
