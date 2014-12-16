//
//  EmbedlyClient.h
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/11/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

// This class is a wrapper for the Embedly APIs http://embed.ly/docs/api

#import <Foundation/Foundation.h>
#import "EmbedlyExtract.h"

/** Callback signature for when an Embedly Extract API query for one URL completes. */
typedef void(^EmbedlyClientFetchExtractCompletionHandler)(EmbedlyExtract *extract, NSError *error);

/** Callback signature for when an Embedly Extract API query for  multiple URLs completes. */
typedef void(^EmbedlyClientFetchExtractsCompletionHandler)(NSArray *extracts, NSError *error);

/**  Client to communicate with the embed.ly APIs  */
@interface EmbedlyClient : NSObject

+ (EmbedlyClient *)sharedClient;


/** Query the Embedly Extract API for a single URL with Attribute options. Method returns a fully hydrated EmbedlyExtract object. Dictionary keys for possible Attribute values are in the EmbedlyExtract.h file. requestedURL and completion are required, attributes are optional */
- (void)fetchExtractForURL:(NSString *)requestedURL attributes:(NSDictionary *)attributes completion:(EmbedlyClientFetchExtractCompletionHandler)completion;

/** Query the Embedly Extract API for multiple URLs */
- (void)fetchExtractsForURLs:(NSArray *)requestedURLs attributes:(NSDictionary *)attributes completion:(EmbedlyClientFetchExtractsCompletionHandler)completion;

/** Register for a key at http://embed.ly */
@property (nonatomic) NSString *APIKey;

@end
