//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonTypes.h"


@interface BlockExtensions : NSObject

#define $ compose:(Transform)

- (Transform)compose:(Transform)block;
- (NSArray *)mapOver:(id<NSFastEnumeration>)items;

@property (nonatomic, readonly) Transform curry;
@property (nonatomic, readonly) TwoAryFunction flip;

@end