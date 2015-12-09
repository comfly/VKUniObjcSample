//
//  CollectionsSampleItem.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "CollectionsSampleItem.h"

@implementation CollectionsSampleItem

+ (instancetype)sampleItemWithTitle:(NSString *)title details:(NSString *)details {
    CollectionsSampleItem *result = [[self alloc] init];
    if (result) {
        result->_title = [title copy];
        result->_details = [details copy];
    }
    
    return result;
}

@end
