//
//  EmbedlyEmbed.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/16/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import "EmbedlyEmbed.h"

#define IS_NOT_NULL(__OBJECT) [[NSNull null] isEqual:__OBJECT] == NO

static NSString * const kEmbedType             = @"type";
static NSString * const kEmbedCache_age        = @"cache_age";
static NSString * const kEmbedDescription      = @"description";
static NSString * const kEmbedVersion          = @"version";
static NSString * const kEmbedTitle            = @"title";
static NSString * const kEmbedAuthor_name      = @"author_name";
static NSString * const kEmbedAuthor_url       = @"author_url";
static NSString * const kEmbedProvider_name    = @"provider_name";
static NSString * const kEmbedProvider_url     = @"provider_url";
static NSString * const kEmbedThumbnail_url    = @"thumbnail_url";
static NSString * const kEmbedThumbnail_width  = @"thumbnail_width";
static NSString * const kEmbedThumbnail_height = @"thumbnail_height";
static NSString * const kEmbedURL              = @"url";
static NSString * const kEmbedWidth            = @"width";
static NSString * const kEmbedHeight           = @"height";
static NSString * const kEmbedHTML             = @"html";

// constants for creating Embed attribute dictionaries
NSString * const kEmbedAttributeMaxWidth     = @"maxwidth";
NSString * const kEmbedAttributeMaxHeight    = @"maxheight";
NSString * const kEmbedAttributeWidth        = @"width";
NSString * const kEmbedAttributeFormat       = @"format";
NSString * const kEmbedAttributeCallback     = @"callback";
NSString * const kEmbedAttributeWmode        = @"wmode";
NSString * const kEmbedAttributeAllowscripts = @"allowscripts";
NSString * const kEmbedAttributeNostyle      = @"nostyle";
NSString * const kEmbedAttributeAutoPlay     = @"autoplay";
NSString * const kEmbedAttributeVideosrc     = @"videosrc";
NSString * const kEmbedAttributeWords        = @"words";
NSString * const kEmbedAttributeChars        = @"chars";
NSString * const kEmbedAttributeSecure       = @"secure";

@interface EmbedlyEmbed ()

@property (readwrite, nonatomic) NSString     *type;
@property (readwrite, nonatomic) NSString     *cache_age;
@property (readwrite, nonatomic) NSString     *embedDescription;
@property (readwrite, nonatomic) NSString     *version;
@property (readwrite, nonatomic) NSString     *title;
@property (readwrite, nonatomic) NSString     *author_name;
@property (readwrite, nonatomic) NSString     *author_url;
@property (readwrite, nonatomic) NSString     *provider_name;
@property (readwrite, nonatomic) NSString     *provider_url;
@property (readwrite, nonatomic) NSString     *thumbnail_url;
@property (readwrite, nonatomic) NSString     *thumbnail_width;
@property (readwrite, nonatomic) NSString     *thumbnail_height;
@property (readwrite, nonatomic) NSString     *url;
@property (readwrite, nonatomic) NSString     *width;
@property (readwrite, nonatomic) NSString     *height;
@property (readwrite, nonatomic) NSString     *html;

@end

@implementation EmbedlyEmbed

-(EmbedlyEmbed *)initWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary)
        return nil;
    
    self = [super init];
    if (self)
    {
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedType]))               self.type = [dictionary valueForKey:kEmbedType];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedCache_age]))          self.cache_age = [[dictionary valueForKey:kEmbedCache_age] stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedDescription]))        self.embedDescription = [dictionary valueForKey:kEmbedDescription];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedVersion]))            self.version = [dictionary valueForKey:kEmbedVersion];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedTitle]))              self.title = [dictionary valueForKey:kEmbedTitle];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedAuthor_name]))        self.author_name = [dictionary valueForKey:kEmbedAuthor_name];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedAuthor_url]))         self.author_url = [dictionary valueForKey:kEmbedAuthor_url];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedProvider_name]))      self.provider_name = [dictionary valueForKey:kEmbedProvider_name];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedProvider_url]))       self.provider_url = [dictionary valueForKey:kEmbedProvider_url];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedThumbnail_url]))      self.thumbnail_url = [dictionary valueForKey:kEmbedThumbnail_url];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedThumbnail_width]))    self.thumbnail_width = [[dictionary valueForKey:kEmbedThumbnail_width]stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedThumbnail_height]))   self.thumbnail_height = [[dictionary valueForKey:kEmbedThumbnail_height]stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedURL]))                self.url = [dictionary valueForKey:kEmbedURL];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedWidth]))              self.width = [[dictionary valueForKey:kEmbedWidth]stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedHeight]))             self.height = [[dictionary valueForKey:kEmbedHeight]stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kEmbedHTML]))               self.html = [self decodeHTMLString:[dictionary valueForKey:kEmbedHTML]];
        
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Embed's Description: \n\ntype: %@\n\ncache_age: %@\n\ndescription: %@\n\nversion: %@\n\ntitle: %@\n\nauthor_name: %@\n\nauthor_url: %@\n\nprovider_name: %@\n\nprovider_url: %@\n\nthumbnail_url: %@\n\nthumbnail_width: %@\n\nthumbnail_height: %@\n\nwidth: %@\n\nheight: %@\n\nhtml: %@", self.type, self.cache_age, self.embedDescription, self.version, self.title, self.author_name, self.author_url, self.provider_name, self.provider_url, self.thumbnail_url, self.thumbnail_width, self.thumbnail_height, self.width, self.height, self.html];
}

- (NSString *)decodeHTMLString: (NSString *)HTMLString
{
    return [HTMLString stringByRemovingPercentEncoding];
}

@end
