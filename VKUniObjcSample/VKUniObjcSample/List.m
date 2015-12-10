//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "List.h"
#import "BlockExtensions.h"


static NSArray *extractArguments(id first, va_list list) {
    if (!first) {
        return @[ ];
    }

    NSMutableArray *items = [@[first] mutableCopy];
    id next;
    while ((next = va_arg(list, id))) {
        [items addObject:next];
    }
    return items;
}

List list(id f, ...) {
    if (!f) {
        return null();
    }

    va_list args;
    va_start(args, f);
    NSArray *arguments = extractArguments(f, args).reverseObjectEnumerator.allObjects;
    va_end(args);

    Pair result = null();
    for (id item in arguments) {
        result = pair(item, result);
    }

    return result;
}

id (^head)(List) = ^(List list) {
    head = car;
    return head(list);
};

List (^tail)(List) = ^(List list) {
    tail = (List (^)(List)) cdr;
    return tail(list);
};

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

    //TODO: Implement yourself.

    return seed;
}

unsigned count(List list) {
    NSCParameterAssert(list);
    
    //TODO: Implement yourself.
    
    return 0;
}

List (^const map)(List, Transform) = ^(List list, Transform f) {
    NSCParameterAssert(list);
    NSCParameterAssert(f);
    
    //TODO: Can you do it using flip, curry, compose?
    
    return list;
};

NSArray *(^const toArray)(List) = ^(List list) {
    NSCParameterAssert(list);

    // Canonical
    return isnull(list)
        ? @[]
        : [@[head(list)] arrayByAddingObjectsFromArray:toArray(tail(list))];
    
    //TODO: Make Efficient, remove recursion and use loops.
};