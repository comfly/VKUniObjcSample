//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "Person+PriorityComparable.h"


@implementation Person (PriorityComparable)

- (NSComparisonResult)compareByPriority:(Person *)other {
    if (other == nil) {
        return NSOrderedDescending;
    }

    if (self.salary < other.salary) {
        return NSOrderedAscending;
    } else if (self.salary > other.salary) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}

@end