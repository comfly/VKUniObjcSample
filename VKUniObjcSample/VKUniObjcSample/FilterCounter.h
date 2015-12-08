//
//  FilterCounter.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FilterCounter : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithNumbersCount:(NSUInteger)numbersCount;

- (void)generate;
- (NSUInteger)countWithPredicate:(BOOL(^)(int))predicate;

@end
