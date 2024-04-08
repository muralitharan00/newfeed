//
//  FileJSONLoaderTest.m
//  NewsFeedTests
//
//  Created by Muralitharan Govindaraj on 06/04/24.
//

#import <XCTest/XCTest.h>
#import "FileJSONLoader.h"
#import "FeedDataHandler.h"

@interface FileJSONLoaderTest : XCTestCase

@property (nonatomic, strong) FileJSONLoader *jsonLoader;

@end

@implementation FileJSONLoaderTest

- (void)setUp {
    [super setUp];
    self.jsonLoader = [[FileJSONLoader alloc] init];
}

- (void)tearDown {
    self.jsonLoader = nil;
    [super tearDown];
}

- (void)testLoadJSONFromFile_Successful {
    NSError *error = nil;
    NSDictionary *json = [self.jsonLoader loadJSONFromFile:@"DummyFeed" error:&error];
    XCTAssertNotNil(json, @"JSON data should not be nil");
    XCTAssertNil(error, @"No error should occur when loading valid JSON data");
}

- (void)testLoadJSONFromFile_FileNotFound {
    NSError *error = nil;
    NSDictionary *json = [self.jsonLoader loadJSONFromFile:@"NonExistentFile" error:&error];
    
    XCTAssertNil(json, @"JSON data should be nil for a non-existent file");
    XCTAssertNotNil(error, @"An error should occur when attempting to load a non-existent file");
    XCTAssertEqual(error.code, FeedDataHandlerErrorFileNotFound, @"Error code should indicate file not found");
    XCTAssertEqualObjects(error.domain, FeedDataHandlerErrorDomain, @"Error domain should match expected domain");
    XCTAssertEqualObjects(error.localizedDescription, FeedDataHandlerErrorFileNotFoundDescription, @"Error description should match expected description for file not found");
}

- (void)testLoadJSONFromFile_InvalidJSON {
    NSError *error = nil;
    NSDictionary *json = [self.jsonLoader loadJSONFromFile:@"InvalidData" error:&error];
    
    XCTAssertNil(json, @"JSON data should be nil for invalid JSON");
    XCTAssertNotNil(error, @"An error should occur when attempting to load invalid JSON");
    XCTAssertEqual(error.code, FeedDataHandlerErrorJSONParsingFailed, @"Error code should indicate JSON parsing failed");
    XCTAssertEqualObjects(error.domain, FeedDataHandlerErrorDomain, @"Error domain should match expected domain");
    XCTAssertEqualObjects(error.localizedDescription, FeedDataHandlerErrorJSONParsingFailedDescription, @"Error description should match expected description for JSON parsing failed");
}

@end
