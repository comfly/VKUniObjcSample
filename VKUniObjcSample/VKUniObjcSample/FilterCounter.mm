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
@property (nonatomic, readonly) std::list<NSUInteger> numbers;

@end

@implementation FilterCounter

- (instancetype)initWithNumbersCount:(NSUInteger)numbersCount {
    self = [super init];
    if (self) {
        _numbersCount = numbersCount;
    }
    
    return self;
}

- (void)generate {
    for (auto i = 0; i < self.numbersCount; ++i) {
        // TODO: Fix the numbers adding.
        self.numbers.push_back(arc4random_uniform(1000));
    }
//    NSLog(@"Size of numbers: %zd", self.numbers.size());
}

- (NSUInteger)countWithPredicate:(BOOL(^)(int))predicate {
    return std::count_if(self.numbers.cbegin(), self.numbers.cend(), predicate);
}

@end
