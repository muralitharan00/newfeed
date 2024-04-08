//
//  FeedModel.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>

@interface FeedModel: NSObject

@property (nonatomic, copy) NSString *publishedAt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *urlToImage;

- (instancetype)initWith: (NSString *) publishedAt title: (NSString *)title url: (NSString *)url urlToImage: (NSString *)urlToImage;

@end
