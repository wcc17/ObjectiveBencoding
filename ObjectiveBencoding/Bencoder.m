//
//  Bencoder.m
//  Bencoder
//
//  Created by Christian Curry on 9/18/16.
//  Copyright © 2016 Christian Curry. All rights reserved.
//

#import "Bencoder.h"

@implementation Bencoder {
    
}

+ (NSString *)encode:(NSObject *)objectToEncode {
    if([objectToEncode isKindOfClass:[NSString class]]) {
        NSLog(@"Object is a string with value: %@", objectToEncode);
        [self encodeString:((NSString *)objectToEncode)];
    } else if([objectToEncode isKindOfClass:[NSNumber class]]) {
        NSLog(@"Object is an integer with value: %@", objectToEncode);
        [self encodeInteger:((NSNumber *)objectToEncode)];
    }
    
    return nil;
}

+ (NSString *) encodeString:(NSString *) stringToEncode {
    NSLog(@"String to encode: %@", stringToEncode);
    
    return nil;
}

+ (NSString *) encodeInteger:(NSNumber *) integerToEncode {
    NSLog(@"Integer to encode: %@", integerToEncode);
    
    return nil;
}

@end
