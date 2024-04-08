//
//  MockFeedUseCase.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//

#import "FeedUseCase.h"
#import "FeedModel.h"
#import <Foundation/Foundation.h>

@interface MockFeedUseCase : NSObject <FeedUseCaseProtocol>

@property (nonatomic, strong) NSArray<FeedModel *> *mockFeeds;
@property (nonatomic, strong) NSError *mockError;

@end
