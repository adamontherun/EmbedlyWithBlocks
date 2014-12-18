//
//  ExtractTests.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/15/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "EmbedlyExtract.h"
#import "TestJSONGenerator.h"

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
    NSDictionary *json = [TestJSONGenerator JSONDictionaryFromResourceFile:@"Extract_valid"];
    EmbedlyExtract *extract = [[EmbedlyExtract alloc] initWithDictionary:json];
    XCTAssertNotNil(extract, @"");
    XCTAssertEqualObjects(extract.content, @"Random Content");
    XCTAssertEqualObjects(extract.original_url, @"http://slate.com");
}

- (void)test_initWithDictionary_nullJsonValue_setsAttributeToNil
{
    NSDictionary *json = [TestJSONGenerator JSONDictionaryFromResourceFile:@"Extract_null_json_value"];
    EmbedlyExtract *extract = [[EmbedlyExtract alloc]initWithDictionary:json];
    XCTAssertNotNil(extract);
    XCTAssertEqualObjects(extract.provider_url, nil);
    XCTAssertEqualObjects(extract.original_url, @"http://test.com");
}

@end
