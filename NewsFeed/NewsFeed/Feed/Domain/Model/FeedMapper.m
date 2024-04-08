//
//  FeedMapper.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "FeedModel.h"
#import "FeedMapper.h"

@implementation FeedMapper

+ (FeedModel *)dataModelFromArticle:(FeedResponseModel *)feed {
    FeedModel *model = [[FeedModel alloc] init];
    model.title = feed.title;
    model.publishedAt = feed.publishedAt;
    model.url = feed.url;
    model.urlToImage = feed.urlToImage;
    return model;
}

@end
