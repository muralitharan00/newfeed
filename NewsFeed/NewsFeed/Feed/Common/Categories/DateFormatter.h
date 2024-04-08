//
//  NSDateFormatter+Formatter.h
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 02/04/24.
//

#import <Foundation/Foundation.h>

@interface DateFormatter: NSObject
+ (NSString *)formatDate:(NSDate *)date;
+ (NSDate *)parseDateString: (NSString *)dateString;
@end
