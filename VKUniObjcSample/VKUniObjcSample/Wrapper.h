//
//  Wrapper.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wrapper : NSObject

@property (nonatomic, readonly) const void *pointerValue;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)wrap:(const void *)value destructor:(void (^)(const void *))destructor;

@end
