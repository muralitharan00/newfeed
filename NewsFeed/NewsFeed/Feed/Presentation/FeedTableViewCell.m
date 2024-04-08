//
//  FeedTableViewCell.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 05/04/24.
//

#import "FeedTableViewCell.h"
#import "DateFormatter.h"

@implementation FeedTableViewCell

-(void)fillFeedDetails:(FeedPresentationModel *)feed {
    self.dateLabel.text = [DateFormatter formatDate:feed.publishedAt];
    self.titleLabel.text = feed.title;
}

@end
