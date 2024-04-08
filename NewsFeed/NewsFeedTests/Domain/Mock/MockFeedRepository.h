//
//  MockFeedRepository.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//


#import <Foundation/Foundation.h>
#import "FeedRepository.h"

@interface MockFeedRepository : NSObject <FeedRepositoryProtocol>

@property (nonatomic, strong) NSArray<FeedModel *> *mockFeeds;
@property (nonatomic, strong) NSError *mockError;

@end
