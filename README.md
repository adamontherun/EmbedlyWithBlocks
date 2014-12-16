EmbedlyWithBlocks
=================
EmbedlyWithBlocks is an Objective-C library for the http://embed.ly set of APIs. Embed.ly has an official iOS library https://github.com/embedly/embedly-ios this library can be used as a replacement.

EmbedlyWithBlocks is an improvement over the official library for the following reasons:
1. Use of blocks instead of delegates.
2. Query returns fully hydrated objects instead of dictionaries.
3. The keys for all Attribute options are strongly typed.

###Installation
Drag the EmbedlyWithBlocks folder into your project.
In your app delegate's - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions method, add the following:
 [EmbedlyClient sharedClient].APIKey = @"YOURAPIKEY";
 
###Usage
 In the file you want to use the library, #import "EmbedlyClient.h"
 
#####To query the Extract API with one URL
 If you want to pass any optional Query Arguments, create an NSDictionary using the strongly typed keys found in the EmbedlyExtract.h file. For example:

  `NSDictionary *attributes = @{ kExtractAttributeChars : @140 };`
Then call  - (void)fetchExtractForURL:(NSString *)requestedURL attributes:(NSDictionary *)attributes completion:(EmbedlyClientFetchExtractCompletionHandler)completion; with the URL to extract 

```
   [[EmbedlyClient sharedClient] fetchExtractForURL:@"http://www.vice.com/read/an-afternoon-inside-the-worlds-only-bunny-museum"
                                             attributes:attributes
                                          completion:^(EmbedlyExtract *extract, NSError *error) {
                                              NSLog(@"%@", extract);
                                          }];
```
 Check the EmbedlyExtract.h file for all the properties that can be returned.
 
 All errors returned from the library are mapped from Embed.ly's error codes http://embed.ly/docs/api/extract/endpoints/1/extract#error-codes
 
 See the example project for a very simplistic usage of the library.
 
 If you have any questions, open an Issue here, or hit me up on Twitter @adamontherun
 
###TODOs:
 - Add support for the Embed API
 - Add support for the Display API
 - Release as a CocoaPod