//
//  ActivityProxy.h
//  ActivityViewController
//
//  Created by Alberto Gonzalez on 9/20/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ActivityProxy <NSObject>
- (UIActivity*) asActivity;
@end
