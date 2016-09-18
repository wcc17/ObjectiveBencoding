//
//  Bencoder.h
//  Bencoder
//
//  Created by Christian Curry on 9/18/16.
//  Copyright © 2016 Christian Curry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bencoder : NSObject

+ (NSString *) encode:(NSObject *) objectToEncode;
+ (NSString *) encodeString:(NSString *) stringToEncode;
+ (NSString *) encodeInteger:(NSNumber *) integerToEncode;

@end
