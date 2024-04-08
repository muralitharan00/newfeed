//
//  FeedUseCase.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedModel.h"
#import "FeedRepository.h"
#import "FeedUseCaseProtocol.h"

@interface FeedUseCase : NSObject <FeedUseCaseProtocol>

@property (nonatomic, strong) id<FeedRepositoryProtocol> feedRepository;

- (instancetype)initWithFeedRepository:(id<FeedRepositoryProtocol>)feedRepository;

@end
