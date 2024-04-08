//
//  FeedViewModelTest.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 05/04/24.
//

#import <XCTest/XCTest.h>
#import "MockFeedInteractor.h"
#import "FeedViewModel.h"

@interface FeedViewModelTest : XCTestCase

@property (nonatomic, strong) FeedViewModel *viewModel;
@property (nonatomic, strong) MockFeedInteractor *mockInteractor;

@end

@implementation FeedViewModelTest

- (void)setUp {
    [super setUp];
    self.mockInteractor = [[MockFeedInteractor alloc] init];
    self.viewModel = [[FeedViewModel alloc] initWithInteractorProtocol:self.mockInteractor];
}

- (void)tearDown {
    self.viewModel = nil;
    self.mockInteractor = nil;
    [super tearDown];
}

- (void)testFetchFeedsSuccess {
    NSArray<FeedPresentationModel *> *mockFeeds = @[[FeedPresentationModel new], [FeedPresentationModel new]];
    self.mockInteractor.mockFeeds = mockFeeds;
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch feeds with success"];
    [self.viewModel fetchFeedsWithCompletion:^(FetchStatus status, NSError *error) {
        XCTAssertNil(error, @"Error should be nil after successful fetch");
        XCTAssertEqual(status, FetchStatusSuccess, @"Fetch status should be success");
        XCTAssertEqualObjects(self.viewModel.feeds, mockFeeds, @"Fetched feeds should match expected feeds");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:1 handler:nil];
}

- (void)testFetchFeedsFailure {
    
    NSError *mockError = [NSError errorWithDomain:@"MockErrorDomain" code:123 userInfo:nil];
    self.mockInteractor.mockError = mockError;
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Fetch feeds with failure"];
    
    [self.viewModel fetchFeedsWithCompletion:^(FetchStatus status, NSError *error) {
        XCTAssertNotNil(error, @"Error should not be nil after fetch failure");
        XCTAssertEqual(status, FetchStatusFailure, @"Fetch status should be failure");
        XCTAssertEqualObjects(error, mockError, @"Error object should match expected error");
        XCTAssertNil(self.viewModel.feeds, @"Feeds should be nil after fetch failure");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:1 handler:nil];
}


@end
