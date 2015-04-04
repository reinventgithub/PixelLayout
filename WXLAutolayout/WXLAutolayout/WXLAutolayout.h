//
//  WXLAutolayout.h
//  WXLAutolayout
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PowerLog.h"
#import "UIView+Extension.h"

#define SCALE [WXLAutolayout scale]
#define px(px) [WXLAutolayout pxToPt:px]
#define scale(pxOrPt) [WXLAutolayout scaleWithPxOrPt:pxOrPt]
#define layout(pxOrPt) [WXLAutolayout layout:pxOrPt]
#define font(pxOrPt) [WXLAutolayout font:pxOrPt]

#ifdef DEBUG
#define pixelLog(value) fprintf(stderr,"%s line:%d function:%s %s = %s\n", __TIME__, __LINE__, __FUNCTION__, (#value), [_pixelLog(@encode(__typeof__((value))), (value)) UTF8String])
#else
#define pixelLog(value)
#endif

static const NSDictionary *deviceDict;
static CGFloat scale = 1;
static CGFloat fontScale = 1;
static NSInteger pixelToPoint = 1;
static NSInteger fontPixelToPoint = 1;

static inline NSString* _pixelLog(const char *type, ...)
{
    va_list v;
    va_start(v, type);
    NSNumber *number;
    NSString *obj = nil;
    if (strcmp(type, @encode(id)) == 0) {
        id actual = va_arg(v, id);
        obj = [NSString stringWithFormat:@"%@", actual];
    } else if (strcmp(type, @encode(CGPoint)) == 0) {
        CGPoint actual = (CGPoint)va_arg(v, CGPoint);
        powerLog(pixelToPoint);
        actual.x *= pixelToPoint;
        actual.y *= pixelToPoint;
        obj = NSStringFromCGPoint(actual);
    } else if (strcmp(type, @encode(CGSize)) == 0) {
        CGSize actual = (CGSize)va_arg(v, CGSize);
        obj = NSStringFromCGSize(actual);
    } else if (strcmp(type, @encode(UIEdgeInsets)) == 0) {
        UIEdgeInsets actual = (UIEdgeInsets)va_arg(v, UIEdgeInsets);
        obj = NSStringFromUIEdgeInsets(actual);
    } else if (strcmp(type, @encode(double)) == 0) {
        double actual = (double)va_arg(v, double);
        number = [NSNumber numberWithDouble:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(float)) == 0) {
        float actual = (float)va_arg(v, double);
        number = [NSNumber numberWithFloat:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(int)) == 0) {
        int actual = (int)va_arg(v, int);
        number = [NSNumber numberWithInt:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(long)) == 0) {
        long actual = (long)va_arg(v, long);
        number = [NSNumber numberWithLong:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(long long)) == 0) {
        long long actual = (long long)va_arg(v, long long);
        number = [NSNumber numberWithLongLong:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(short)) == 0) {
        short actual = (short)va_arg(v, int);
        number = [NSNumber numberWithShort:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(char)) == 0) {
        char actual = (char)va_arg(v, int);
        number = [NSNumber numberWithChar:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(bool)) == 0) {
        bool actual = (bool)va_arg(v, int);
        number = [NSNumber numberWithBool:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(unsigned char)) == 0) {
        unsigned char actual = (unsigned char)va_arg(v, unsigned int);
        number = [NSNumber numberWithUnsignedChar:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(unsigned int)) == 0) {
        unsigned int actual = (unsigned int)va_arg(v, unsigned int);
        number = [NSNumber numberWithUnsignedInt:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(unsigned long)) == 0) {
        unsigned long actual = (unsigned long)va_arg(v, unsigned long);
        number = [NSNumber numberWithUnsignedLong:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(unsigned long long)) == 0) {
        unsigned long long actual = (unsigned long long)va_arg(v, unsigned long long);
        number = [NSNumber numberWithUnsignedLongLong:actual];
        obj = [number stringValue];
    } else if (strcmp(type, @encode(unsigned short)) == 0) {
        unsigned short actual = (unsigned short)va_arg(v, unsigned int);
        number =  [NSNumber numberWithUnsignedShort:actual];
        obj = [number stringValue];
    }
    va_end(v);
    return obj;
}

typedef NS_ENUM(NSInteger, WXLPixelOrPoint) {
    point,
    pixel,
    pixelWithFont,
};

typedef NS_ENUM(NSInteger, WXLScale) {
    notScale,
    iPadScale,
    iPadScaleWithFont,
    allScale,
    allScaleWithFont
};

static NSString *const iPhone      = @"iPhone";
static NSString *const iPhone3G    = @"iPhone3G";
static NSString *const iPhone3GS   = @"iPhone3GS";
static NSString *const iPhone4     = @"iPhone4";
static NSString *const iPhone4S    = @"iPhone4S";
static NSString *const iPhone5     = @"iPhone5";
static NSString *const iPhone6     = @"iPhone6";
static NSString *const iPhone6Plus = @"iPhone6Plus";
static NSString *const iPad        = @"iPad";
static NSString *const iPad2       = @"iPad2";
static NSString *const iPad3       = @"iPad3";
static NSString *const iPad4       = @"iPad4";
static NSString *const iPadAir     = @"iPadAir";
static NSString *const iPadAir2    = @"iPadAir2";
static NSString *const iPadMini1G  = @"iPadMini1G";
static NSString *const iPadMini2   = @"iPadMini2";
static NSString *const iPadMini3   = @"iPadMini3";

@interface WXLAutolayout : NSObject
//+ (void)setDevice:(NSString* const)device;
//+ (void)setDevice:(NSString* const)device withPixel:(WXLPixelOrPoint)pixel;
+ (void)setDevice:(NSString* const)device isPixel:(WXLPixelOrPoint)pixel isScale:(WXLScale)isScale;

+ (CGFloat)scale;
+ (CGFloat)pxToPt:(CGFloat)px;
+ (CGFloat)scaleWithPxOrPt:(CGFloat)pxOrPt;
+ (CGFloat)layout:(CGFloat)pxOrPt;
+ (UIFont *)font:(CGFloat)pxOrPt;
@end

//+ (UIFont *)scaleForFont:(CGFloat)pxOrPt;
//+ (UIFont *)fontWithPxOrPt:(CGFloat)pxOrPt;
//+ (CGFloat)scaleWithDevice:(WXLDeviceOfDesign)device;

//#define WXLNOTSCALE [WXLAutolayout setDevice:NOTSCALE]
//#define WXLiPhone [WXLAutolayout setDevice:iPhone]
//#define WXLiPhone3G [WXLAutolayout setDevice:iPhone3G]
//#define WXLiPhone3GS [WXLAutolayout setDevice:iPhone3GS]
//#define WXLiPhone4 [WXLAutolayout setDevice:iPhone4]
//#define WXLiPhone4S [WXLAutolayout setDevice:iPhone4S]
//#define WXLiPhone5 [WXLAutolayout setDevice:iPhone5]
//#define WXLiPhone5S [WXLAutolayout setDevice:iPhone5S]
//#define WXLiPhone6 [WXLAutolayout setDevice:iPhone6]
//#define WXLiPhone6Plus [WXLAutolayout setDevice:iPhone6Plus]
//#define WXLiPad [WXLAutolayout setDevice:iPad]
//#define WXLiPad2 [WXLAutolayout setDevice:iPad2]
//#define WXLTheNewiPad [WXLAutolayout setDevice:TheNewiPad]
//#define WXLiPadWithRetinaDisplay [WXLAutolayout setDevice:iPadWithRetinaDisplay]
//#define WXLiPadAir [WXLAutolayout setDevice:iPadAir]
//#define WXLiPadAir2 [WXLAutolayout setDevice:iPadAir2]
//#define WXLiPadMini [WXLAutolayout setDevice:iPadMini]
//#define WXLiPadMini2 [WXLAutolayout setDevice:iPadMini2]
//#define WXLiPadMini3 [WXLAutolayout setDevice:iPadMini3]
//#define WXLiPhone [WXLAutolayout scaleWithDevice:iPhone]
//#define WXLiPhone3G [WXLAutolayout scaleWithDevice:iPhone3G]
//#define WXLiPhone3GS [WXLAutolayout scaleWithDevice:iPhone3GS]
//#define WXLiPhone4 [WXLAutolayout scaleWithDevice:iPhone4]
//#define WXLiPhone4S [WXLAutolayout scaleWithDevice:iPhone4S]
//#define WXLiPhone5 [WXLAutolayout scaleWithDevice:iPhone5]
//#define WXLiPhone5S [WXLAutolayout scaleWithDevice:iPhone5S]
//#define WXLiPhone6 [WXLAutolayout scaleWithDevice:iPhone6]
//#define WXLiPhone6Plus [WXLAutolayout scaleWithDevice:iPhone6Plus]
//#define WXLiPad [WXLAutolayout scaleWithDevice:iPad]
//#define WXLiPad2 [WXLAutolayout scaleWithDevice:iPad2]
//#define WXLTheNewiPad [WXLAutolayout scaleWithDevice:TheNewiPad]
//#define WXLiPadWithRetinaDisplay [WXLAutolayout scaleWithDevice:iPadWithRetinaDisplay]
//#define WXLiPadAir [WXLAutolayout scaleWithDevice:iPadAir]
//#define WXLiPadAir2 [WXLAutolayout scaleWithDevice:iPadAir2]
//#define WXLiPadMini [WXLAutolayout scaleWithDevice:iPadMini]
//#define WXLiPadMini2 [WXLAutolayout scaleWithDevice:iPadMini2]
//#define WXLiPadMini3 [WXLAutolayout scaleWithDevice:iPadMini3]


//typedef NS_ENUM(NSInteger, WXLDeviceOfDesign) {
//    NOTSCALE              = 0,
//    iPhone                = 320,
//    iPhone3G              = 320,
//    iPhone3GS             = 320,
//    iPhone4               = 320,
//    iPhone4S              = 320,
//    iPhone5               = 320,
//    iPhone5S              = 320,
//    iPhone6               = 375,
//    iPhone6Plus           = 414,
//    iPad                  = 768,
//    iPad2                 = 768,
//    TheNewiPad            = 768,
//    iPadWithRetinaDisplay = 768,
//    iPadAir               = 768,
//    iPadAir2              = 768,
//    iPadMini              = 768,
//    iPadMini2             = 768,
//    iPadMini3             = 768
//};