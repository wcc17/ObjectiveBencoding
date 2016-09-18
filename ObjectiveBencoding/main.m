//
//  main.m
//  ObjectiveBencoding
//
//  Created by Christian Curry on 9/18/16.
//  Copyright © 2016 Christian Curry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bencoder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        [Bencoder encode:@"EncodeThisString"];
        [Bencoder encode:[NSNumber numberWithInt:1]];
    }
    return 0;
}
