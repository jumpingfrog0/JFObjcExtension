/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook 3.x and beyond
 BSD License, Use at your own risk
 */

#import <Foundation/Foundation.h>

#define D_MINUTE 60
#define D_HOUR 3600
#define D_DAY 86400
#define D_WEEK 604800
#define D_YEAR 31556926

@interface NSDate (JFUtilities)
+ (NSCalendar *)jf_currentCalendar; // avoid bottlenecks

// Relative dates from the current date
+ (NSDate *)jf_dateTomorrow;
+ (NSDate *)jf_dateYesterday;
+ (NSDate *)jf_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)jf_dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)jf_dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)jf_dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)jf_dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate *)jf_dateWithMinutesBeforeNow:(NSInteger)dMinutes;

// Short string utilities
- (NSString *)jf_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
- (NSString *)jf_stringWithFormat:(NSString *)format;
@property (nonatomic, readonly) NSString *jf_shortString;
@property (nonatomic, readonly) NSString *jf_shortDateString;
@property (nonatomic, readonly) NSString *jf_shortTimeString;
@property (nonatomic, readonly) NSString *jf_mediumString;
@property (nonatomic, readonly) NSString *jf_mediumDateString;
@property (nonatomic, readonly) NSString *jf_mediumTimeString;
@property (nonatomic, readonly) NSString *jf_longString;
@property (nonatomic, readonly) NSString *jf_longDateString;
@property (nonatomic, readonly) NSString *jf_longTimeString;

// Comparing dates
- (BOOL)jf_isEqualToDateIgnoringTime:(NSDate *)aDate;

- (BOOL)jf_isToday;
- (BOOL)jf_isTomorrow;
- (BOOL)jf_isYesterday;

- (BOOL)jf_isSameWeekAsDate:(NSDate *)aDate;
- (BOOL)jf_isThisWeek;
- (BOOL)jf_isNextWeek;
- (BOOL)jf_isLastWeek;

- (BOOL)jf_isSameMonthAsDate:(NSDate *)aDate;
- (BOOL)jf_isThisMonth;
- (BOOL)jf_isNextMonth;
- (BOOL)jf_isLastMonth;

- (BOOL)jf_isSameYearAsDate:(NSDate *)aDate;
- (BOOL)jf_isThisYear;
- (BOOL)jf_isNextYear;
- (BOOL)jf_isLastYear;

- (BOOL)jf_isEarlierThanDate:(NSDate *)aDate;
- (BOOL)jf_isLaterThanDate:(NSDate *)aDate;

- (BOOL)jf_isInFuture;
- (BOOL)jf_isInPast;

// Date roles
- (BOOL)jf_isTypicallyWorkday;
- (BOOL)jf_isTypicallyWeekend;

// Adjusting dates
- (NSDate *)jf_beginningOfYear;
- (NSDate *)jf_beginningOfMonth;
- (NSDate *)jf_beginningOfDay;
- (NSDate *)jf_endOfYear;
- (NSDate *)jf_endOfMonth;
- (NSDate *)jf_endOfDay;

- (NSDate *)jf_dateByAddingYears:(NSInteger)dYears;
- (NSDate *)jf_dateBySubtractingYears:(NSInteger)dYears;
- (NSDate *)jf_dateByAddingMonths:(NSInteger)dMonths;
- (NSDate *)jf_dateBySubtractingMonths:(NSInteger)dMonths;
- (NSDate *)jf_dateByAddingDays:(NSInteger)dDays;
- (NSDate *)jf_dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)jf_dateByAddingHours:(NSInteger)dHours;
- (NSDate *)jf_dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)jf_dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)jf_dateBySubtractingMinutes:(NSInteger)dMinutes;

// Date extremes
+ (NSDate *)jf_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (NSDate *)jf_dateAtStartOfDay;
- (NSDate *)jf_dateAtEndOfDay;

// Retrieving intervals
- (NSInteger)jf_minutesAfterDate:(NSDate *)aDate;
- (NSInteger)jf_minutesBeforeDate:(NSDate *)aDate;
- (NSInteger)jf_hoursAfterDate:(NSDate *)aDate;
- (NSInteger)jf_hoursBeforeDate:(NSDate *)aDate;
- (NSInteger)jf_daysAfterDate:(NSDate *)aDate;
- (NSInteger)jf_daysBeforeDate:(NSDate *)aDate;
- (NSInteger)jf_distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates
@property (readonly) NSInteger jf_nearestHour;
@property (readonly) NSInteger jf_hour;
@property (readonly) NSInteger jf_minute;
@property (readonly) NSInteger jf_seconds;
@property (readonly) NSInteger jf_day;
@property (readonly) NSInteger jf_month;
@property (readonly) NSInteger jf_week;
@property (readonly) NSInteger jf_weekday;
@property (readonly) NSInteger jf_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger jf_year;
@end
