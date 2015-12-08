//
//  PersonObjc.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "OrganizationObjc.h"
#import "PersonCpp.hpp"
#import "Utilities.h"


@implementation OrganizationObjc

+ (instancetype)organizationWithName:(std::string)name
                             estDate:(NSDate *)estDate
                           employees:(std::vector<PersonObjc *>)employees
                              owners:(NSArray *)owners {
    OrganizationObjc *result = [[OrganizationObjc alloc] init];
    if (result) {
        result->_name = name;
        result->_establishedAt = estDate;
        result->_employees = employees;
        result->_owners = [owners copy];
    }
    
    return result;
}


- (NSString *)description {
    NSMutableString *result = [NSMutableString stringWithString:@"Organization: {\n"];
    [result appendFormat:@"name: \"%s\",\n", self.name.data()];
    [result appendFormat:@"Est.: %@\n", StringifyDate(self.establishedAt)];

    if (!self.employees.empty()) {
        [result appendString:@"Employees: {\n"];
        for (auto employee : self.employees) {
            [result appendFormat:@"\t%@\n", employee];
        }
        [result appendString:@"}\n"];
    }
    
    if (self.owners.count > 0) {
        [result appendString:@"Owners: {\n"];
        for (NSValue *value in self.owners) {
            auto person = static_cast<ObjCPPSamples::PersonCpp *>(value.pointerValue);
            [result appendFormat:@"\t%s\n", person->description().c_str()];
        }
        [result appendString:@"}"];
    }
    
    return result;
}

#if CHECK_MEMORY
- (void)dealloc {
    NSLog(@"Organization \"%s\" destroyed", self.name.c_str());
}
#endif

@end
