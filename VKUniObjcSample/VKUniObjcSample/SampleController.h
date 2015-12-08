//
//  SampleController.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//


NS_ASSUME_NONNULL_BEGIN

@protocol SampleDescriptor;

@protocol SampleController <NSObject>

+ (id<SampleDescriptor>)descriptor;

@end

NS_ASSUME_NONNULL_END