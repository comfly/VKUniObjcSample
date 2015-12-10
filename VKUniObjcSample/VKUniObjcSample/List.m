//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "List.h"

static NSArray *extractArguments(id first, va_list list) {
    if (!first) {
        return @[ ];
    }

    NSMutableArray *items = [@[ first ] mutableCopy];
    id next;
    while ((next = va_arg(list, id))) {
        [items addObject:next];
    }
    return items;
}

List list(id f, ...) {
    if (!f) {
        return null;
    }

    va_list args;
    va_start(args, f);
    NSArray *arguments = extractArguments(f, args).reverseObjectEnumerator.allObjects;
    va_end(args);

    Pair result = null;
    for (id item in arguments) {
        result = pair(item, result);
    }

    return result;
}

id head(List list) {
    NSCParameterAssert(list);
    return car(list);
}

List tail(List list) {
    NSCParameterAssert(list);
    return cdr(list);
}

id nth(List list, unsigned n) {
    NSCParameterAssert(list);

    while (n --> 0 && list && !isnull(list)) {
        list = tail(list);
    }

    return isnull(list) ? nil : head(list);
}

id fold(List list, id seed, TwoAryFunction f) {
    NSCParameterAssert(list);
    NSCParameterAssert(f);

    // Implement yourself.

    return seed;
}

unsigned count(List list) {
    NSCParameterAssert(list);
    // Implement yourself.
    return 0;
}

List map(List list, Transform f) {
    NSCParameterAssert(list);
    NSCParameterAssert(f);
    // Implement yourself.

    return isnull(list)
            ? list
            : pair(f(head(list)), map(tail(list), f));
}
