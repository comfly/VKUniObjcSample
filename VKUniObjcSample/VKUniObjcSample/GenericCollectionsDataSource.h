//
//  GenericCollectionsDataSource.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CollectionsSampleItem;

@protocol GenericCollectionsDataSource <NSObject>

@property (nonatomic, readonly) NSUInteger count;
- (CollectionsSampleItem *)objectAtIndexedSubscript:(NSUInteger)index;

@end