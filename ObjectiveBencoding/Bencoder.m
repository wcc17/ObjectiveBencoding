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
         return [self encodeString:(NSString *)objectToEncode];
    } else if([objectToEncode isKindOfClass:[NSNumber class]]) {
        return [self encodeInteger:(NSNumber *)objectToEncode];
    } else if([objectToEncode isKindOfClass:[NSMutableArray class]]) {
        return [self encodeList:(NSMutableArray *)objectToEncode];
    } else if([objectToEncode isKindOfClass:[NSDictionary class]]) {
        return [self encodeDictionary:(NSDictionary *)objectToEncode];
    }
    
    return nil;
}

+ (NSString *) encodeString:(NSString *) stringToEncode {
    NSInteger stringLength = stringToEncode.length;
    NSString *encodedString = [NSString stringWithFormat:@"%tu:%@", stringLength, stringToEncode];
    
    return encodedString;
}

+ (NSString *) encodeInteger:(NSNumber *) integerToEncode {
    NSString *encodedInteger;
    encodedInteger = [NSString stringWithFormat:@"i%@e", [integerToEncode stringValue]];
    
    return encodedInteger;
}

+ (NSString *) encodeList:(NSArray *) arrayToEncode {
    NSString *encodedList = @"l";
    
    for(NSObject *objectToEncode in arrayToEncode) {
        encodedList = [encodedList stringByAppendingString: [self encode:objectToEncode]];
    }
    
    encodedList = [encodedList stringByAppendingString: @"e"];
    
    return encodedList;
}

//TODO: need to be able to get multiple values for one key
+ (NSString *) encodeDictionary:(NSDictionary *) dictionaryToEncode {
    //TODO: keys must be strings
    
    NSString *encodedDictionary = @"d";
//    NSArray *sortedKeys = [self getBinarySortedKeys:[dictionaryToEncode allKeys]];
    
    for(NSString *key in [dictionaryToEncode allKeys]) {
        encodedDictionary = [encodedDictionary stringByAppendingString: [self encode:key]];
        encodedDictionary = [encodedDictionary stringByAppendingString: [self encode:[dictionaryToEncode valueForKey:key]]];
    }
    
    encodedDictionary = [encodedDictionary stringByAppendingString: @"e"];
    
    return encodedDictionary;
}

//TODO: this isn't working properly yet. need to be sorting strings by their binary representation, not alphanumerically
//+ (NSArray *) getBinarySortedKeys:(NSArray *) keysToSort {
//    const char *cStyleKeys[(int) [keysToSort count]];
//    
//    for(int i = 0; i < [keysToSort count]; i++) {
//        NSString *key = keysToSort[i];
//        cStyleKeys[i] = [key UTF8String];
//    }
//    
//    //sort the keys
//    qsort(cStyleKeys, [keysToSort count], sizeof(cStyleKeys[0]), cmpfunc);
//    
//    NSMutableArray *sortedKeys = [[NSMutableArray alloc] init];
//    for(int i = 0; i < [keysToSort count]; i++) {
//        NSString * str = @(cStyleKeys[i]);
//        sortedKeys[i] = str;
//    }
//    
//    return sortedKeys;
//}
//
//int cmpfunc(const void *a, const void *b)
//{
//    return ( *(int*)a - *(int*)b );
//}

@end
