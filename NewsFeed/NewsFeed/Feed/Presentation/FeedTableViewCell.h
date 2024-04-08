//
//  FeedTableViewCell.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 05/04/24.
//

#import <UIKit/UIKit.h>
#import "FeedPresentationModel.h"

@interface FeedTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)fillFeedDetails: (FeedPresentationModel *)feed;

@end
