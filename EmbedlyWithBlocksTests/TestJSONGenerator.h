//
//  TestJSONGenerator.h
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/17/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestJSONGenerator : NSObject
+ (NSDictionary *)JSONDictionaryFromResourceFile:(NSString *)resourceFileName;
@end
