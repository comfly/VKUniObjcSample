//
//  FilterUserWrapper.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterUserWrapper : NSObject

- (void)generateWithCompletionBlock:(void (^_Nonnull)(void)) completionBlock;
- (void)countWithPredicate:(BOOL (^_Nonnull)(int))predicate completionBlock:(void (^_Nonnull)(int))completionBlock;

@end
