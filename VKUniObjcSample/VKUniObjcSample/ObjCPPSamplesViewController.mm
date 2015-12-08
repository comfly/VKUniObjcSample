//
//  ObjCPPSamplesControllerViewController.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import "ObjCPPSamplesViewController.h"
#import "SampleDescriptor.h"

#import "OrganizationObjc.h"
#import "PersonObjc.h"
#import "PersonCpp.hpp"
#import "Wrapper.h"

#include <memory>
#import "Utilities.h"


@interface ObjCPPSamplesViewController ()

@property (nonatomic) OrganizationObjc *organization;

@end

@implementation ObjCPPSamplesViewController

+ (id<SampleDescriptor>)descriptor {
    return [SampleDescriptor descriptorWithTitle:@"Obj-C++ Sample" storyboardID:NSStringFromClass(self)];
}

- (PersonObjc *)samplePersonObjc {
    return [PersonObjc personWithName:@"Objc Person" DOB:[NSDate dateWithTimeIntervalSinceReferenceDate:0] hobby:"Programming"];
}

- (ObjCPPSamples::PersonCpp *)samplePersonCpp {
    OrganizationObjc *organization = [OrganizationObjc organizationWithName:"The Company"
                                                                    estDate:[NSDate date]
                                                                  employees:std::vector<PersonObjc *>(0)
                                                                     owners:nil];

    auto randomDate = []() {
        return [NSDate dateWithTimeIntervalSince1970:arc4random_uniform(60 * 60 * 24 * 365 * 40)];
    };
    
    PersonObjc *child1 = [PersonObjc personWithName:@"Child 1"
                                                DOB:randomDate()
                                              hobby:"Code strange things " + std::to_string(NextRandom(10))];
    
    PersonObjc *child2 = [PersonObjc personWithName:@"Child 2" DOB:randomDate() hobby:"Biking" + std::to_string(NextRandom(10))];

    auto person = new ObjCPPSamples::PersonCpp(
            @"Student 1",
            randomDate(),
            @[ child1, child2 ],
            { organization }
    );
    
    return person;
}

- (IBAction)createOrganizationTapped {
    NSDate *date = [[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian] dateWithEra:0 year:2015 month:11 day:21 hour:14 minute:00 second:00 nanosecond:00];
    self.organization = [OrganizationObjc organizationWithName:"VK University"
                                                       estDate:date
                                                     employees:{ [self samplePersonObjc] }
                                                        owners:[self simpleOwners]]; // [self wrappedOwners];
}

- (IBAction)printDataTapped {
    NSLog(@"%@", self.organization);
}

- (NSArray<NSValue *> *)simpleOwners {
    return @[ [NSValue valueWithPointer:[self samplePersonCpp]] ];
}

- (NSArray<Wrapper *> *)wrappedOwners {
    return @[ [Wrapper wrap:[self samplePersonCpp] destructor:^(const void *object) {
        delete static_cast<ObjCPPSamples::PersonCpp *>(const_cast<void *>(object));
    }] ];
}

@end
