//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "Pair.h"
#import "CommonTypes.h"

static NSObject *(^UnitMarker)(void) = ^{
    static NSObject *marker = nil;

    static dispatch_once_t token;
    dispatch_once(&token, ^{
        marker = [[NSObject alloc] init];
    });
    return marker;
};

static Pair _null;
Pair (^const null)() = ^{ return _null; };

__attribute__((constructor))
static void PairInitilizer() {
    _null = [(Pair) ^(id _1, id _2) {
        return UnitMarker();
    } copy];
}

Pair pair(id _1, id _2) {
    return (Pair) [[^(id(^f)(id, id)) {
        return f(_1, _2);
    } copy] autorelease];
}

id (^const car)(Pair) = ^(Pair p) {
    NSCParameterAssert(p);
    return [[p(^(id f, id _) { return f; }) retain] autorelease];
};

id (^const cdr)(Pair p) = ^(Pair p) {
    NSCParameterAssert(p);
    return [[p(^(id _, id s) { return s; }) retain] autorelease];
};

static TwoAryFunction Stub = ^id(id _1, id _2) { return nil; };
BOOL isnull(Pair p) {
    NSCParameterAssert(p);
    return p(Stub) == UnitMarker();
}

Pair first(Pair p, Transform f) {
    NSCParameterAssert(p);
    NSCParameterAssert(f);
    // Implement yourself.
    return nil;
}

Pair second(Pair p, Transform f) {
    NSCParameterAssert(p);
    NSCParameterAssert(f);
    // Implement yourself.
    return nil;
}

id apply(Pair p, TwoAryFunction f) {
    NSCParameterAssert(p);
    NSCParameterAssert(f);
    // Implement yourself.
    return nil;
}


