//
//  Person.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSUInteger salary;
@property (nonatomic, readonly) NSArray<NSNumber *> *lastIncomes;
@property (nonatomic, readonly) NSDictionary<NSString *, NSNumber *> *maxValueOfLastIncomes;

+ (instancetype)personWithName:(NSString *)name
                        salary:(NSUInteger)salary
                  lastIncomes:(NSArray<NSNumber *> *)lastIncomes;

@end