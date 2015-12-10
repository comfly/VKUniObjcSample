//
//  ObjCCollectionsDataSource.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CollectionsSampleItem;
@class Person;

@interface ObjCCollectionsDataSource : NSObject

@property (nonatomic, readonly) NSUInteger numberOfSections;
- (CollectionsSampleItem *)objectForKeyedSubscript:(NSIndexPath *)indexPath;
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;

- (NSIndexSet *)testWeakControl;

- (BOOL)grabNextMin;

@end
