//
//  FeedInteractorTest.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 05/04/24.
//

#import <XCTest/XCTest.h>
#import "MockFeedUseCase.h"
#import "FeedInteractor.h"

@interface FeedInteractorTest : XCTestCase

@property (nonatomic, strong) FeedInteractor *interactor;
@property (nonatomic, strong) MockFeedUseCase *mockUseCase;

@end

@implementation FeedInteractorTest

- (void)setUp {
    [super setUp];
    self.mockUseCase = [[MockFeedUseCase alloc] init];
    self.interactor = [[FeedInteractor alloc] initWithUseCaseProtocol: self.mockUseCase];
}

- (void)tearDown {
    self.mockUseCase = nil;
    self.interactor = nil;
    [super tearDown];
}

- (void)testGetFeedsSuccess {
    NSArray<FeedModel *> *mockFeeds = @[[FeedModel new], [FeedModel new]];
    self.mockUseCase.mockFeeds = mockFeeds;
    NSError *error = nil;
    NSArray<FeedPresentationModel *> *presentationModels = [self.interactor getFeedsWithError:&error];
    XCTAssertEqual(presentationModels.count, 2, @"Expected 2 presentation models after successful fetch");
    XCTAssertNil(error, @"Error should be nil after successful fetch");
}

- (void)testGetFeedsFailure {
    NSError *mockError = [NSError errorWithDomain:@"MockErrorDomain" code:123 userInfo:@{NSLocalizedDescriptionKey: @"Mock Error"}];
    self.mockUseCase.mockError = mockError;
    
    NSError *error = nil;
    NSArray<FeedPresentationModel *> *presentationModels = [self.interactor getFeedsWithError:&error];
    
    XCTAssertEqual(presentationModels.count, 0, @"No presentation models should be returned on fetch failure");
    XCTAssertNotNil(error, @"Error should not be nil on fetch failure");
    XCTAssertEqualObjects(error.domain, @"MockErrorDomain", @"Error domain should match expected value");
    XCTAssertEqual(error.code, 123, @"Error code should match expected value");
    XCTAssertEqualObjects(error.localizedDescription, @"Mock Error", @"Error localized description should match expected value");
}

@end
