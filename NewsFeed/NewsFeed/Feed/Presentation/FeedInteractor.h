//
//  FeedInteractor.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedPresentationModel.h"
#import "FeedUseCase.h"

@protocol FeedInteractorProtocol <NSObject>
- (NSArray<FeedPresentationModel *> *)getFeedsWithError:(NSError **)error;
@end

@interface FeedInteractor: NSObject <FeedInteractorProtocol>

@property (nonatomic, strong) id<FeedUseCaseProtocol> feedUseCase;

- (instancetype)initWithUseCaseProtocol:(id<FeedUseCaseProtocol>)useCaseProtocol;

@end
