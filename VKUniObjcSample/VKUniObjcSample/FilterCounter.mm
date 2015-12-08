//
//  FilterCounter.mm
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "FilterCounter.h"
#import "Utilities.h"
#import <list>
#import <algorithm>


@interface FilterCounter ()

@property (nonatomic, readonly) NSUInteger numbersCount;
@property (nonatomic) std::list<NSUInteger> *numbers;

@end

@implementation FilterCounter

- (instancetype)initWithNumbersCount:(NSUInteger)numbersCount {
    self = [super init];
    if (self) {
        _numbersCount = numbersCount;
        _numbers = new std::list<NSUInteger>();
    }
    
    return self;
}

- (void)generate {
    for (auto i = 0; i < self.numbersCount; ++i) {
        self.numbers->push_back(NextRandom(10000000) + 1000);
    }
}

- (NSUInteger)countWithPredicate:(BOOL(^)(int))predicate {
    return std::count_if(self.numbers->cbegin(), self.numbers->cend(), predicate);
}

@end
