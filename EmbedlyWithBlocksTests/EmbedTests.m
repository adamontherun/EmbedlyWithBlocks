//
//  EmbedTests.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/17/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmbedlyEmbed.h"
#import "TestJSONGenerator.h"

@interface EmbedTests : XCTestCase

@end

@implementation EmbedTests

- (void)test_initWithDictionary_nilDictionary_returnNil
{
    EmbedlyEmbed *embed = [[EmbedlyEmbed alloc] initWithDictionary:nil];
    XCTAssertNil(embed, @"");
}

- (void)test_initWithDictionary_validDictionary_returnValidObject
{
    NSDictionary *json = [TestJSONGenerator JSONDictionaryFromResourceFile:@"Embed_valid"];
    EmbedlyEmbed *embed = [[EmbedlyEmbed alloc] initWithDictionary:json];
    XCTAssertNotNil(embed, @"");
    XCTAssertEqualObjects(embed.title, @"Slate");
    XCTAssertEqualObjects(embed.url, @"http://slate.com");
}

- (void)test_initWithDictionary_nullJsonValue_setsAttributeToNil
{
    NSDictionary *json = [TestJSONGenerator JSONDictionaryFromResourceFile:@"Embed_null_json_value"];
    EmbedlyEmbed *embed = [[EmbedlyEmbed alloc]initWithDictionary:json];
    XCTAssertNotNil(embed, @"");
    XCTAssertEqualObjects(embed.provider_url, nil);
}


@end
