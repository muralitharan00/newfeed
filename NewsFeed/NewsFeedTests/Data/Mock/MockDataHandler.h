//
//  MockDataHandler.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//


#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "FeedDataHandler.h"

@interface MockDataHandler : NSObject <FeedDataHandlerProtocol>

@property (nonatomic, strong) NSArray<FeedResponseModel *> *mockFeeds;
@property (nonatomic, strong) NSError *mockError;

@end
