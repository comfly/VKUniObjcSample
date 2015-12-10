//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonTypes.h"

// TODO: change all the functions to blocks, like 'car' and 'cdr'.
// This will allow you to use block extensions with them.

typedef id (^Pair)(TwoAryFunction);

extern Pair pair(id, id);
extern id(^const car)(Pair);
extern id(^const cdr)(Pair);

// Constructs a new pair with CAR modified with Transform function, and old CDR.
extern Pair first(Pair, Transform);
// Constructs a new pair with old CAR, and a new CDR modified with Transform function.
extern Pair second(Pair, Transform);

// Applies Pair to a 2-ary function, CAR is applied as the first arg, CDR - as the second.
extern id apply(Pair, TwoAryFunction);

extern Pair flip(Pair);

extern Pair (^const null)();
extern BOOL isnull(Pair p);
