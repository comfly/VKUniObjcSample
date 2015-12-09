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

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (NSUInteger)count {
    return CFBinaryHeapGetCount(self.heap);
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
