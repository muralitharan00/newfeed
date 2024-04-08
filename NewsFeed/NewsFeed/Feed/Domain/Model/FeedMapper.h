//
//  FeedMapper.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>
#import "FeedResponseModel.h"
#import "FeedModel.h"

@interface FeedMapper : NSObject

+ (FeedModel *)dataModelFromArticle:(FeedResponseModel *)feed;

@end
