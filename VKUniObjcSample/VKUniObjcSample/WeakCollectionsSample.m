//
//  WeakCollectionsSample.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "WeakCollectionsSample.h"
#import "CollectionsSampleItem.h"
#import "Person.h"


@interface WeakCollectionsSample ()

@property (nonatomic, readonly) NSPointerArray *items;
@property (nonatomic, readonly) NSMutableArray<Person *> *controlArray;

@end

@implementation WeakCollectionsSample

- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [NSPointerArray weakObjectsPointerArray];
        _controlArray = [[self generateRandomPeople] mutableCopy];
        for (Person *p in self.controlArray) {
            [self.items addPointer:(__bridge void *)p];
        }
    }
    
    return self;
}

- (NSUInteger)count {
    return self.items.count;
}

- (CollectionsSampleItem *)objectAtIndexedSubscript:(NSUInteger)index {
    Person *person = [self.items pointerAtIndex:index];
    return [CollectionsSampleItem sampleItemWithTitle:person.name details:[self formatSalaryOfPerson:person]];
}

- (NSString *)formatSalaryOfPerson:(Person *)person {
    return [NSNumberFormatter localizedStringFromNumber:@(person.salary) numberStyle:NSNumberFormatterCurrencyStyle];
}

- (NSArray<Person *> *)generateRandomPeople {
    return @[
        [Person personWithName:@"John" salary:100000 lastIncomes:nil],
        [Person personWithName:@"Mary" salary:110000 lastIncomes:nil]
    ];
}

- (void)nullifyFirstItem {
    [self.controlArray removeObjectAtIndex:0];
}

@end