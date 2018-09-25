//
//  NSDate+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "NSDate+MMH.h"

@implementation NSDate (MMH)

- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)nanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (NSInteger)howManyDaysInCurrentMonth {
    NSDate *date  = [NSDate new];
    NSInteger month = date.month;
    if ([@[@(1),@(3),@(5),@(7),@(8),@(10),@(12)] containsObject:@(month)]) {
        return 31;
    }
    if ([@[@(2),@(4),@(6),@(9),@(11)] containsObject:@(month)]) {
        return 30;
    }
    if ([date isLeapYear]) {
        return 28;
    } else {
        return 29;
    }
}

- (BOOL)isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday {
    NSDate *added = [self dateByAddingDays:1];
    return [added isToday];
}


- (NSString *)stringRepresentation {
    NSCalendar *calendar =   [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now  = [NSDate date];
    NSDateComponents  *nowComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:now];
    NSDateComponents  *selfComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:self];
    
    if ((selfComponents.year == nowComponents.year) && (selfComponents.month == nowComponents.month) && (selfComponents.day == nowComponents.day)) {
        return [NSString stringWithFormat:@"%02ld:%02ld", (long)selfComponents.hour, (long)selfComponents.minute];
    }
    NSDate *yesterday = [now dateByAddingTimeInterval:(-3600 * 24)];
    NSDateComponents  *yesterdayComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:yesterday];
    
    if ((selfComponents.year == yesterdayComponents.year) && (selfComponents.month == yesterdayComponents.month) && (selfComponents.day == yesterdayComponents.day)) {
        return [NSString stringWithFormat:@"昨天 %02ld:%02ld", (long)selfComponents.hour, (long)selfComponents.minute];
    }
    
    NSDate  *theDayBeforeYesterday = [yesterday dateByAddingTimeInterval:(-3600 * 24)];
    NSDateComponents  *theDayBeforeYesterdayComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:theDayBeforeYesterday];
    
    if ((selfComponents.year == theDayBeforeYesterdayComponents.year) && (selfComponents.month == theDayBeforeYesterdayComponents.month) && (selfComponents.day == theDayBeforeYesterdayComponents.day)) {
        return [NSString stringWithFormat:@"前天 %02ld:%02ld", (long)selfComponents.hour, (long)selfComponents.minute];
    }
    
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld", (long)selfComponents.year, (long)selfComponents.month, (long)selfComponents.day, (long)selfComponents.hour, (long)selfComponents.minute];
}

- (NSDate *)dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar =  [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

+ (NSDate *)dateWithMillisecondIntervalSince1970:(double)timeInterval {
    NSTimeInterval t = timeInterval / 1000.0;
    return [NSDate dateWithTimeIntervalSince1970:t];
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}


@end
