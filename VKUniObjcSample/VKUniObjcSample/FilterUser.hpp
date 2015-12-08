//
//  FilterUser.hpp
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#include <functional>
#include <memory>


typedef struct IMPL *PIMPL;

class FilterUser {
private:
    PIMPL _impl;
    
public:
    FilterUser();
    FilterUser(const FilterUser &);
    virtual ~FilterUser();
    
    void generateNumbers();
    int countPredicate(std::function<bool(int)>);
};
