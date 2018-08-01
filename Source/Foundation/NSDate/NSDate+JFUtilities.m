/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook 3.x and beyond
 BSD License, Use at your own risk
 */

/*
 #import <humor.h> : Not planning to implement: dateByAskingBoyOut and dateByGettingBabysitter
 ----
 General Thanks: sstreza, Scott Lawrence, Kevin Ballard, NoOneButMe, Avi`, August Joki. Lily Vulcano, jcromartiej,
 Blagovest Dachev, Matthias Plappert,  Slava Bushtruk, Ali Servet Donmez, Ricardo1980, pip8786, Danny Thuerin, Dennis
 Madsen

 Include GMT and time zone utilities?
*/

#import "NSDate+JFUtilities.h"

// Thanks, AshFurrow
static const unsigned componentFlags =
                              (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitHour |
                                      NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (JFUtilities)

// Courtesy of Lukasz Margielewski
// Updated via Holger Haenisch
+ (NSCalendar *)jf_currentCalendar
{
    static NSCalendar *sharedCalendar   = nil;
    if (!sharedCalendar) sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - Relative Dates

+ (NSDate *)jf_dateWithDaysFromNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] jf_dateByAddingDays:days];
}

+ (NSDate *)jf_dateWithDaysBeforeNow:(NSInteger)days
{
    // Thanks, Jim Morrison
    return [[NSDate date] jf_dateBySubtractingDays:days];
}

+ (NSDate *)jf_dateTomorrow
{
    return [NSDate jf_dateWithDaysFromNow:1];
}

+ (NSDate *)jf_dateYesterday
{
    return [NSDate jf_dateWithDaysBeforeNow:1];
}

+ (NSDate *)jf_dateWithHoursFromNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)jf_dateWithHoursBeforeNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)jf_dateWithMinutesFromNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)jf_dateWithMinutesBeforeNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *)jf_stringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *)jf_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle        = dateStyle;
    formatter.timeStyle        = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *)jf_shortString
{
    return [self jf_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)jf_shortTimeString
{
    return [self jf_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)jf_shortDateString
{
    return [self jf_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)jf_mediumString
{
    return [self jf_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)jf_mediumTimeString
{
    return [self jf_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)jf_mediumDateString
{
    return [self jf_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)jf_longString
{
    return [self jf_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)jf_longTimeString
{
    return [self jf_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)jf_longDateString
{
    return [self jf_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL)jf_isEqualToDateIgnoringTime:(NSDate *)aDate
{
    NSDateComponents *components1 = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate jf_currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) && (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL)jf_isToday
{
    return [self jf_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)jf_isTomorrow
{
    return [self jf_isEqualToDateIgnoringTime:[NSDate jf_dateTomorrow]];
}

- (BOOL)jf_isYesterday
{
    return [self jf_isEqualToDateIgnoringTime:[NSDate jf_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL)jf_isSameWeekAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate jf_currentCalendar] components:componentFlags fromDate:aDate];

    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfYear != components2.weekOfYear) return NO;

    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs(floor([self timeIntervalSinceDate:aDate])) < D_WEEK);
}

- (BOOL)jf_isThisWeek
{
    return [self jf_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)jf_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self jf_isSameWeekAsDate:newDate];
}

- (BOOL)jf_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self jf_isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL)jf_isSameMonthAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 =
                             [[NSDate jf_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 =
                             [[NSDate jf_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) && (components1.year == components2.year));
}

- (BOOL)jf_isThisMonth
{
    return [self jf_isSameMonthAsDate:[NSDate date]];
}

// Thanks Marcin Krzyzanowski, also for adding/subtracting years and months
- (BOOL)jf_isLastMonth
{
    return [self jf_isSameMonthAsDate:[[NSDate date] jf_dateBySubtractingMonths:1]];
}

- (BOOL)jf_isNextMonth
{
    return [self jf_isSameMonthAsDate:[[NSDate date] jf_dateByAddingMonths:1]];
}

- (BOOL)jf_isSameYearAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [[NSDate jf_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate jf_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

- (BOOL)jf_isThisYear
{
    // Thanks, baspellis
    return [self jf_isSameYearAsDate:[NSDate date]];
}

- (BOOL)jf_isNextYear
{
    NSDateComponents *components1 = [[NSDate jf_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate jf_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];

    return (components1.year == (components2.year + 1));
}

- (BOOL)jf_isLastYear
{
    NSDateComponents *components1 = [[NSDate jf_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate jf_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];

    return (components1.year == (components2.year - 1));
}

- (BOOL)jf_isEarlierThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL)jf_isLaterThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL)jf_isInFuture
{
    return ([self jf_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL)jf_isInPast
{
    return ([self jf_isEarlierThanDate:[NSDate date]]);
}


#pragma mark - Roles
- (BOOL)jf_isTypicallyWeekend
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1) || (components.weekday == 7)) return YES;
    return NO;
}

- (BOOL)jf_isTypicallyWorkday
{
    return ![self jf_isTypicallyWeekend];
}

#pragma mark - Adjusting Dates

- (NSDate *)jf_changeYear:(NSInteger)year
                 month:(NSInteger)month
                   day:(NSInteger)day
                  hour:(NSInteger)hour
                minute:(NSInteger)minute
                second:(NSInteger)second
{
    NSCalendar *calendar             = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year              = year;
    dateComponents.month             = month;
    dateComponents.day               = day;
    dateComponents.hour              = hour;
    dateComponents.minute            = minute;
    dateComponents.second            = second;
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *)jf_beginningOfYear
{
    return [self jf_changeYear:self.jf_year month:1 day:1 hour:0 minute:0 second:0];
}

- (NSDate *)jf_beginningOfMonth
{
    return [self jf_changeYear:self.jf_year month:self.jf_month day:1 hour:0 minute:0 second:0];
}

- (NSDate *)jf_beginningOfDay
{
    return [self jf_changeYear:self.jf_year month:self.jf_month day:self.jf_day hour:0 minute:0 second:0];
}

- (NSDate *)jf_endOfYear
{
    return [self jf_changeYear:self.jf_year month:12 day:31 hour:23 minute:59 second:59];
}

- (NSDate *)jf_endOfMonth
{
    NSInteger lastDay =
                      [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
    return [self jf_changeYear:self.jf_year month:self.jf_month day:lastDay hour:23 minute:59 second:59];
}

- (NSDate *)jf_endOfDay
{
    return [self jf_changeYear:self.jf_year month:self.jf_month day:self.jf_day hour:23 minute:59 second:59];
}

// Thaks, rsjohnson
- (NSDate *)jf_dateByAddingYears:(NSInteger)dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)jf_dateBySubtractingYears:(NSInteger)dYears
{
    return [self jf_dateByAddingYears:-dYears];
}

- (NSDate *)jf_dateByAddingMonths:(NSInteger)dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)jf_dateBySubtractingMonths:(NSInteger)dMonths
{
    return [self jf_dateByAddingMonths:-dMonths];
}

// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *)jf_dateByAddingDays:(NSInteger)dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)jf_dateBySubtractingDays:(NSInteger)dDays
{
    return [self jf_dateByAddingDays:(dDays * -1)];
}

- (NSDate *)jf_dateByAddingHours:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)jf_dateBySubtractingHours:(NSInteger)dHours
{
    return [self jf_dateByAddingHours:(dHours * -1)];
}

- (NSDate *)jf_dateByAddingMinutes:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)jf_dateBySubtractingMinutes:(NSInteger)dMinutes
{
    return [self jf_dateByAddingMinutes:(dMinutes * -1)];
}

- (NSDateComponents *)jf_componentsWithOffsetFromDate:(NSDate *)aDate
{
    NSDateComponents *dTime = [[NSDate jf_currentCalendar] components:componentFlags fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

+ (NSDate *)jf_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSCalendar *calendar             = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year              = year;
    dateComponents.month             = month;
    dateComponents.day               = day;
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *)jf_dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    components.hour              = 0;
    components.minute            = 0;
    components.second            = 0;
    return [[NSDate jf_currentCalendar] dateFromComponents:components];
}

// Thanks gsempe & mteece
- (NSDate *)jf_dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    components.hour              = 23; // Thanks Aleksey Kononov
    components.minute            = 59;
    components.second            = 59;
    return [[NSDate jf_currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger)jf_minutesAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_MINUTE);
}

- (NSInteger)jf_minutesBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_MINUTE);
}

- (NSInteger)jf_hoursAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_HOUR);
}

- (NSInteger)jf_hoursBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_HOUR);
}

- (NSInteger)jf_daysAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / D_DAY);
}

- (NSInteger)jf_daysBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger)(ti / D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)jf_distanceInDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components =
                       [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}

#pragma mark - Decomposing Dates

- (NSInteger)jf_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

- (NSInteger)jf_hour
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

- (NSInteger)jf_minute
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

- (NSInteger)jf_seconds
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

- (NSInteger)jf_day
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

- (NSInteger)jf_month
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

- (NSInteger)jf_week
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfYear;
}

- (NSInteger)jf_weekday
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

- (NSInteger)jf_nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger)jf_year
{
    NSDateComponents *components = [[NSDate jf_currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}
@end
