//
//  Wrapper.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "Wrapper.h"
#include <functional>


@interface Wrapper ()

@property (nonatomic, readonly) std::function<void(const void *)> destructor;

@end

@implementation Wrapper

- (instancetype)initWithValue:(const void *)value destructor:(std::function<void(const void *)>)destructor {
    self = [super init];
    if (self) {
        _pointerValue = value;
        _destructor = destructor;
    }
    
    return self;
}

+ (instancetype)wrap:(const void *)value destructor:(void (^)(const void *))destructor {
    return [[self alloc] initWithValue:value destructor:destructor];
}

- (void)dealloc {
    self.destructor(_pointerValue);
}

@end
