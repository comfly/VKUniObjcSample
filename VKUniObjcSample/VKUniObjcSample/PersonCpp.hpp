//
//  PersonCpp.hpp
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#ifndef PersonCpp_hpp
#define PersonCpp_hpp

#import <Foundation/Foundation.h>
#include "OrganizationObjc.h"
#include <vector>


namespace ObjCPPSamples {
    struct PersonCpp {
        NSString *name;
        NSDate *DOB;
        NSArray<PersonObjc *> *children; // of PersonObjc
        std::vector<OrganizationObjc *> organizationsOwned;
        
        PersonCpp(NSString *_name, NSDate *_DOB, NSArray<PersonObjc *> *_children, std::vector<OrganizationObjc *> _owned)
            : name(_name), DOB(_DOB), children(_children), organizationsOwned(_owned) { }
        
        virtual std::string description();
        ~PersonCpp();
    };
}

#endif /* PersonCpp_hpp */
