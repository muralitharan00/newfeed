//
//  FeedDataHandler.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "FeedDataHandler.h"
#import "FileJSONLoader.h"

NSString * const FeedDataHandlerErrorDomain = @"com.aciworldwide.FeedDataHandlerErrorDomain";
NSString * const FeedDataHandlerErrorFileNotFoundDescription = @"JSON file not found.";
NSString * const FeedDataHandlerErrorJSONParsingFailedDescription = @"Failed to parse JSON data.";

@implementation FeedDataHandler

- (instancetype)init {
    self = [super init];
    if (self) {
        self.jsonLoader = [[FileJSONLoader alloc] init];
    }
    return self;
}

- (NSArray<FeedResponseModel *> *)fetchFeedsWithError:(NSError **)error {
    NSError *jsonError;
    NSDictionary *json = [self.jsonLoader loadJSONFromFile:@"DummyFeed" error:&jsonError];
    if (!json) {
        if (error) {
            NSString *errorMessage = [NSString stringWithFormat:@"Error loading JSON: %@", [jsonError localizedDescription]];
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorMessage};
            *error = [NSError errorWithDomain:@"com.aciworldwide.FeedError" code:0 userInfo:userInfo];
        }
        return nil;
    }
    NSArray *newsFeeds = json[@"articles"];
    NSMutableArray *feeds = [NSMutableArray array];
    for (NSDictionary *feedDict in newsFeeds) {
        FeedResponseModel *feed = [[FeedResponseModel alloc] initWithDictionary:feedDict];
        if (feed) {
            [feeds addObject:feed];
        } else {
            NSLog(@"Failed to parse feed: %@", feedDict);
        }
    }
    return [feeds copy];
}

@end
