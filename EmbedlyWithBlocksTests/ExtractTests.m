//
//  ExtractTests.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/15/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "EmbedlyExtract.h"

@interface ExtractTests : XCTestCase

@end

@implementation ExtractTests

- (void)test_initWithDictionary_nilDictionary_returnNil
{
    EmbedlyExtract *extract = [[EmbedlyExtract alloc] initWithDictionary:nil];
    XCTAssertNil(extract, @"");
}

- (void)test_initWithDictionary_validDictionary_returnValidObject
{
    NSDictionary *json = [self JSONDictionaryFromResourceFile:@"Extract_valid"];
    EmbedlyExtract *extract = [[EmbedlyExtract alloc] initWithDictionary:json];
    XCTAssertNotNil(extract, @"");
    XCTAssertEqualObjects(extract.content, @"Random Content");
    XCTAssertEqualObjects(extract.original_url, @"http://whatevs.org");
}

- (NSDictionary *)JSONDictionaryFromResourceFile:(NSString *)resourceFileName
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
