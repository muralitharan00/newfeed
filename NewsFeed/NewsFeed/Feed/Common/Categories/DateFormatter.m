//
//  DateFormatter.m
//  NewsFeed
//
//  Created by Muralitharan Govindaraj on 05/04/24.
//

#import "DateFormatter.h"

@implementation DateFormatter

+ (NSString *)formatDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM dd, yyyy"];
    return [dateFormatter stringFromDate:date];
}

+(NSDate *)parseDateString: (NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *date = [dateFormatter dateFromString: dateString];
    return date;
}

@end
