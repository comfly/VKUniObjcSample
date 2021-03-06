//
//  CollectionOperationsSample.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "CollectionOperationsSample.h"
#import "CollectionsSampleItem.h"
#import "Utilities.h"
#import "Person.h"


@interface CollectionOperationsSample ()

@property (nonatomic, readonly, copy) NSDictionary<NSString *, id<NSObject>> *values;

@end

@implementation CollectionOperationsSample

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray<Person *> *people = [[self generateRandomPeople] copy];
        _values = @{
                @"max" : [people valueForKeyPath:@"@max.salary"],
                @"min" : [people valueForKeyPath:@"@min.salary"],
                @"avg" : [people valueForKeyPath:@"@avg.salary"],
                @"total 5mnth inc." : [[people valueForKeyPath:@"@unionOfArrays.lastIncomes"] valueForKeyPath:@"@sum.self"],
                @"avg 5mnth inc."   : [people valueForKeyPath:@"@unionOfArraysAvg.lastIncomes"], // <-- See below
                @"longest name" : [people valueForKeyPath:@"@longestUpcased.name"],
                @"avg of max of 5mnth inc." : [people valueForKeyPath:@"@avg.maxValueOfLastIncomes.max_income_value"],
        };
    }
    
    return self;
}

- (NSString *)generateRandomName {
    NSArray<NSString *> *names = GenerateNames();
    return names[arc4random_uniform(names.count)];
}

- (NSArray<Person *> *)generateRandomPeople {
    NSMutableArray<Person *> *result = [NSMutableArray arrayWithCapacity:1000];
    for (NSUInteger i = 0; i < 1000; ++i) {
        NSUInteger salary = arc4random_uniform(150000) + 100000; // USD per year.
        NSArray<NSNumber *> *incomes = @[
            @(arc4random_uniform(salary / 12)),
            @(arc4random_uniform(salary / 12)),
            @(arc4random_uniform(salary / 12)),
            @(arc4random_uniform(salary / 12)),
            @(arc4random_uniform(salary / 12)),
        ];
        NSString *name = [self generateRandomName];
        [result addObject:[Person personWithName:name salary:salary lastIncomes:incomes]];
    }
    
    return [result copy];
}

- (CollectionsSampleItem *)objectAtIndexedSubscript:(NSUInteger)index {
    NSString *key = self.values.allKeys[index];
    return [CollectionsSampleItem sampleItemWithTitle:key details:[self stringify:self.values[key]]];
}

- (NSString *)stringify:(id<NSObject>)item {
    return [item isKindOfClass:[NSNumber class]]
        ? [NSNumberFormatter localizedStringFromNumber:(NSNumber *)item numberStyle:NSNumberFormatterCurrencyStyle]
        : item.description;
}

- (NSUInteger)count {
    return self.values.count;
}

@end


@interface NSArray (KVOExtension)

- (id)_unionOfArraysAvgForKeyPath:(NSString *)keyPath;
- (id)_longestUpcasedForKeyPath:(NSString *)keyPath;

@end

@implementation NSArray (KVOExtension)

- (id)_unionOfArraysAvgForKeyPath:(NSString *)keyPath {
    NSString *firstPart = [NSString stringWithFormat:@"@unionOfArrays.%@", keyPath];
    return [[self valueForKeyPath:firstPart] valueForKeyPath:@"@avg.self"];
}

// EXAMPLE: Implementation that does not use other built-ins.
/*
- (id)_unionOfArraysAvgForKeyPath:(NSString *)keyPath {
    NSArray *arraysOfArrays = [self valueForKeyPath:keyPath];
    if (![arraysOfArrays isKindOfClass:[NSArray class]]) {
        return nil;
    }

    NSMutableArray *numbers = [NSMutableArray array];
    for (id possibleArray in arraysOfArrays) {
        if ([possibleArray isKindOfClass:[NSArray class]]) {
            [numbers addObjectsFromArray:possibleArray];
        } else {
            [numbers addObject:possibleArray];
        }
    }

    if (numbers.count == 0) {
        return nil;
    }

    double sum = 0;
    for (NSNumber *number in numbers) {
        sum += number.doubleValue;
    }

    return @(sum / numbers.count);
}
*/

- (id)_longestUpcasedForKeyPath:(NSString *)keyPath {
    // TODO: Implement this as a Sample above marked with EXAMPLE.
    // Also, implement this using not a string expression, but Expression subclasses: build the AST yourself.
    NSExpression *expression = [NSExpression expressionWithFormat:@"uppercase(SUBQUERY(%K, $x, $x.length == max(%K.length))[last])", keyPath, keyPath];
    return [expression expressionValueWithObject:self context:NULL];
}

@end


