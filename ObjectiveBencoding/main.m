//
//  main.m
//  ObjectiveBencoding
//
//  Created by Christian Curry on 9/18/16.
//  Copyright © 2016 Christian Curry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bencoder.h"
#import "Bdecoder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //test strings
        NSString *testString1 = [Bencoder encode:@"EncodeThisString"];
        NSString *testString2 = [Bencoder encode:@"Encode this string too"];
        NSString *testString3 = [Bencoder encode:@" "];
        NSString *testString4 = [Bencoder encode:@""];
        
        //test integers
        NSString *testInteger1 = [Bencoder encode:[NSNumber numberWithInt:1]];
        NSString *testInteger2 = [Bencoder encode:[NSNumber numberWithInt:0]];
        NSString *testInteger3 = [Bencoder encode:[NSNumber numberWithInt:-3]];
        NSString *testInteger4 = [Bencoder encode:[NSNumber numberWithInt:27]];
        NSString *testInteger5 = [Bencoder encode:[NSNumber numberWithLong: 382340958309458930]]; //def larger than 2147483647, to prove 64 bit int is possible
        NSString *testInteger6 = [Bencoder encode:[NSNumber numberWithInt:-0]]; //weird that this -0 is allowed so testing
        
        //test list
        NSMutableArray *testArray1 = [NSMutableArray arrayWithObjects:@"this a string", @"thisastringtoo", @"", @" ", @"more string!", nil];
        NSMutableArray *testArray2 = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:34], [NSNumber numberWithInt:3495874], [NSNumber numberWithInt:-278],
                                                                    [NSNumber numberWithInt:0], [NSNumber numberWithInt:2984], [NSNumber numberWithInt:-0],
                                                                    [NSNumber numberWithLong:382340958309458930], nil];
        NSMutableArray *testArray3 = [NSMutableArray arrayWithObjects:@"this is a string", [NSNumber numberWithInt:1], nil];
        NSMutableArray *testArray4 = [NSMutableArray arrayWithObjects:@"this is a string", testArray3, [NSNumber numberWithInt:-27], nil];
        
        //test dictionary
        NSDictionary *testDictionary1 = @{
                                          @"akey" : [NSNumber numberWithInt:0],
                                          @"dkey" : [NSNumber numberWithLong:382340958309458930],
                                          @"ckey" : [NSNumber numberWithInt:278],
                                          @"fkey" : [NSNumber numberWithInt:-28],
                                          };
        NSDictionary *testDictionary2 = @{
                                          @"zkey" : @"this is a string",
                                          @"qkey" : @"thisisastringtoo",
                                          @"rkey" : @"",
                                          @"ykey" : @" ",
                                          };
        NSDictionary *testDictionary3 = @{
                                           @"mkey" : @"woo string",
                                           @"nkey" : [NSNumber numberWithInt:27],
                                           @"okey" : testArray1,
                                           @"pkey" : testDictionary2
                                           };
        NSDictionary *testDictionary4 = @{
                                          @"spam" : @"eggs",
                                          @"cow" : @"moo"
                                          };
        
        NSLog(@" ");
        
        //print encoded strings
        NSLog(@"Encoded string, no spaces: %@", testString1);
        NSLog(@"Encoded string with spaces: %@", testString2);
        NSLog(@"Encoded string only a space: %@", testString3);
        NSLog(@"Encoded empty string: %@", testString4);
        
        NSLog(@" ");
        
        //print encoded integers
        NSLog(@"Encoded normal integer: %@", testInteger1);
        NSLog(@"Encoded zero: %@", testInteger2);
        NSLog(@"Encoded negative number: %@", testInteger3);
        NSLog(@"Encoded integer with more than 1 digit: %@", testInteger4);
        NSLog(@"Encoded integer greater than 32 bits: %@", testInteger5);
        NSLog(@"Encoded negative zero: %@", testInteger6);
        
        NSLog(@" ");
        
        //print encoded lists
        NSLog(@"Encoded list with strings: %@", [Bencoder encode:testArray1]);
        NSLog(@"Encoded list with integers: %@", [Bencoder encode:testArray2]);
        NSLog(@"Encoded list with strings and integers: %@", [Bencoder encode:testArray3]);
        NSLog(@"Encoded list with string, integers, and a list: %@", [Bencoder encode:testArray4]);
        
        NSLog(@" ");
        
        //print encoded dictionaries
        //TODO: need ability to have multiple values for one key!
        NSLog(@"Encoded dictionary with integers as values: %@", [Bencoder encode:testDictionary1]);
        NSLog(@"Encoded dictionary with integers as values: %@", [Bencoder encode:testDictionary2]);
        NSLog(@"Encoded dictionary with integers as values: %@", [Bencoder encode:testDictionary3]);
        NSLog(@"Encoded dictionary with integers as values: %@", [Bencoder encode:testDictionary4]);
        
        
        
        //decoding testing
        [Bdecoder decode:nil];
    }
    return 0;
}
