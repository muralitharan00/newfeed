//
//  JSONLoader.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 06/04/24.
//

#import <Foundation/Foundation.h>

@protocol JSONLoaderProtocol <NSObject>
- (NSDictionary *)loadJSONFromFile:(NSString *)fileName error:(NSError **)error;
@end
