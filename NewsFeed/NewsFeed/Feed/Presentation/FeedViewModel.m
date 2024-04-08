//
//  FeedViewModel.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedPresentationModel.h"
#import "FeedInteractor.h"
#import "FeedViewModel.h"

@implementation FeedViewModel
@synthesize feeds;

- (instancetype)initWithInteractorProtocol:(id<FeedInteractorProtocol>)interactorProtocol {
    self = [super init];
    _interactor = interactorProtocol;
    return self; 
}

- (instancetype)init {
    return [self initWithInteractorProtocol: [[FeedInteractor alloc] init]];
}

- (void)fetchFeedsWithCompletion:(void (^)(FetchStatus status, NSError *error))completion {
    NSError *errorFetch = nil;
    NSArray<FeedPresentationModel *> *feeds = [self.interactor getFeedsWithError: &errorFetch];
    if (!errorFetch) {
        if (completion) {
            self.feeds = feeds;
            completion(FetchStatusSuccess, nil);
        }
    } else {
        if (completion) {
            completion(FetchStatusFailure, errorFetch);
        }
    }
}
@end
