//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "BlockExtensions.h"
#import <objc/runtime.h>


@implementation BlockExtensions

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


- (Transform)compose:(Transform)block { return nil; }
- (Transform)revCompose:(Transform)block { return nil; }
- (NSArray *)mapOver:(id<NSFastEnumeration>)items { return nil; }
- (Transform)curry { return nil; }
- (TwoAryFunction)flip { return nil; }

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