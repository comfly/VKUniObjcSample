//
//  PriorityQueue.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue<__covariant ObjectType: __kindof id<NSObject>> : NSObject

@property (nonatomic, readonly) NSUInteger count;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithArray:(NSArray<ObjectType> *)array;

- (ObjectType)nextMin;

@end
