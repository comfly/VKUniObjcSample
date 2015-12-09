//
//  CFCollectionsSample.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "CFCollectionsSample.h"
#import "CollectionsSampleItem.h"
#import "Person.h"
#import "PriorityQueue.h"


@interface CFCollectionsSample ()

@property (nonatomic, readonly) PriorityQueue<Person *> *queue;

@end

@implementation CFCollectionsSample

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray<Person *> *people = [self generateRandomPeople];
        _queue = [[PriorityQueue alloc] initWithArray:people];
    }
    
    return self;
}

- (NSArray<Person *> *)generateRandomPeople {
    NSUInteger kNumberToGenerate = 10;
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:kNumberToGenerate];
    return [result copy];
}

- (NSUInteger)count {
    return 0;
}

- (CollectionsSampleItem *)objectAtIndexedSubscript:(NSUInteger)index {
    return nil;
}

- (NSString *)formatSalaryOfPerson:(Person *)person {
    return [NSNumberFormatter localizedStringFromNumber:@(person.salary) numberStyle:NSNumberFormatterCurrencyStyle];
}

- (void)nullifyFirstItem {
    
}

@end
