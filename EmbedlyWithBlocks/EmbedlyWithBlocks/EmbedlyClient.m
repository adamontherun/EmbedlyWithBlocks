//
//  EmbedlyClient.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/11/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import "EmbedlyClient.h"
#import "EmbedlyClientErrorGenerator.h"
#import "EmbedlyExtract.h"

/** Callback signature for when the callEmbedlyService method is called. If one URL is passed into the service the Dictionary will return, if multiple URLs are passed in, an array will be returned */
typedef void(^CallEmbedlyServiceCompletionHandler)(NSDictionary *jsonObject, NSArray *jsonObjects, NSError *error);

static NSString * const kEmbedlyURL = @"http://api.embed.ly/1/";
static NSString * const kEmbedlyExtractAPI = @"extract";

@interface EmbedlyClient ()

@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfig;
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation EmbedlyClient

+ (EmbedlyClient *)sharedClient {
    static EmbedlyClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc]init];
    });
    return sharedClient;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:self.sessionConfig];
    }
    return self;
}

- (void) callEmbedlyService:(NSString *)APIName URLs:(NSArray *)URLs arguments:(NSDictionary *)arguments completionHandler:(CallEmbedlyServiceCompletionHandler)completionHandler
{
    NSURL *embedlyURL = [self generateURLforAPIName:(NSString *)APIName URLs:(NSArray *)URLs arguments:(NSDictionary *)arguments];
    NSURLRequest *request = [NSURLRequest requestWithURL:embedlyURL];
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                     if (error)
                                                     {
                                                         completionHandler(nil, nil, error);
                                                     }
                                                     else
                                                     {
                                                         id jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                                                           options:0
                                                                                                             error:NULL];
                                                         NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                                                         if (httpResp.statusCode == 200)
                                                         {
                                                             if ([jsonResponse isKindOfClass:[NSDictionary class]])
                                                             {
                                                                 completionHandler(jsonResponse, nil, nil);
                                                             }
                                                             else if ([jsonResponse isKindOfClass:[NSArray class]])
                                                             {
                                                                 completionHandler(nil, jsonResponse, nil);
                                                             }
                                                             else
                                                             {
                                                                 NSError *embedlyError = [EmbedlyClientErrorGenerator generateErrorForURLResponse:httpResp];
                                                                 completionHandler(nil, nil, embedlyError);
                                                             }
                                                         }
                                                     }
                                                 }];
    [task resume];
}

- (void)fetchExtractForURL:(NSString *)requestedURL attributes:(NSDictionary *)attributes completion:(EmbedlyClientFetchExtractCompletionHandler)completion {

    NSParameterAssert(requestedURL.length > 0);
    NSParameterAssert(completion != nil);
    
    [self callEmbedlyService:kEmbedlyExtractAPI URLs:@[requestedURL] arguments:attributes completionHandler:^(NSDictionary *jsonObject, NSArray *jsonObjects, NSError *error) {
        EmbedlyExtract *extract = [[EmbedlyExtract alloc]initWithDictionary:jsonObject];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                completion(extract, nil);
                
            } else {
                completion(nil, error);
            }
        });
    }];
}

- (void)fetchExtractsForURLs:(NSArray *)requestedURLs attributes:(NSDictionary *)attributes completion:(EmbedlyClientFetchExtractsCompletionHandler)completion
{
    NSParameterAssert(requestedURLs.count > 0);
    NSParameterAssert(completion != nil);
    
    [self callEmbedlyService:kEmbedlyExtractAPI URLs:requestedURLs arguments:attributes completionHandler:^(NSDictionary *jsonObject, NSArray *jsonObjects, NSError *error) {
        NSMutableArray *extracts = [NSMutableArray new];
        
        for (NSDictionary *jsonObject in jsonObjects) {
            EmbedlyExtract *extract = [[EmbedlyExtract alloc]initWithDictionary:jsonObject];
            NSLog(@"Extract: %@", extract);
            [extracts addObject:extract];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                completion(extracts, nil);
                
            } else {
                completion(nil, error);
            }
        });
    }];
}

- (NSURL *)generateURLforAPIName:(NSString *)APIName URLs:(NSArray *)URLs arguments:(NSDictionary *)arguments
{
    NSAssert(self.APIKey.length > 0, @"You must provide your application's Embedly API key.");
    
    NSString *urlQuery = [self createQueryStringFromURLsArray:URLs];
    NSString *argQuery = [self createQueryStringFromArgumentDictionary:arguments];
    NSString *embedlyURLString = [NSString stringWithFormat:@"%@%@?key=%@%@%@", kEmbedlyURL, APIName, self.APIKey, urlQuery, argQuery];
    NSString *escapedEmbedlyURLString = [self escapeURLString:embedlyURLString];
    NSURL *embedlyURL = [NSURL URLWithString:escapedEmbedlyURLString];
    return embedlyURL;
}

- (NSString *)createQueryStringFromURLsArray: (NSArray *)URLs
{
    NSMutableString *queryStringURLs = [[NSMutableString alloc]init];
    if (URLs.count == 1)
    {
        [queryStringURLs appendString:@"&url="];
    } else if (URLs.count > 1)
    {
        [queryStringURLs appendString:@"&urls="];
    } else {
        NSAssert(URLs.count == 0, @"URL count should always be greater then zero, why isn't it?");
    }
  
    // @Adam - review this again
    for (int i = 0; i < URLs.count; i++)
    {
        [queryStringURLs appendString:URLs[i]];
        if (i < URLs.count - 1)
            [queryStringURLs appendString:@","];
    }
    return queryStringURLs;
}

- (NSString *)createQueryStringFromArgumentDictionary:(NSDictionary *)arguments
{
    NSMutableString *queryStringArguments = [[NSMutableString alloc]init];
    [arguments enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *currentSegment = [NSString stringWithFormat:@"&%@=%@", key, obj];
        [queryStringArguments appendString:currentSegment];
    }];
    return queryStringArguments;
}

- (NSString *)escapeURLString:(NSString *)URL
{
    NSString *escapedURL = [URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return escapedURL;
}

@end
