//
//  FeedViewController.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import <UIKit/UIKit.h>
#import "FeedViewModel.h"
#import "FeedPresentationModel.h"

@interface FeedViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) id<FeedViewModelProtocol> viewModel;


@end

