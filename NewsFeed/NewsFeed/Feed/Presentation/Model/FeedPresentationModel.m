//
//  FeedPresentationModel.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedPresentationModel.h"
#import "DateFormatter.h"

@implementation FeedPresentationModel

- (instancetype)initWithFeedModel:(NSString *)title date:(NSString *)date url:(NSString *)url {
    self = [super init];
    if (self) {
        _publishedAt = [DateFormatter parseDateString:date];
        _urlToImage = [NSURL URLWithString: url];
        _title = [title copy];
    }
    return self;
}

@end
