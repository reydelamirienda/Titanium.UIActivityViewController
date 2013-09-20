//
//  EsOyatsuAvcApplicationActivityProxy.h
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/19/13.
//
//

#import "TiProxy.h"

@interface EsOyatsuAvcApplicationActivityProxy : TiProxy

@property(retain, nonatomic) NSString* type;
@property(retain, nonatomic) NSString* title;
@property(retain, nonatomic) UIImage*  image;

@property(retain, nonatomic) KrollCallback* onPerformActivity;
@property(retain, nonatomic) KrollCallback* onActivityViewController;

-(UIActivity*)asActivity;
-(void)performActivity;

@end
