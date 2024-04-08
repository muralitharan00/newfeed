//
//  FeedRepositoryProtocol.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 06/04/24.
//

#import <Foundation/Foundation.h>
#import "FeedModel.h"


@protocol FeedRepositoryProtocol <NSObject>

- (NSArray<FeedModel *> *)fetchFeedsWithError:(NSError **)error;

@end
