//
//  ObjCCollectionsDataSource.m
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjCCollectionsDataSource.h"
#import "GenericCollectionsDataSource.h"
#import "CollectionOperationsSample.h"
#import "WeakCollectionsSample.h"


@interface ObjCCollectionsDataSource ()

@property (nonatomic, readonly) NSArray<id<GenericCollectionsDataSource>> *samples;

@end

@implementation ObjCCollectionsDataSource

typedef NS_ENUM(NSUInteger, ObjCCollectionsSections) {
    ObjCCollectionsOperationsSection,
    ObjCCollectionsWeakSection,
    ObjCCollectionsCoreFoundationSection,
    
    SectionsCount
};

- (instancetype)init {
    self = [super init];
    if (self) {
        _samples = @[
            [[CollectionOperationsSample alloc] init],
            [[WeakCollectionsSample alloc] init],
        ];
    }
    
    return self;
}

- (CollectionsSampleItem *)objectForKeyedSubscript:(NSIndexPath *)indexPath {
    return self.samples[indexPath.section][indexPath.row];
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section {
    return self.samples[section].count;
}

- (NSUInteger)numberOfSections {
    return self.samples.count;
}

- (NSUInteger)testWeakControl {
    [(WeakCollectionsSample *)self.samples[ObjCCollectionsWeakSection] nullifyFirstItem];
    return ObjCCollectionsWeakSection;
}

@end
