//
//  CollectionsSampleItem.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 09/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CollectionsSampleItem : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *details;

+ (instancetype)sampleItemWithTitle:(NSString *)title details:(NSString *)details;

@end
