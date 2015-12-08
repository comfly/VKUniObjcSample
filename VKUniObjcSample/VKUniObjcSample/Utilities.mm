//
//  Utilities.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "Utilities.h"

NSString *StringifyDate(NSDate *date) {
    return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
}

NSUInteger NextRandom(NSUInteger max) {
    return arc4random_uniform(max);
}