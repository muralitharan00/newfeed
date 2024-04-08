//
//  FeedPresentationModel.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <Foundation/Foundation.h>

@interface FeedPresentationModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSDate *publishedAt;
@property (nonatomic, strong) NSURL *urlToImage;

- (instancetype)initWithFeedModel: (NSString *)title date: (NSString *)date url: (NSString *)url;

@end
