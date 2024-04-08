//
//  FeedRespositoryTests.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 03/04/24.
//

#import <XCTest/XCTest.h>
#import "Mock/MockDataHandler.h"
#import "FeedRepository.h"

@interface FeedRespositoryTests : XCTestCase

@property (nonatomic, strong) FeedRepository *repository;
@property (nonatomic, strong) MockDataHandler *mockDataHandler;

@end

@implementation FeedRespositoryTests

- (void)setUp {
    [super setUp];
    self.mockDataHandler = [[MockDataHandler alloc] init];
    self.repository = [[FeedRepository alloc] initWithDataHandler:self.mockDataHandler];
}

- (void)tearDown {
    self.repository = nil;
    self.mockDataHandler = nil;
    [super tearDown];
}

- (void)testFetchFeedsSuccess {
    NSArray<FeedResponseModel *> *mockFeeds = @[[FeedResponseModel new], [FeedResponseModel new]];
    self.mockDataHandler.mockFeeds = mockFeeds;
    NSError *error = nil;
    NSArray<FeedModel *> *feeds = [self.repository fetchFeedsWithError:&error];
    XCTAssertEqual(feeds.count, 2, @"Expected 2 feeds when fetching successful");
}

- (void)testFetchFeedsSuccessWithRightMapping {
    FeedResponseModel *responseModel1 = [self createMockFeedResponseModelWithTitle:@"SEC approves bitcoin ETFs (for real this time)"
                                                                       publishedAt:@"2024-01-10T22:41:25Z"
                                                                                url:@"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html"
                                                                         urlToImage:@"https://media.wired.com/photos/65a0305c4aaf02fdf493f220/191:100/w_1280,c_limit/Not-Everyone-Is-Jazzed-About-Bitcoin-ETFs-Business-1299911534.jpg"];

    NSArray<FeedResponseModel *> *mockFeeds = @[responseModel1];
    self.mockDataHandler.mockFeeds = mockFeeds;
    NSError *error = nil;
    NSArray<FeedModel *> *feeds = [self.repository fetchFeedsWithError:&error];
    
    FeedModel *feedModel = feeds.firstObject;
    XCTAssertEqualObjects(responseModel1.title, feedModel.title, @"Title should match");
    XCTAssertEqualObjects(responseModel1.publishedAt, feedModel.publishedAt, @"Published date should match");
    XCTAssertEqualObjects(responseModel1.url, feedModel.url, @"URL should match");
    XCTAssertEqualObjects(responseModel1.urlToImage, feedModel.urlToImage, @"Image URL should match");
}


- (void)testFetchFeedsFailure {
    NSError *mockError = [NSError errorWithDomain:FeedDataHandlerErrorDomain
                                             code:FeedDataHandlerErrorFileNotFound
                                         userInfo:@{NSLocalizedDescriptionKey: FeedDataHandlerErrorFileNotFoundDescription}];
    self.mockDataHandler.mockError = mockError;
   
    NSError *error = nil;
    NSArray<FeedModel *> *feeds = [self.repository fetchFeedsWithError:&error];
    XCTAssertEqual(feeds.count, 0, @"Expected no feeds when fetching failed");
    XCTAssertNotNil(error, @"Error should not be nil");
    XCTAssertEqual(error.code, FeedDataHandlerErrorFileNotFound, @"Error code should match expected code for file not found");
}

- (FeedResponseModel *)createMockFeedResponseModelWithTitle:(NSString *)title
                                               publishedAt:(NSString *)publishedAt
                                                        url:(NSString *)url
                                                 urlToImage:(NSString *)urlToImage {
    FeedResponseModel *responseModel = [[FeedResponseModel alloc] init];
    responseModel.title = title;
    responseModel.publishedAt = publishedAt;
    responseModel.url = url;
    responseModel.urlToImage = urlToImage;
    return responseModel;
}

@end
