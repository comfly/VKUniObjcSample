//
//  SampleDescriptor.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol SampleDescriptor <NSObject>

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *storyboardID;

@end

@interface SampleDescriptor : NSObject <SampleDescriptor>

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)descriptorWithTitle:(NSString *)title storyboardID:(NSString *)storyboardID;

@end

NS_ASSUME_NONNULL_END