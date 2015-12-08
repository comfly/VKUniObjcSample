//
//  SampleDescriptor.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "SampleDescriptor.h"

@implementation SampleDescriptor

@synthesize title = _title;
@synthesize storyboardID = _storyboardID;

+ (instancetype)descriptorWithTitle:(NSString *)title storyboardID:(NSString *)storyboardID {
    SampleDescriptor *result = [[self alloc] init];
    if (result) {
        result->_title = [title copy];
        result->_storyboardID = [storyboardID copy];
    }
    
    return result;
}

@end
