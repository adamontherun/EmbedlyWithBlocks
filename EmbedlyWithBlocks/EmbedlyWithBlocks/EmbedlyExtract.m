//
//  Extract.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/10/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import "EmbedlyExtract.h"

#define IS_NOT_NULL(__OBJECT) [[NSNull null] isEqual:__OBJECT] == NO

// constants for creating Extract properties
static NSString * const kExtractContent          = @"content";
static NSString * const kExtractOriginalURL      = @"original_url";
static NSString * const kExtractURL              = @"url";
static NSString * const kExtractType             = @"type";
static NSString * const kExtractCache_age        = @"cache_age";
static NSString * const kExtractSafe             = @"safe";
static NSString * const kExtractSafe_type        = @"safe_type";
static NSString * const kExtractSafe_message     = @"safe_message";
static NSString * const kExtractProvider_name    = @"provider_name";
static NSString * const kExtractProvider_url     = @"provider_url";
static NSString * const kExtractProvider_display = @"provider_display";
static NSString * const kExtractFavicon_url      = @"favicon_url";
static NSString * const kExtractFavicon_colors   = @"favicon_colors";
static NSString * const kExtractTitle            = @"title";
static NSString * const kExtractAuthors          = @"authors";
static NSString * const kExtractMedia            = @"media";
static NSString * const kExtractPublished        = @"published";
static NSString * const kExtractOffset           = @"offset";
static NSString * const kExtractDescription      = @"description";
static NSString * const kExtractLead             = @"lead";
static NSString * const kExtractKeywords         = @"keywords";
static NSString * const kExtractEntities         = @"entities";
static NSString * const kExtractRelated          = @"related";
static NSString * const kExtractImages           = @"images";

// constants for creating Extract attribute dictionaries
NSString * const kExtractAttributeMaxWidth     = @"maxwidth";
NSString * const kExtractAttributeMaxHeight    = @"maxheight";
NSString * const kExtractAttributeWidth        = @"width";
NSString * const kExtractAttributeFormat       = @"format";
NSString * const kExtractAttributeCallback     = @"callback";
NSString * const kExtractAttributeWmode        = @"wmode";
NSString * const kExtractAttributeAllowscripts = @"allowscripts";
NSString * const kExtractAttributeNostyle      = @"nostyle";
NSString * const kExtractAttributeAutoPlay     = @"autoplay";
NSString * const kExtractAttributeVideosrc     = @"videosrc";
NSString * const kExtractAttributeWords        = @"words";
NSString * const kExtractAttributeChars        = @"chars";
NSString * const kExtractAttributeFrame        = @"frame";
NSString * const kExtractAttributeSecure       = @"secure";

@interface EmbedlyExtract ()

@property (readwrite, nonatomic) NSString     *content;
@property (readwrite, nonatomic) NSString     *original_url;
@property (readwrite, nonatomic) NSString     *url;
@property (readwrite, nonatomic) NSString     *type;
@property (readwrite, nonatomic) NSString     *cache_age;
@property (readwrite, nonatomic) BOOL         safe;
@property (readwrite, nonatomic) NSString     *safe_type;
@property (readwrite, nonatomic) NSString     *safe_message;
@property (readwrite, nonatomic) NSString     *provider_name;
@property (readwrite, nonatomic) NSString     *provider_url;
@property (readwrite, nonatomic) NSString     *provider_display;
@property (readwrite, nonatomic) NSString     *favicon_url;
@property (readwrite, nonatomic) NSDictionary *favicon_colors;
@property (readwrite, nonatomic) NSString     *title;
@property (readwrite, nonatomic) NSArray      *authors;
@property (readwrite, nonatomic) NSDictionary *media;
@property (readwrite, nonatomic) NSString     *published;
@property (readwrite, nonatomic) NSString     *offset;
@property (readwrite, nonatomic) NSString     *extractDescription;
@property (readwrite, nonatomic) NSString     *lead;
@property (readwrite, nonatomic) NSArray      *keywords;
@property (readwrite, nonatomic) NSArray      *entities;
@property (readwrite, nonatomic) NSArray      *related;
@property (readwrite, nonatomic) NSArray      *images;
@end

@implementation EmbedlyExtract

-(EmbedlyExtract *)initWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary)
        return nil;
    
    self = [super init];
    if (self)
    {
        if (IS_NOT_NULL([dictionary valueForKey:kExtractContent]))          self.content = [dictionary valueForKey:kExtractContent];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractOriginalURL]))      self.original_url = [dictionary valueForKey:kExtractOriginalURL];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractURL]))              self.url = [dictionary valueForKey:kExtractURL];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractType]))             self.type = [dictionary valueForKey:kExtractType];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractCache_age]))        self.cache_age = [[dictionary valueForKey:kExtractCache_age] stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractSafe]))             self.safe = [[dictionary valueForKey:kExtractSafe] boolValue];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractSafe_type]))        self.safe_type = [dictionary valueForKey:kExtractSafe_type];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractSafe_message]))     self.safe_message = [dictionary valueForKey:kExtractSafe_message];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractProvider_name]))    self.provider_name = [dictionary valueForKey:kExtractProvider_name];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractProvider_url]))     self.provider_url = [dictionary valueForKey:kExtractProvider_url];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractProvider_display])) self.provider_display = [dictionary valueForKey:kExtractProvider_display];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractFavicon_url]))      self.favicon_url = [dictionary valueForKey:kExtractFavicon_url];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractFavicon_colors]))   self.favicon_colors = [dictionary valueForKey:kExtractFavicon_colors];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractTitle]))            self.title = [dictionary valueForKey:kExtractTitle];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractAuthors]))          self.authors = [dictionary valueForKey:kExtractAuthors];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractMedia]))            self.media = [dictionary valueForKey:kExtractMedia];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractPublished]))        self.published = [[dictionary valueForKey:kExtractPublished] stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractOffset]))           self.offset = [[dictionary valueForKey:kExtractOffset]stringValue];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractDescription]))      self.extractDescription = [dictionary valueForKey:kExtractDescription];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractLead]))             self.lead = [dictionary valueForKey:kExtractLead];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractKeywords]))         self.keywords = [dictionary valueForKey:kExtractKeywords];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractEntities]))         self.entities = [dictionary valueForKey:kExtractEntities];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractRelated]))          self.related = [dictionary valueForKey:kExtractRelated];
        if (IS_NOT_NULL([dictionary valueForKey:kExtractImages]))           self.images = [dictionary valueForKey:kExtractImages];
    }
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"Extract's description: \n\n content: %@\n\noriginal_url: %@\n\nurl: %@\n\ntype: %@\n\ncache_age: %@\n\nsafe: %i\n\nsafe_type: %@\n\nsafe_message: %@\n\nprovider_name: %@\n\nprovider_url: %@\n\nprovider_display: %@\n\nfavicon_url: %@\n\nfavicon_colors: %@\n\ntitle: %@\n\nauthors: %@\n\nmedia: %@\n\npublished: %@\n\noffset: %@\n\nextractDescription: %@\n\nlead: %@\n\nkeywords: %@\n\nentities: %@\n\nrelated: %@\n\nimages: %@", self.content, self.original_url, self.url, self.type, self.cache_age, self.safe, self.safe_type, self.safe_message, self.provider_name, self.provider_url, self.provider_display, self.favicon_url, self.favicon_colors, self.title, self.authors, self.media, self.published, self.offset, self.extractDescription, self.lead, self.keywords, self.entities, self.related, self.images];
}

@end
