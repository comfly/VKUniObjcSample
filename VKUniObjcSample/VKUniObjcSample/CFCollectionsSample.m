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
#import "Person+PriorityComparable.h"
#import "Person+Presentation.h"


@interface CFCollectionsSample ()

@property (nonatomic, readonly) PriorityQueue<Person *> *queue;
@property (nonatomic) NSMutableArray<Person *> *results;

@end

@implementation CFCollectionsSample

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray<Person *> *people = [self generateRandomPeople];
        _queue = [[PriorityQueue alloc] initWithArray:people capacity:people.count];
        _results = [NSMutableArray arrayWithCapacity:people.count];
    }
    
    return self;
}

- (NSArray<Person *> *)generateRandomPeople {
    NSUInteger kNumberToGenerate = 10;
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:kNumberToGenerate];
    NSArray<NSString *> *names = [GenerateNames() subarrayWithRange:NSMakeRange(0, kNumberToGenerate)];
    for (NSUInteger i = 0; i < kNumberToGenerate; ++i) {
        [result addObject:[Person personWithName:names[i] salary:arc4random_uniform(100000) + 100000]];
    }
    return [result copy];
}

- (NSUInteger)count {
    return self.results.count;
}

- (CollectionsSampleItem *)objectAtIndexedSubscript:(NSUInteger)index {
    Person *person = self.results[index];
    return [CollectionsSampleItem sampleItemWithTitle:person.name details:person.salaryString];
}

- (BOOL)grabNextMin {
    Person *nextPerson = [self.queue nextMin];
    if (nextPerson) {
        [self.results addObject:nextPerson];
        return YES;
    }

    return NO;
}

@end
