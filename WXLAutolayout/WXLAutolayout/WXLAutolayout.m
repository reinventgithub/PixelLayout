//
//  WXLAutolayout.m
//  WXLAutolayout
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLAutolayout.h"
#import <sys/utsname.h>

static const NSDictionary *deviceDict;
static CGFloat scale              = 1;
static CGFloat fontScale          = 1;
static NSInteger pixelToPoint     = 1;
static NSInteger fontPixelToPoint = 1;
static NSString *device;
static NSInteger isPixel;
static NSInteger isScale;

@implementation WXLAutolayout

+(void)load
{
    deviceDict = @{
                   @"iPhone"      : @[@320, @480, @1],
                   @"iPhone3G"    : @[@320, @480, @1],
                   @"iPhone3GS"   : @[@320, @480, @1],
                   @"iPhone4"     : @[@320, @480, @2],
                   @"iPhone4S"    : @[@320, @480, @2],
                   @"iPhone5"     : @[@320, @480, @2],
                   @"iPhone5S"    : @[@320, @480, @2],
                   @"iPhone6"     : @[@375, @667, @2],
                   @"iPhone6Plus" : @[@414, @736, @3],
                   @"iPad"        : @[@768, @1024, @1],
                   @"iPad2"       : @[@768, @1024, @1],
                   @"iPad3"       : @[@768, @1024, @2],
                   @"iPad4"       : @[@768, @1024, @2],
                   @"iPadAir"     : @[@768, @1024, @1],
                   @"iPadAir2"    : @[@768, @1024, @2],
                   @"iPadMini1G"  : @[@768, @1024, @1],
                   @"iPadMini2"   : @[@768, @1024, @2],
                   @"iPadMini3"   : @[@768, @1024, @2]
                  };
    
#ifdef IPHONE
    device = iPhone;
#endif
#ifdef IPHONE3G
    device = iPhone3G;
#endif
#ifdef IPHONE3GS
    device = iPhone3GS;
#endif
#ifdef IPHONE4
    device = iPhone4;
#endif
#ifdef IPHONE4S
    device = iPhone4S;
#endif
#ifdef IPHONE5
    device = iPhone5;
#endif
#ifdef IPHONE5S
    device = iPhone5S;
#endif
#ifdef IPHONE6
    device = iPhone6;
#endif
#ifdef IPHONE6PLUS
    device = iPhone6Plus;
#endif
#ifdef IPAD
    device = iPad;
#endif
#ifdef IPAD2
    device = iPad2;
#endif
#ifdef IPAD3
    device = iPad3;
#endif
#ifdef IPAD4
    device = iPad4;
#endif
#ifdef IPADAIR
    device = iPadAir;
#endif
#ifdef IPADAIR2
    device = iPadAir2;
#endif
#ifdef IPADMINI1G
    device = iPadMini1G;
#endif
#ifdef IPADMINI2
    device = iPadMini2;
#endif
#ifdef IPADMINI3
    device = iPadMini3;
#endif

    
#ifdef POINT
    isPixel = point;
#endif
#ifdef PIXEL
    isPixel = pixel;
#endif
#ifdef PIXELWITHFONT
    isPixel = pixelWithFont;
#endif
    

#ifdef NOTSCALE
    isScale = notScale;
#endif
#ifdef IPADSCALE
    isScale = iPadScale;
#endif
#ifdef IPADSCALEWITHFONT
    isScale = iPadScaleWithFont;
#endif
#ifdef ALLSCALE
    isScale = allScale;
#endif
#ifdef ALLSCALEWITHFONT
    isScale = allScaleWithFont;
#endif
    
    [self setDevice:device isPixel:isPixel isScale:isScale];
}

+ (void)setDevice:(NSString *)device isPixel:(WXLPixelOrPoint)isPixel isScale:(WXLScale)isScale
{
    NSArray *array = deviceDict[device];
    NSNumber *designScreenWidth = array[0];
    NSNumber *multiple = array[2];
    
    if(isPixel == point)
    {
        pixelToPoint = point;
        fontPixelToPoint = point;
    } else if (isPixel == pixel) {
        pixelToPoint = [multiple integerValue];
        fontPixelToPoint = point;
    } else if (isPixel == pixelWithFont) {
        pixelToPoint = [multiple integerValue];
        fontPixelToPoint = [multiple integerValue];
    }
    
    CGFloat currentScreenWidth;
    NSInteger interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (interfaceOrientation == UIDeviceOrientationPortrait || interfaceOrientation == UIDeviceOrientationPortraitUpsideDown) {
        currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
    } else currentScreenWidth = [UIScreen mainScreen].bounds.size.height;
    if (isScale == notScale) {
        scale = notScale;
        fontScale = notScale;
    } else if(isScale == iPadScale) {
        if ([[self getCurrentDeviceModel] hasPrefix:@"iPad"]) {
            scale = currentScreenWidth / [designScreenWidth integerValue];
            fontScale = notScale;
        }
    } else if(isScale == iPadScaleWithFont) {
        if ([[self getCurrentDeviceModel] hasPrefix:@"iPad"]) {
            scale = currentScreenWidth / [designScreenWidth integerValue];
            fontScale = scale;
        }
    } else if(isScale == allScale) {
        scale = currentScreenWidth / [designScreenWidth integerValue];
        fontScale = notScale;
    } else if(isScale == allScaleWithFont) {
        scale = currentScreenWidth / [designScreenWidth integerValue];
        fontScale = scale;
    }
}

+ (CGFloat)layout:(CGFloat)pxOrPt
{
    return pxOrPt / pixelToPoint * scale;
}

+ (UIFont *)font:(CGFloat)pxOrPt
{
    return [UIFont systemFontOfSize:pxOrPt / fontPixelToPoint * fontScale];
}

+ (NSString *)getCurrentDeviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone6Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone6";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad2";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad4";
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPadAir";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPadAir2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPadAir2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPadMini1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPadMini1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPadMini1G";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPadMini2";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPadMini2";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPadMini2";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPadMini3";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPadMini3";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPadMini3";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPodTouch";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPodTouch2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPodTouch3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPodTouch4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPodTouch5G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhoneSimulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhoneSimulator";
    
    return platform;
}

@end
