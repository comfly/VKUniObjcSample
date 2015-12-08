//
//  FilterUser.cpp
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#include "FilterUser.hpp"
#include "FilterCounter.h"

struct IMPL {
    FilterCounter *_counter;
    
    IMPL() : _counter([[FilterCounter alloc] initWithNumbersCount:10000000]) { }
};

FilterUser::FilterUser() : _impl(new IMPL()) { }

FilterUser::FilterUser(const FilterUser &_) : FilterUser() { }

FilterUser::~FilterUser() { delete _impl; }

void FilterUser::generateNumbers() {
    [_impl->_counter generate];
}

int FilterUser::countPredicate(std::function<bool(int)> predicate) {
    return [_impl->_counter countWithPredicate:^(int value) {
            return static_cast<BOOL>(predicate(value));
    }];
}
