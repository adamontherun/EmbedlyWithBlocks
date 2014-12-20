//
//  Extract.h
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/10/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Dictionary keys for optional Argument  that can be included when querying the Embedly Extract API. Check details for each http://embed.ly/docs/api/extract/arguments - note Only pass optional arguements here, API key and URLs are handled seperately */
extern NSString * const kExtractAttributeMaxWidth;
extern NSString * const kExtractAttributeMaxHeight;
extern NSString * const kExtractAttributeWidth;
extern NSString * const kExtractAttributeFormat;
extern NSString * const kExtractAttributeCallback;
extern NSString * const kExtractAttributeWmode;
extern NSString * const kExtractAttributeAllowscripts;
extern NSString * const kExtractAttributeNostyle;
extern NSString * const kExtractAttributeAutoPlay;
extern NSString * const kExtractAttributeVideosrc;
extern NSString * const kExtractAttributeWords;
extern NSString * const kExtractAttributeChars;
extern NSString * const kExtractAttributeFrame;
extern NSString * const kExtractAttributeSecure;

@interface EmbedlyExtract : NSObject

/** Creates an Extract object from the json retuned from querying the Embedly Extract API */
-(EmbedlyExtract *)initWithDictionary:(NSDictionary *)dictionary;

@property (readonly, nonatomic) NSString     *content;
@property (readonly, nonatomic) NSString     *original_url;
@property (readonly, nonatomic) NSString     *url;
@property (readonly, nonatomic) NSString     *type;
@property (readonly, nonatomic) NSString     *cache_age;
@property (readonly, nonatomic) BOOL         safe;
@property (readonly, nonatomic) NSString     *safe_type;
@property (readonly, nonatomic) NSString     *safe_message;
@property (readonly, nonatomic) NSString     *provider_name;
@property (readonly, nonatomic) NSString     *provider_url;
@property (readonly, nonatomic) NSString     *provider_display;
@property (readonly, nonatomic) NSString     *favicon_url;
@property (readonly, nonatomic) NSDictionary *favicon_colors;
@property (readonly, nonatomic) NSString     *title;
@property (readonly, nonatomic) NSArray      *authors;

//* The media property is an optional dictionary that can contain a photo, video, or rich media type. Each type has different attributes, see http://embed.ly/docs/api/extract/endpoints/1/extract#media for details
@property (readonly, nonatomic) NSDictionary *media;
@property (readonly, nonatomic) NSString     *published;
@property (readonly, nonatomic) NSString     *offset;
//* The extractDescription property is the description attribute from the embedly api */
@property (readonly, nonatomic) NSString     *extractDescription;
@property (readonly, nonatomic) NSString     *lead;
@property (readonly, nonatomic) NSArray      *keywords;
@property (readonly, nonatomic) NSArray      *entities;
@property (readonly, nonatomic) NSArray      *related;
@property (readonly, nonatomic) NSArray      *images;

@end
