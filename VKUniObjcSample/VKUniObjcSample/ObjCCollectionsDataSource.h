//
//  ObjCCollectionsDataSource.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CollectionsSampleItem;

@interface ObjCCollectionsDataSource : NSObject

@property (nonatomic, readonly) NSUInteger numberOfSections;
- (CollectionsSampleItem *)objectForKeyedSubscript:(NSIndexPath *)indexPath;
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;

- (NSUInteger)testWeakControl;

@end
