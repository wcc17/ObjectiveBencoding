//
//  Bdecoder.m
//  ObjectiveBencoding
//
//  Created by Christian Curry on 9/25/16.
//  Copyright © 2016 Christian Curry. All rights reserved.
//

#import "Bdecoder.h"

@implementation Bdecoder {
    
}

+ (void) decode:(NSString *) filePathToDecode {
    NSString *path = @"~/Downloads/test.torrent";
    
//TODO: not sure if i should read it this way or not.. the data in the torrent file is weird.. so it might prefer this. not sure right now, it doesn't matter that much until I can debug anyway
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
//    NSData *buffer = nil;
//    
//    while(( buffer = [fileHandle readDataToEndOfFile])) {
//        
//    }
    
    NSData *fileData = [NSData dataWithContentsOfFile: [path stringByExpandingTildeInPath]];
    NSString *fileContents = [[NSString alloc]initWithData:fileData encoding:pTextEncoding];
    
    for(int i = 0; i < fileContents.length; i++) {
        if([fileContents characterAtIndex:i] == 'd') {
            NSLog(@"DECODE A DICTIONARY DAMMIT");
        }
    }
}

- (void) decodeInteger:(NSString *) integerToDecode {
    
}

@end
