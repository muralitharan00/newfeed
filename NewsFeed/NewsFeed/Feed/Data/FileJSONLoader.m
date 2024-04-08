//
//  FileJSONLoader.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 06/04/24.
//

#import <Foundation/Foundation.h>
#import "FileJSONLoader.h"
#import "FeedDataHandler.h"

@implementation FileJSONLoader

- (NSDictionary *)loadJSONFromFile:(NSString *)fileName error:(NSError **)error {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    if (!path) {
        if (error) {
            *error = [NSError errorWithDomain:FeedDataHandlerErrorDomain
                                         code:FeedDataHandlerErrorFileNotFound
                                     userInfo:@{NSLocalizedDescriptionKey:FeedDataHandlerErrorFileNotFoundDescription}];
        }
        return nil;
    }
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (!data) {
        if (error) {
            *error = [NSError errorWithDomain:FeedDataHandlerErrorDomain
                                         code:FeedDataHandlerErrorFileNotFound
                                     userInfo:@{NSLocalizedDescriptionKey:FeedDataHandlerErrorFileNotFoundDescription}];
        }
        return nil;
    }
    NSError *jsonError;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    if (jsonError) {
        if (error) {
            *error = [NSError errorWithDomain:FeedDataHandlerErrorDomain
                                         code:FeedDataHandlerErrorJSONParsingFailed
                                     userInfo:@{NSLocalizedDescriptionKey:FeedDataHandlerErrorJSONParsingFailedDescription}];
        }
        return nil;
    }
    return json;
}

@end
