//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "BlockExtensions.h"
#import <objc/runtime.h>


@interface _BlockExtensions : NSObject

@end

@implementation _BlockExtensions

// TODO: Think about how can we be sure that 'self' in functions below are really of the types that are stated:
// Transform, TwoAryFunction. Actually, at the moment any block can call 'map', 'curry' etc.
// We should be guaranteed that only the proper ones can call the methods:
// test it at runtime and throw if the condition is unsatisfied.

static Transform compose_impl(Transform self, SEL _cmd, Transform block) {
    return ^(id object) {
        return self(block(object));
    };
}

static Transform revCompose_impl(Transform self, SEL _cmd, Transform block) {
    return ^(id object) {
        return block(self(object));
    };
}

static NSArray *mapOver_impl(Transform self, SEL _cmd, id<NSFastEnumeration> items) {
    NSMutableArray *result = [NSMutableArray array];

    //TODO: Implement yourself.
    
    return [result copy];
}

static Transform curry_impl(TwoAryFunction self, SEL _cmd) {
    return (Transform)^Transform(id a) {
        return ^id(id b) {
            return self(a, b);
        };
    };
}

static TwoAryFunction flip_impl(TwoAryFunction self, SEL _cmd) {
    return ^(id a, id b) {
        return self(b, a);
    };
}


+ (void)load {
    Class class = NSClassFromString(@"NSBlock");

    if (!class_addMethod(class, @selector(compose:), (IMP)compose_impl, "@@:@")) {
        NSLog(@"Block method \'compose:\' is not registered");
    }
    if (!class_addMethod(class, @selector(revCompose:), (IMP)revCompose_impl, "@@:@")) {
        NSLog(@"Block method \'revCompose:\' is not registered");
    }
    if (!class_addMethod(class, @selector(mapOver:), (IMP)mapOver_impl, "@@:@")) {
        NSLog(@"Block method \'mapOver:\' is not registered");
    }
    if (!class_addMethod(class, @selector(curry), (IMP)curry_impl, "@@:")) {
        NSLog(@"Block method \'curry\' is not registered");
    }
    if (!class_addMethod(class, @selector(flip), (IMP)flip_impl, "@@:")) {
        NSLog(@"Block method \'flip\' is not registered");
    }
}

@end