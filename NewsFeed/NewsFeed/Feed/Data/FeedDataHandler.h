//
//  FeedDataHandler.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "JSONLoaderProtocol.h"
#import "FeedDataHandlerProtocol.h"

extern NSString * const FeedDataHandlerErrorDomain;

typedef NS_ENUM(NSInteger, FeedDataHandlerErrorCode) {
    FeedDataHandlerErrorFileNotFound,
    FeedDataHandlerErrorJSONParsingFailed
};

extern NSString * const FeedDataHandlerErrorFileNotFoundDescription;
extern NSString * const FeedDataHandlerErrorJSONParsingFailedDescription;

@interface FeedDataHandler: NSObject <FeedDataHandlerProtocol>

@property (nonatomic, strong) id<JSONLoaderProtocol> jsonLoader;

@end
