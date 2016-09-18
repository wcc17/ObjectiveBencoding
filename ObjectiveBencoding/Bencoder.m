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
    }
    
    return nil;
}

+ (NSString *) encodeString:(NSString *) stringToEncode {
    NSLog(@"String to encode: %@", stringToEncode);
    
//    Byte strings are encoded as follows: <string length encoded in base ten ASCII>:<string data>
//    Note that there is no constant beginning delimiter, and no ending delimiter.
//    
//    Example: 4:spam represents the string "spam"
//    Example: 0: represents the empty string ""   TODO: this will be a special case in decoding these
    
    NSInteger stringLength = stringToEncode.length;
    NSString *encodedString = [NSString stringWithFormat:@"%tu:%@", stringLength, stringToEncode];
    
    return encodedString;
}

+ (NSString *) encodeInteger:(NSNumber *) integerToEncode {
    NSLog(@"Integer to encode: %@", integerToEncode);
    
//    Integers are encoded as follows: i<integer encoded in base ten ASCII>e
//    The initial i and trailing e are beginning and ending delimiters.
//    
//    Example: i3e represents the integer "3"
//    Example: i-3e represents the integer "-3"
//    i-0e is invalid. All encodings with a leading zero, such as i03e, are invalid, other than i0e, which of course corresponds to the integer "0".
//    
//    NOTE: The maximum number of bit of this integer is unspecified, but to handle it as a signed 64bit integer is mandatory to handle "large files" aka .torrent for more that 4Gbyte.
    
    NSString *encodedInteger;
    encodedInteger = [NSString stringWithFormat:@"i%@e", [integerToEncode stringValue]];
    
    return encodedInteger;
}

@end
