EmbedlyWithBlocks
=================
EmbedlyWithBlocks is an Objective-C library for the http://embed.ly set of APIs (currently supports the Embed and Extract APIs). Embed.ly has an official iOS library https://github.com/embedly/embedly-ios and EmbedlyWithBlocks can be used as a replacement.

EmbedlyWithBlocks is an improvement over the official library for the following reasons:
- Use of blocks instead of delegates.
- Queries returns fully hydrated objects instead of dictionaries.
- All available service method options can be specified by using constant strings declared in a header file.

###Installation 
####Using CocoaPods
add `pod 'EmbedlyWithBlocks'` to your Podfile

####Without Cocoapods
Drag the Classes folder into your project.

In AppDelegate.m #import "EmbedlyClient.h"

In the app delegate's 
`- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions` 
method, add the following:
`[EmbedlyClient sharedClient].APIKey = @"YOURAPIKEY";` (Be certain to include your own API key!)
###Usage
 Wherever you want to use the library, add `#import "EmbedlyClient.h"` to your .m file
 
#####To query the Extract API with one URL

Configure any optional Query Arguments you want to pass by creating an NSDictionary using the NSString const keys found in the EmbedlyExtract.h file. For example:

`NSDictionary *attributes = @{ kExtractAttributeChars : @140 };`

Then call the method  `- (void)fetchExtractForURL:(NSString *)requestedURL attributes:(NSDictionary *)attributes completion:(EmbedlyClientFetchExtractCompletionHandler)completion;`
```
 [[EmbedlyClient sharedClient] fetchExtractForURL:@"http://www.vice.com/read/an-afternoon-inside-the-worlds-only-bunny-museum"
                                             attributes:attributes
                                             completion:^(EmbedlyExtract *extract, NSError *error) {
                                              NSLog(@"%@", extract);
                                          }];
```
Check the EmbedlyExtract.h and EmbedlyEmbed.h files for all the properties that can be returned.
 
All errors returned from the library are mapped from Embed.ly's error codes http://embed.ly/docs/api/extract/endpoints/1/extract#error-codes
 
See the example project for a simplistic usage of the library.
 
 If you have any questions, open an Issue here, or hit me up on Twitter @adamontherun
 
###TODOs:
 - Add support for the Display API
