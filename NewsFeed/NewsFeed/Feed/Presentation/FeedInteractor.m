//
//  FeedInteractor.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedPresentationModel.h"
#import "FeedInteractor.h"
#import "FeedModel.h"
#import "FEedUseCase.h"

@implementation FeedInteractor

- (instancetype)initWithUseCaseProtocol:(id)useCaseProtocol {
    self = [super init];
    if (self) {
        _feedUseCase = useCaseProtocol;
    }
    return self;
}

- (instancetype)init {
    return [self initWithUseCaseProtocol: [[FeedUseCase alloc] init]];
}

- (NSArray<FeedPresentationModel *> *)getFeedsWithError:(NSError **)error {
    NSError *errorFetch = nil;
    NSArray<FeedModel *> *feeds = [self.feedUseCase getFeedsWithError: &errorFetch];
    if (errorFetch) {
        *error = errorFetch;
        return nil;
    }
    
    NSMutableArray<FeedPresentationModel *> *presentationModels = [NSMutableArray array];
    for (FeedModel *feed in feeds) {
        FeedPresentationModel *model = [[FeedPresentationModel alloc] initWithFeedModel: feed.title
                                                                                   date: feed.publishedAt
                                                                                    url: feed.url];
        [presentationModels addObject:model];
    }
    
    NSArray<FeedPresentationModel *> *sortedPresentationModels = [presentationModels sortedArrayUsingComparator:^NSComparisonResult(FeedPresentationModel *presentationModel1, FeedPresentationModel *presentationModel2) {
            return [presentationModel2.publishedAt compare:presentationModel1.publishedAt];
        }];
    return sortedPresentationModels;
}

@end
