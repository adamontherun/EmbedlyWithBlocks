//
//  ViewController.m
//  EmbedlyWithBlocks
//
//  Created by Adam Smith on 12/10/14.
//  Copyright (c) 2014 Adam Smith. All rights reserved.
//

#import "ViewController.h"
#import "EmbedlyClient.h"
#import "EmbedlyExtract.h"
#import "EmbedlyEmbed.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *exampleLabel;
@property (weak, nonatomic) IBOutlet UITextView *content;

@end

@implementation ViewController

- (IBAction)handleButtonTapped:(id)sender {
    
    NSDictionary *attributes = @{ kExtractAttributeChars : @140 };
    
    [[EmbedlyClient sharedClient] fetchExtractForURL:@"https://flic.kr/p/9K3DA9"
                                             attributes:attributes
                                          completion:^(EmbedlyExtract *extract, NSError *error) {
                                              self.content.text = extract.extractDescription;
                                              self.exampleLabel.text = extract.title;
                                              NSLog(@"%@", extract);
                                          }];
    
//    [[EmbedlyClient sharedClient] fetchExtractsForURLs:@[@"http://hawaii.com", @"http://hijosh.com"]
//                                               options:options
//                                            completion:^(NSArray *extracts, NSError *error) {
//                                                for (Extract *extract in extracts) {
//                                                    NSLog(@"%@", extract);
//                                                }
//                                            }];
//    
//    [[EmbedlyClient sharedClient] fetchEmbedForURL:@"http://vimeo.com/49154370"
//                                        attributes:attributes
//                                        completion:^(EmbedlyEmbed *embed, NSError *error) {
//                                            if (!error) {
//                                                self.exampleLabel.text = embed.provider_name;
//                                                NSLog(@"embed is %@", embed);
//                                            } else {
//                                                NSLog(@"error: %@", error);
//                                            }
//                                        }];
    
}

@end
