//
//  PersonObjc.cpp
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "PersonObjc.h"
#import "Utilities.h"


@implementation PersonObjc

+ (instancetype)personWithName:(NSString *)name DOB:(NSDate *)DOB hobby:(std::string)hobby {
    PersonObjc *result = [[self alloc] init];
    if (result) {
        result->_name = [name copy];
        result->_DOB = DOB;
        result->_hobby = hobby;
    }
    
    return result;
}

- (NSString *)description {
    NSMutableString *result = [@"PersonObjc: " mutableCopy];
    [result appendFormat:@"\"%@\", %@, %s",
        self.name,
        StringifyDate(self.DOB),
        self.hobby.c_str()
    ];
    return [result copy];
}

#if CHECK_MEMORY
- (void)dealloc {
    NSLog(@"PersonObjc \"%@\" destroyed", self.name);
}
#endif

@end