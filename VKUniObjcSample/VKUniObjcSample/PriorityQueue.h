//
//  PriorityQueue.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PriorityComparable <NSObject>

- (NSComparisonResult)compareByPriority:(id<PriorityComparable>)other;

@end

// TODO: Extend priority queue: make it mutable, make the comparison more flexible that with protocol.

@interface PriorityQueue<__covariant ObjectType: __kindof id<PriorityComparable>> : NSObject

@property (nonatomic, readonly) NSUInteger count;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithArray:(NSArray<ObjectType> *)array capacity:(NSUInteger)capacity;

- (ObjectType)nextMin;

@end
