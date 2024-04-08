//
//  FeedDataHandlerProtocol.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 06/04/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"

@protocol FeedDataHandlerProtocol <NSObject>

- (NSArray<FeedResponseModel *> *)fetchFeedsWithError:(NSError **)error;

@end
