//
//  EmbedlyClientErrorGenerator.h
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/14/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmbedlyClientErrorGenerator : NSObject

+ (NSError *)generateErrorForURLResponse:(NSHTTPURLResponse *)URLResponse;

@end
