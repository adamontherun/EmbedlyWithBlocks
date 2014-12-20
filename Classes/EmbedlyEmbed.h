//
//  EmbedlyEmbed.h
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/16/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Dictionary keys for optional Argument that can be included when querying the Embedly Extract API. Check details for each http://embed.ly/docs/api/embed/arguments - note only pass optional arguements here, API key and URLs are handled seperately */
extern NSString * const kEmbedAttributeMaxWidth;
extern NSString * const kEmbedAttributeMaxHeight;
extern NSString * const kEmbedAttributeWidth;
extern NSString * const kEmbedAttributeFormat;
extern NSString * const kEmbedAttributeCallback;
extern NSString * const kEmbedAttributeWmode;
extern NSString * const kEmbedAttributeAllowscripts;
extern NSString * const kEmbedAttributeNostyle;
extern NSString * const kEmbedAttributeAutoPlay;
extern NSString * const kEmbedAttributeVideosrc;
extern NSString * const kEmbedAttributeWords;
extern NSString * const kEmbedAttributeChars;
extern NSString * const kEmbedAttributeSecure;

@interface EmbedlyEmbed : NSObject

-(EmbedlyEmbed *)initWithDictionary:(NSDictionary *)dictionary;

@property (readonly, nonatomic) NSString     *cache_age;
//* extractDescription is the "description" attribute from the embedly api */
@property (readonly, nonatomic) NSString     *embedDescription;
@property (readonly, nonatomic) NSString     *version;
@property (readonly, nonatomic) NSString     *title;
@property (readonly, nonatomic) NSString     *author_name;
@property (readonly, nonatomic) NSString     *author_url;
@property (readonly, nonatomic) NSString     *provider_name;
@property (readonly, nonatomic) NSString     *provider_url;
@property (readonly, nonatomic) NSString     *thumbnail_url;
@property (readonly, nonatomic) NSString     *thumbnail_width;
@property (readonly, nonatomic) NSString     *thumbnail_height;
@property (readonly, nonatomic) NSString     *url;

//* The properties below describe an optional media type which can be a photo, video, link, or rich media type. Note that this is structured differently from the Media Type from the Extract API, which returns a dictionary for a Media Type. Each media type returns a different subset of the properties below. See http://embed.ly/docs/api/embed/endpoints/1/oembed#the-photo-type for details */
@property (readonly, nonatomic) NSString     *type;
@property (readonly, nonatomic) NSString     *width;
@property (readonly, nonatomic) NSString     *height;
@property (readonly, nonatomic) NSString     *html;

@end
