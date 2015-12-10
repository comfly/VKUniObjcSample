//
// Created by Dmitry Zakharov on 10/12/15.
// Copyright (c) 2015 VKontakte. All rights reserved.
//

#import "Person+Presentation.h"


@implementation Person (Presentation)

- (NSString *)salaryString {
    return [NSNumberFormatter localizedStringFromNumber:@(self.salary) numberStyle:NSNumberFormatterCurrencyStyle];
}

@end