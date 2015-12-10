//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonTypes.h"
#import "Pair.h"


typedef Pair List;

extern List list(id f, ...) NS_REQUIRES_NIL_TERMINATION;
extern id head(List);
extern List tail(List);
extern id nth(List, unsigned);

// Implements foldLeft/reduce function over the list with seed and aggregating function.
extern id fold(List, id, TwoAryFunction);
// Returns a number of items in the list.
extern unsigned count(List);
// Returns a new list with items being produced by Transform function application.
extern List map(List, Transform);
