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
    // TODO: Try using std::shared_ptr/std::unique_ptr instead.
    PIMPL _impl;
    
public:
    FilterUser();
    FilterUser(const FilterUser &);
    FilterUser &operator =(const FilterUser &);
    virtual ~FilterUser();
    
    void generateNumbers();
    int countPredicate(std::function<bool(int)>) const;
};
