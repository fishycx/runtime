//
//  NSDate+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MMH)


#pragma mark - 属性


@property (nonatomic, readonly) NSInteger year; ///< Year component
@property (nonatomic, readonly) NSInteger month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger quarter; ///< Quarter component
@property (nonatomic, readonly) NSInteger howManyDaysInCurrentMonth; ///<howManyDaysInCurrentMonth
@property (nonatomic, readonly) BOOL isLeapMonth; ///< whether the month is leap month
@property (nonatomic, readonly) BOOL isLeapYear; ///< whether the year is leap year
@property (nonatomic, readonly) BOOL isToday; ///< whether date is today (based on current locale)
@property (nonatomic, readonly) BOOL isYesterday; ///< whether date is yesterday (based on current locale)

#pragma mark - 方法

- (NSString *)stringRepresentation; /**<今天，昨天，前天， 年月日*/
- (nullable NSDate *)dateByAddingYears:(NSInteger)years;
- (nullable NSDate *)dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks;
- (nullable NSDate *)dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)dateByAddingHours:(NSInteger)hours;
- (nullable NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (nullable NSDate *)dateByAddingSeconds:(NSInteger)seconds;

/**
 *  将NSDate格式化，以字符串的形势返回
 */
- (nullable NSString *)stringWithFormat:(NSString *)format;

/**
 将时间戳转换成时间
 */
+ (NSDate *)dateWithMillisecondIntervalSince1970:(double)timeInterval;

/**
 *  将特定格式的字符串日期转换成NSDate
 */
+ (nullable NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;


@end

NS_ASSUME_NONNULL_END
