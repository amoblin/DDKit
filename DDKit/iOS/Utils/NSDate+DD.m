//
//  NSDate+DD.m
//  Pods
//
//  Created by amoblin on 16/8/19.
//
//

#import "NSDate+DD.h"

@implementation NSDate (DD)

- (NSString *)humanableInfo;
{
    NSString *info;

    NSTimeInterval delta = - [self timeIntervalSinceNow];
    if (delta < 60) {
        // 1分钟之内
        info = @"刚刚";
    } else {
        delta = delta / 60;
        if (delta < 60) {
            // n分钟前
            info = [NSString stringWithFormat:@"%@分钟前", @((NSInteger)delta)];
        } else {
            delta = delta / 60;
            if (delta < 24) {
                // n小时前
                info = [NSString stringWithFormat:@"%@小时前", @((NSInteger)delta)];
            } else {
                delta = delta / 24;
                if ((NSInteger)delta == 1) {
                    //昨天
                    info = @"昨天";
                } else if ((NSInteger)delta == 2) {
                    info = @"前天";
                } else {
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                    info = [dateFormatter stringFromDate:self];
//                    info = [NSString stringWithFormat:@"%d天前", (NSUInteger)delta];
                }
            }
        }
    }
    return info;
}

- (NSString *)dateString;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)timeString;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    return [dateFormatter stringFromDate:self];
}

@end
