//
//  CFCollectionsSample.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericCollectionsDataSource.h"


@interface CFCollectionsSample : NSObject <GenericCollectionsDataSource>

- (BOOL)grabNextMin;

@end
