//
//  PersonCpp.cpp
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#include "PersonCpp.hpp"
#include "Utilities.h"
#include <sstream>


namespace ObjCPPSamples {
    std::string PersonCpp::description() {
        std::ostringstream stream("");
        
        stream << "PersonCPP: " << name << ", " << StringifyDate(DOB).UTF8String << ", ";
        if (children.count > 0) {
            stream << "Children: {" << std::endl;
            for (PersonObjc *child in children) {
                stream << "\t" << child.description.UTF8String << "," << std::endl;
            }
            stream << "}" << std::endl;
        }
        
        if (!organizationsOwned.empty()) {
            stream << "Organizations: {" << std::endl;
            for (auto organization : organizationsOwned) {
                stream << "\t" << organization.description.UTF8String << "," << std::endl;
            }
            stream << "}";
        }
        
        return stream.str();
    }
    
    PersonCpp::~PersonCpp() {
#if CHECK_MEMORY
        NSLog(@"PersonCpp \"%@\" destroyed", name);
#endif
    }
}