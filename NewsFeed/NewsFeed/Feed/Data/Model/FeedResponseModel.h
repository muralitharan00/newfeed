//
//  FeedResponseModel.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>

@interface FeedResponseModel: NSObject

@property (nonatomic, copy) NSString *publishedAt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *urlToImage;

- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end
