//
//  PriorityQueue.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "PriorityQueue.h"

@interface PriorityQueue ()

@property (nonatomic, readonly) CFBinaryHeapRef heap;

@end

@implementation PriorityQueue

- (instancetype)initWithArray:(NSArray *)array capacity:(NSUInteger)capacity {
    self = [super init];
    if (self) {
        CFBinaryHeapCallBacks callbacks = [self createCallbacks];
        _heap = CFBinaryHeapCreate(NULL, (CFIndex) capacity, &callbacks, NULL);
        for (id item in array) {
            CFBinaryHeapAddValue(self.heap, (const void *)item);
        }
    }
    
    return self;
}


static const void *PriorityQueueRetainCallback(CFAllocatorRef allocator, const void *ptr) {
    id<NSObject> object = (id<NSObject>)ptr;
    return [object retain];
}

static void PriorityQueueReleaseCallback(CFAllocatorRef allocator, const void *ptr) {
    id<NSObject> object = (id<NSObject>)ptr;
    [object release];
}

static CFStringRef PriorityQueueCopyDescriptionCallBack(const void *info) {
    id<NSObject> object = (id<NSObject>)info;
    return (CFStringRef) [object.description copy];
}

static CFComparisonResult PriorityQueueCompareCallBack(const void *ptr1, const void *ptr2, void *info) {
    id<PriorityComparable> object1 = (id<PriorityComparable>)ptr1;
    id<PriorityComparable> object2 = (id<PriorityComparable>)ptr2;
    if (object1 == object2) {
        return kCFCompareEqualTo;
    }

    switch ([object1 compareByPriority:object2]) {
        case NSOrderedAscending:
            return kCFCompareLessThan;
        case NSOrderedSame:
            return kCFCompareEqualTo;
        case NSOrderedDescending:
            return kCFCompareGreaterThan;
    }

    return kCFCompareEqualTo;
}

- (CFBinaryHeapCallBacks)createCallbacks {
    return (CFBinaryHeapCallBacks) {
            .retain = PriorityQueueRetainCallback,
            .release = PriorityQueueReleaseCallback,
            .copyDescription = PriorityQueueCopyDescriptionCallBack,
            .compare = PriorityQueueCompareCallBack
    };
}

- (NSUInteger)count {
    return (NSUInteger) CFBinaryHeapGetCount(self.heap);
}

- (id)nextMin {
    if (self.count == 0) {
        return nil;
    }
    
    id item = [[(id)CFBinaryHeapGetMinimum(self.heap) retain] autorelease];
    CFBinaryHeapRemoveMinimumValue(self.heap);
    return item;
}

- (void)dealloc {
    CFRelease(_heap);
    
    [super dealloc];
}


@end
