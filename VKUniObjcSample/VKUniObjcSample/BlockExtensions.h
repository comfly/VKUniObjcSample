//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonTypes.h"

#define $ compose:(Transform)
#define $$ revCompose:(Transform)

@interface BlockExtensions : NSObject

- (Transform)compose:(Transform)block;
- (Transform)revCompose:(Transform)block;
- (NSArray *)mapOver:(id<NSFastEnumeration>)items;
- (Transform)curry;
- (TwoAryFunction)flip;

@end