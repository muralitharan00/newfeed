//
//  FeedViewController.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 29/03/24.
//

#import "FeedViewController.h"
#import "FeedInteractor.h"
#import "FeedTableViewCell.h"


@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[FeedViewModel alloc] init];
    [self fetchFeeds];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"FeedTableViewCell";
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    [cell fillFeedDetails: self.viewModel.feeds[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)didFailToFetchFeedWithError:(NSError *)error {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"Error"
                                                                             message: error.localizedDescription
                                                                      preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)fetchFeeds {
    [self.viewModel fetchFeedsWithCompletion:^(FetchStatus status, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case FetchStatusSuccess:
                    [self.tableView reloadData];
                    break;
                case FetchStatusFailure:
                    [self didFailToFetchFeedWithError:error];
                    break;
            }
        });
    }];
}

@end
