//
//  PersonObjc.h
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <string>


@interface PersonObjc : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSDate *DOB;
@property (nonatomic) std::string hobby;

+ (instancetype)personWithName:(NSString *)name DOB:(NSDate *)DOB hobby:(std::string)hobby;

@end