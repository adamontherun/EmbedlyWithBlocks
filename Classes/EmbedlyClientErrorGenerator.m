//
//  EmbedlyClientErrorGenerator.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/14/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import "EmbedlyClientErrorGenerator.h"

@implementation EmbedlyClientErrorGenerator

/** These errors map to the errors sent by Embedly as described here http://embed.ly/docs/api/extract/endpoints/1/extract#error-codes */

+ (NSError *)generateErrorForURLResponse:(NSHTTPURLResponse *)httpResp
{
    NSDictionary *userInfo = nil;
    
    switch (httpResp.statusCode)
    {
        case 400: userInfo = @
        {
        NSLocalizedDescriptionKey: NSLocalizedString(@"400 Bad Request.", nil),
        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Required “url” parameter is missing. Either “url” or “urls” parameter is reqiured.Invalid URL format. Invalid “maxheight” parameter. Invalid “maxwidth” parameter.   Invalid “urls” parameter, exceeded max count of 20.", nil)
        };  break;
            
        case 401: userInfo = @
        {
        NSLocalizedDescriptionKey: NSLocalizedString(@"401 Unauthorized.", nil),
        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Invalid key or oauth_consumer_key provided: <key>, contact: support@embed.ly. The provided key does not support this endpoint: <key>, contact: support@embed.ly. URL is private or restricted.", nil)
        };  break;
            
        case 403: userInfo = @
        {
        NSLocalizedDescriptionKey: NSLocalizedString(@"403 Forbidden.", nil),
        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"This service requires an embedly key parameter, contact: support@embed.ly or sign up: http://embed.ly/signup. Invalid IP provided: <ip>, contact: support@embed.ly.Invalid referrer provided: <referrer>, contact: support@embed.ly.", nil)
        };  break;
            
        case 404: userInfo = @
        {
        NSLocalizedDescriptionKey: NSLocalizedString(@"404 Not Found.", nil),
        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"URL Not Found, we will log this and determine if usable.", nil)
        };  break;
            
        case 500: userInfo = @
        {
        NSLocalizedDescriptionKey: NSLocalizedString(@"500 Server issues.", nil),
        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Embed.ly is having trouble with this url. Please try again or contact us, support@embed.ly.", nil)
        };  break;
            
        case 501: userInfo = @
        {
        NSLocalizedDescriptionKey: NSLocalizedString(@"501 Not implemented.", nil),
        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Not implemented for format: acceptable values are {json}.", nil)
        };  break;
            
        case 503: userInfo = @
        {
        NSLocalizedDescriptionKey: NSLocalizedString(@"503 Service Unavailable", nil),
        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"our service is down, please contact us immediately: support@embed.ly.", nil)
        };  break;
    }
    return [NSError errorWithDomain:NSCocoaErrorDomain
                               code:httpResp.statusCode
                           userInfo:userInfo];
}

@end
