//
//  FeedUseCaseTest.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "Mock/MockFeedRepository.h"
#import "FeedUseCase.h"
#import "FeedModel.h"

@interface FeedUseCaseTest : XCTestCase

@property (nonatomic, strong) FeedUseCase *useCase;
@property (nonatomic, strong) MockFeedRepository *mockRepository;

@end

@implementation FeedUseCaseTest

- (void)setUp {
    [super setUp];
    self.mockRepository = [[MockFeedRepository alloc] init];
    self.useCase = [[FeedUseCase alloc] initWithFeedRepository:self.mockRepository];
}

- (void)tearDown {
    self.useCase = nil;
    self.mockRepository = nil;
    [super tearDown];
}

- (void)testFetchFeedsSuccess {
    NSArray<FeedModel *> *mockFeeds = @[[FeedModel new], [FeedModel new]];
    self.mockRepository.mockFeeds = mockFeeds;
    NSError *error = nil;
    NSArray<FeedModel *> *feeds = [self.mockRepository fetchFeedsWithError:&error];
    XCTAssertEqual(feeds.count, 2, @"Expected 2 feeds when fetching successful");
}

- (void)testFetchFeedsFailure {
    NSError *mockError = [NSError errorWithDomain:FeedRepositoryErrorDomain
                                             code:FeedRepositoryErrorDataFetchingFailed
                                         userInfo:@{NSLocalizedDescriptionKey: FeedRepositoryErrorDataFetchingFailedDescription}];
    self.mockRepository.mockError = mockError;
    
    NSError *error = nil;
    NSArray<FeedModel *> *feeds = [self.useCase getFeedsWithError:&error];
    
    XCTAssertEqual(feeds.count, 0, @"Expected no feeds when fetching failed");
    XCTAssertNotNil(error, @"Error should not be nil");
    XCTAssertEqual(error.domain, FeedRepositoryErrorDomain, @"Error domain should match expected domain");
    XCTAssertEqual(error.code, FeedRepositoryErrorDataFetchingFailed, @"Error code should match expected code");
    XCTAssertEqualObjects(error.localizedDescription, FeedRepositoryErrorDataFetchingFailedDescription, @"Error description should match expected description");
}
@end
