//
//  FeedViewModel.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedPresentationModel.h"
#import "FeedInteractor.h"

typedef NS_ENUM(NSInteger, FetchStatus) {
    FetchStatusSuccess,
    FetchStatusFailure
};

@protocol FeedViewModelProtocol <NSObject>

@property (nonatomic, strong) NSArray<FeedPresentationModel *> *feeds;
- (void)fetchFeedsWithCompletion:(void (^)(FetchStatus status, NSError *error))completion;

@end

@interface FeedViewModel: NSObject <FeedViewModelProtocol>

@property (nonatomic, strong) id<FeedInteractorProtocol> interactor;
- (instancetype)initWithInteractorProtocol:(id<FeedInteractorProtocol>)interactorProtocol;

@end
