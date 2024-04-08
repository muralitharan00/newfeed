//
//  FeedUseCaseProtocol.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 06/04/24.
//

#import <Foundation/Foundation.h>
#import "FeedModel.h"

@protocol FeedUseCaseProtocol <NSObject>

- (NSArray<FeedModel *> *)getFeedsWithError:(NSError **)error;

@end
