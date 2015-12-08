//
//  FilterUserWrapper.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "FilterUserWrapper.h"
#import "FilterUser.hpp"

@interface FilterUserWrapper ()

@property (nonatomic, readonly) FilterUser *filterUser;

@end

@implementation FilterUserWrapper

- (instancetype)init {
    self = [super init];
    if (self) {
        _filterUser = new FilterUser();
    }
    
    return self;
}

- (void)generateWithCompletionBlock:(void (^)(void))completionBlock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.filterUser->generateNumbers();
        dispatch_async(dispatch_get_main_queue(), completionBlock);
    });
}

- (void)countWithPredicate:(BOOL (^)(int))predicate completionBlock:(void (^)(int))completionBlock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        int result = self.filterUser->countPredicate(predicate);
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(result);
        });
    });
}

@end
