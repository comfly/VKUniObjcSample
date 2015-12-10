//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonTypes.h"
#import "Pair.h"


// TODO: Change all definitions from functions to blocks to be able to use Blocks Extensions.

typedef Pair List;

extern List list(id f, ...) __attribute__((overloadable)) NS_REQUIRES_NIL_TERMINATION;
extern List list(NSArray *items) __attribute__((overloadable));

extern id (^head)(List);
extern List (^tail)(List);

extern id nth(List, unsigned);

// Implements foldLeft/reduce function over the list with seed and aggregating function.
extern id fold(List, id, TwoAryFunction);
// Returns a number of items in the list.
extern unsigned count(List);
// Returns a new list with items being produced by Transform function application.
extern List (^const map)(List, Transform);
// Returns pair with exchanged elements: (a, b) => (b, a)
extern Pair flip(Pair);

extern NSArray *(^const toArray)(List);