//
//  LKLog.m
//  Pods
//
//  Created by Rizwan Sattar on 1/23/15.
//
//

#import "LKLog.h"

BOOL LKLOG_ENABLED = NO;

// See: http://stackoverflow.com/a/3530807/9849
static inline void LKLogFormat(NSString *level, NSString *format, va_list arg_list) {
    NSString *msg = [[NSString alloc] initWithFormat:format arguments:arg_list];
    if (level) {
        NSLog(@"[LaunchKit][%@] %@", level, msg);
    } else {
        NSLog(@"[LaunchKit] %@", msg);
    }
}

void LKLog(NSString *format, ...)
{
#if DEBUG
    if (LKLOG_ENABLED) {
        __block va_list arg_list;
        va_start (arg_list, format);
        LKLogFormat(nil, format, arg_list);
        va_end(arg_list);
    }
#endif
}

void LKLogWarning(NSString *format, ...)
{
#if DEBUG
    if (LKLOG_ENABLED) {
        __block va_list arg_list;
        va_start (arg_list, format);
        LKLogFormat(@"warn", format, arg_list);
        va_end(arg_list);
    }
#endif
}

void LKLogError(NSString *format, ...)
{
#if DEBUG
    __block va_list arg_list;
    va_start (arg_list, format);
    LKLogFormat(@"error", format, arg_list);
    va_end(arg_list);
#endif
}