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


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *exampleLabel;
@property (weak, nonatomic) IBOutlet UITextView *content;

@end

@implementation ViewController

- (IBAction)handleButtonTapped:(id)sender {
    
    NSDictionary *attributes = @{ kExtractAttributeChars : @140 };
    
    [[EmbedlyClient sharedClient] fetchExtractForURL:@"http://www.vice.com/read/an-afternoon-inside-the-worlds-only-bunny-museum"
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
}

@end
