//
//  OrganizationObjc.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonObjc.h"

#include <vector>
#include <string>


@interface OrganizationObjc : NSObject

@property (nonatomic) std::string name;
@property (nonatomic) NSDate *establishedAt;
@property (nonatomic) std::vector<PersonObjc *> employees;
@property (nonatomic, copy) NSArray *owners; // of PersonCpp

+ (instancetype)organizationWithName:(std::string)name
                             estDate:(NSDate *)estDate
                           employees:(std::vector<PersonObjc *>)employees
                              owners:(NSArray *)owners;

@end
