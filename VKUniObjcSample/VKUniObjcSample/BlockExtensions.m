//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "BlockExtensions.h"
#import <objc/runtime.h>


@implementation BlockExtensions

static Transform compose_impl(id self, SEL _cmd, Transform block) {
    Transform this = self;
    return ^(id object) {
        return this(block(object));
    };
}

static NSArray *mapOver_impl(id self, SEL _cmd, id<NSFastEnumeration> items) {
    Transform this = self;

    NSMutableArray *result = [NSMutableArray array];
    for (id item in items) {
        id transformed = this(item);
        if (transformed) {
            [result addObject:transformed];
        }
    }
    return [result copy];
}

- (Transform)compose:(Transform)block { return nil; }
- (NSArray *)mapOver:(id<NSFastEnumeration>)items { return nil; }

+ (void)load {
    Class class = NSClassFromString(@"NSBlock");

    if (!class_addMethod(class, @selector(compose:), (IMP)compose_impl, "@@:@")) {
        NSLog(@"Block method \'compose:\' is not registered");
    }
    if (!class_addMethod(class, @selector(mapOver:), (IMP)mapOver_impl, "@@:@")) {
        NSLog(@"Block method \'mapOver:\' is not registered");
    }
}

@end