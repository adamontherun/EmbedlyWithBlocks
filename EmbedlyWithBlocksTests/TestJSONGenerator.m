//
//  TestJSONGenerator.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/17/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import "TestJSONGenerator.h"

@implementation TestJSONGenerator

+ (NSDictionary *)JSONDictionaryFromResourceFile:(NSString *)resourceFileName
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:resourceFileName ofType:@"json" inDirectory:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSAssert(jsonData, @"The file you specified does not exist. Try again!");
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSAssert(json, @"The JSON is invalid. Error: %@", [error debugDescription]);
    return json;
}

@end
