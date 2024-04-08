//
//  MockFeedInteractor.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 05/04/24.
//

#import "FeedInteractor.h"

@interface MockFeedInteractor : NSObject <FeedInteractorProtocol>

@property (nonatomic, strong) NSArray<FeedPresentationModel *> *mockFeeds;
@property (nonatomic, strong) NSError *mockError;

@end
