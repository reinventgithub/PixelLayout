//
//  WXLAutolayout.m
//  WXLAutolayout
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLAutolayout.h"
#import <sys/utsname.h>

//默认WXLDesignScreenWidth为iPhone6
//static int screenWidthOfDesign = 375;
//static NSInteger pixelOrPoint = point;
//static BOOL isScale = 1;

@implementation WXLAutolayout
+(void)load
{
    deviceDict = @{
                   @"iPhone"        : @[@320, @1],
                   @"iPhone3G"      : @[@320, @1],
                   @"iPhone3GS"     : @[@320, @1],
                   @"iPhone4"       : @[@320, @2],
                   @"iPhone4S"      : @[@320, @2],
                   @"iPhone5"       : @[@320, @2],
                   @"iPhone5S"      : @[@320, @2],
                   @"iPhone6"       : @[@375, @2],
                   @"iPhone6Plus"   : @[@414, @3],
                   @"iPad"          : @[@768, @1],
                   @"iPad2"         : @[@768, @1],
                   @"iPad3"         : @[@768, @2],
                   @"iPad4"         : @[@768, @2],
                   @"iPadAir"       : @[@768, @1],
                   @"iPadAir2"      : @[@768, @2],
                   @"iPadMini1G"    : @[@768, @1],
                   @"iPadMini2"     : @[@768, @2],
                   @"iPadMini3"     : @[@768, @2]
                   };
}

//+ (void)setDevice:(NSString *)device
//{
//    NSArray *array = deviceDict[device];
//    NSNumber *designScreenWidth = array[0];
//    if ([designScreenWidth integerValue]) {
//        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
//        scale = currentScreenWidth/[designScreenWidth integerValue];
//    } else {
//        scale = 1;
//    }
//}
//
//+ (void)setDevice:(NSString *)device withPixel:(WXLPixelOrPoint)pixel
//{
//    NSArray *array = deviceDict[device];
//    NSNumber *designScreenWidth = array[0];
//    NSNumber *multiple = array[1];
//    if ([designScreenWidth integerValue]) {
//        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
//        scale = currentScreenWidth/[designScreenWidth integerValue];
//        if (pixel) {
//            pixelToPoint = [multiple integerValue];
//        }
//    } else {
//        scale = 1;
//    }
//}

+ (void)setDevice:(NSString *)device isPixel:(WXLPixelOrPoint)isPixel isScale:(WXLScale)isScale
{
    NSArray *array = deviceDict[device];
    NSNumber *designScreenWidth = array[0];
    NSNumber *multiple = array[1];
    
    if (isPixel == pixel) {
        pixelToPoint = [multiple integerValue];
        powerLog(pixelToPoint);
    } else if (isPixel == pixelWithFont) {
        pixelToPoint = [multiple integerValue];
        fontPixelToPoint = [multiple integerValue];
    }
    
    if(isScale == iPadScale) {
        if ([[WXLAutolayout getCurrentDeviceModel] hasPrefix:@"iPad"]) {
            CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
            scale = currentScreenWidth/[designScreenWidth integerValue];
        }
    } else if(isScale == iPadScaleWithFont) {
        if ([[WXLAutolayout getCurrentDeviceModel] hasPrefix:@"iPad"]) {
            CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
            scale = currentScreenWidth/[designScreenWidth integerValue];
            fontScale = scale;
        }
    } else if(isScale == allScale) {
        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
        scale = currentScreenWidth/[designScreenWidth integerValue];
    } else if(isScale == allScaleWithFont) {
        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
        scale = currentScreenWidth/[designScreenWidth integerValue];
        fontScale = scale;
    }
}

+ (CGFloat)scale
{
    return scale;
}

+ (CGFloat)pxToPt:(CGFloat)px
{
    return px / pixelToPoint;
}

+ (CGFloat)scaleWithPxOrPt:(CGFloat)pxOrPt
{
    return pxOrPt / pixelToPoint * scale;
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
    powerLog(platform);
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad Mini 3";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
}

//+ (UIFont *)fontWithPxOrPt:(CGFloat)pxOrPt
//{
//    return [UIFont systemFontOfSize:pxOrPt/pixelToPoint];
//}
//
//+ (UIFont *)scaleForFont:(CGFloat)pxOrPt
//{
//    return [UIFont systemFontOfSize:pxOrPt*scale];
//}

//+ (CGFloat)scaleWithDevice:(WXLDeviceOfDesign)device
//{
//    if (device != screenWidthOfDesign) {
//        [WXLAutolayout setDevice:device];
//    }
//    return scale;
//}

//+ (void)load
//{
//#ifdef iPhone
//    WXLDesignscreenWidth = 320;
//#endif
//#ifdef iPhone3G
//    WXLDesignscreenWidth = 320;
//#endif
//#ifdef iPhone3GS
//    WXLDesignscreenWidth = 320;
//#endif
//#ifdef iPhone4
//    WXLDesignscreenWidth = 320;
//#endif
//#ifdef iPhone4S
//    WXLDesignscreenWidth = 320;
//#endif
//#ifdef iPhone5
//    WXLDesignscreenWidth = 320;
//#endif
//#ifdef iPhone5S
//    WXLDesignscreenWidth = 320;
//#endif
//#ifdef iPhone6
//#endif
//#ifdef iPhone6Plus
//    WXLDesignScreenWidth = 414;
//#endif
//#ifdef iPad
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef iPad2
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef ThenewiPad
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef iPadwithRetinadisplay
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef iPadmini
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef iPadmini2
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef iPadmini3
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef iPadAir
//    WXLDesignScreenWidth = 768;
//#endif
//#ifdef iPadAir2
//    WXLDesignScreenWidth = 768;
//#endif
//#ifndef NOTSCALE
//    CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
//    WXLScale = currentScreenWidth/(float)WXLDesignScreenWidth;
//#endif
//}
@end
