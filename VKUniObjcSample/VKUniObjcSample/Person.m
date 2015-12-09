//
//  Person.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)personWithName:(NSString *)name
                        salary:(NSUInteger)salary
                   lastIncomes:(NSArray<NSNumber *> *)lastIncomes {
    Person *result = [[self alloc] init];
    if (result) {
        result->_name = [name copy];
        result->_salary = salary;
        result->_lastIncomes = [lastIncomes copy];
        result->_maxValueOfLastIncomes = lastIncomes ? @{ @"max_income_value" : [lastIncomes valueForKeyPath:@"@max.self"] } : @{ };
    }
    
    return result;
}

@end