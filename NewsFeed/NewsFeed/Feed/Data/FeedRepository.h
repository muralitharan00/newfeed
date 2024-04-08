//
//  FeedRepository.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "FeedModel.h"
#import "FeedDataHandler.h"
#import "FeedRepositoryProtocol.h"

extern NSString * const FeedRepositoryErrorDomain;
typedef NS_ENUM(NSInteger, FeedRepositoryErrorCode) {
    FeedRepositoryErrorDataFetchingFailed
};

extern NSString * const FeedRepositoryErrorDataFetchingFailedDescription;


@interface FeedRepository: NSObject <FeedRepositoryProtocol>

@property (nonatomic, strong) id<FeedDataHandlerProtocol> dataHandler;

- (instancetype)initWithDataHandler:(id<FeedDataHandlerProtocol>)dataHandler;

@end
