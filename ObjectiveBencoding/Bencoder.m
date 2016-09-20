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
         return [self encodeString:((NSString *)objectToEncode)];
    } else if([objectToEncode isKindOfClass:[NSNumber class]]) {
        NSLog(@"Object is an integer with value: %@", objectToEncode);
        return [self encodeInteger:((NSNumber *)objectToEncode)];
    } else if([objectToEncode isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"Object is a list [with value: %@", objectToEncode);
        return [self encodeList:((NSMutableArray *)objectToEncode)];
    }
    
    return nil;
}

+ (NSString *) encodeString:(NSString *) stringToEncode {
    NSLog(@"String to encode: %@", stringToEncode);
    
    NSInteger stringLength = stringToEncode.length;
    NSString *encodedString = [NSString stringWithFormat:@"%tu:%@", stringLength, stringToEncode];
    
    return encodedString;
}

+ (NSString *) encodeInteger:(NSNumber *) integerToEncode {
    NSLog(@"Integer to encode: %@", integerToEncode);
    
    NSString *encodedInteger;
    encodedInteger = [NSString stringWithFormat:@"i%@e", [integerToEncode stringValue]];
    
    return encodedInteger;
}

+ (NSString *) encodeList:(NSMutableArray *) mutableArrayToEncode {
    NSString *encodedList = @"l";
    
    for(NSObject *objectToEncode in mutableArrayToEncode) {
        encodedList = [encodedList stringByAppendingString: [self encode:(objectToEncode)]];
    }
    
    encodedList = [encodedList stringByAppendingString: @"e"];
    
    return encodedList;
}

@end
