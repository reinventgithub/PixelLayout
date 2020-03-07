//
//  PixelLayout.m
//  PixelLayout
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "PixelLayout.h"
#import <sys/utsname.h>

@implementation PixelLayout

static const NSDictionary *deviceDict;
static double scale               = 1;
static double verticalScale       = 1;
static double fontScale           = 1;
static NSInteger pixelToPoint     = 1;
static NSInteger fontPixelToPoint = 1;
static double _preScale;

+ (void)load {
    deviceDict = @{
                   @"iPhone"      : @[@320, @480,  @1],
                   @"iPhone3G"    : @[@320, @480,  @1],
                   @"iPhone3GS"   : @[@320, @480,  @1],
                   @"iPhone4"     : @[@320, @480,  @2],
                   @"iPhone4S"    : @[@320, @480,  @2],
                   @"iPhone5"     : @[@320, @568,  @2],
                   @"iPhone5s"    : @[@320, @568,  @2],
                   @"iPhone6"     : @[@375, @667,  @2],
                   @"iPhone6Plus" : @[@414, @736,  @3],
                   @"iPhone6s"    : @[@375, @667,  @2],
                   @"iPhone6sPlus": @[@414, @736,  @3],
                   @"iPad"        : @[@768, @1024, @1],
                   @"iPad2"       : @[@768, @1024, @1],
                   @"iPad3"       : @[@768, @1024, @2],
                   @"iPad4"       : @[@768, @1024, @2],
                   @"iPadAir"     : @[@768, @1024, @1],
                   @"iPadAir2"    : @[@768, @1024, @2],
                   @"iPadMini1G"  : @[@768, @1024, @1],
                   @"iPadMini2"   : @[@768, @1024, @2],
                   @"iPadMini3"   : @[@768, @1024, @2],
                  };
    
    NSString *device;
    NSInteger isPixel;
    NSInteger isScale;
    
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
    device = iPhone5s;
#endif
#ifdef IPHONE6
    device = iPhone6;
#endif
#ifdef IPHONE6PLUS
    device = iPhone6Plus;
#endif
#ifdef IPHONE6s
    device = iPhone6s;
#endif
#ifdef IPHONE6PLUS
    device = iPhone6sPlus;
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

+ (void)setDevice:(NSString *)device isPixel:(PLPixelOrPoint)isPixel isScale:(PLScale)isScale {
    [self setDevice:device isPixel:isPixel isScale:isScale unlayoutHeight:0];
}

+ (void)setDevice:(NSString *)device isPixel:(PLPixelOrPoint)isPixel isScale:(PLScale)isScale unlayoutHeight:(NSInteger)unlayoutHeight {
    [self setDevice:device isPixel:isPixel isScale:isScale unlayoutHeight:0 preScale:1];
}

+ (void)setDevice:(NSString *)device isPixel:(PLPixelOrPoint)isPixel isScale:(PLScale)isScale unlayoutHeight:(NSInteger)unlayoutHeight preScale:(double)preScale {
    _preScale = preScale;
    NSArray *array = deviceDict[device];
    NSNumber *designScreenWidth = array[0];
    NSNumber *designScreenHeight = array[1];
    NSNumber *multiple = array[2];
    
    if(isPixel == point) {
        pixelToPoint = point;
        fontPixelToPoint = point;
    }
    else if (isPixel == pixel) {
        pixelToPoint = [multiple integerValue];
        fontPixelToPoint = point;
    }
    else if (isPixel == pixelWithFont) {
        pixelToPoint = [multiple integerValue];
        fontPixelToPoint = [multiple integerValue];
    }
    
    double currentScreenWidth;
    double currentScreenHeight;
    //    NSInteger interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    //    if (interfaceOrientation == UIDeviceOrientationPortrait || interfaceOrientation == UIDeviceOrientationPortraitUpsideDown) {
    //        currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
    //        currentScreenHeight = [UIScreen mainScreen].bounds.size.height;
    //    }
    //    else {
    //        currentScreenHeight = [UIScreen mainScreen].bounds.size.width;
    //        currentScreenWidth = [UIScreen mainScreen].bounds.size.height;
    //    }
    currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        currentScreenHeight = 568;
    }
    else {
        currentScreenHeight = [UIScreen mainScreen].bounds.size.height;
    }

    if (isScale == notScale) {
        scale = notScale;
        fontScale = notScale;
    }
    else if(isScale == iPadScale) {
        if ([[self getCurrentDeviceModel] hasPrefix:@"iPad"]) {
            scale = currentScreenWidth / [designScreenWidth integerValue];
            verticalScale = (currentScreenHeight-unlayoutHeight) / ([designScreenHeight integerValue]-unlayoutHeight);
            fontScale = notScale;
        }
    }
    else if(isScale == iPadScaleWithFont) {
        if ([[self getCurrentDeviceModel] hasPrefix:@"iPad"]) {
            scale = currentScreenWidth / [designScreenWidth integerValue];
            verticalScale = (currentScreenHeight-unlayoutHeight) / ([designScreenHeight integerValue]-unlayoutHeight);
            fontScale = scale;
        }
    }
    else if(isScale == allScale) {
        scale = currentScreenWidth / [designScreenWidth integerValue];
        verticalScale = (currentScreenHeight-unlayoutHeight) / ([designScreenHeight integerValue]-unlayoutHeight);
        fontScale = notScale;
    }
    else if(isScale == allScaleWithFont) {
        scale = currentScreenWidth / [designScreenWidth integerValue];
        verticalScale = (currentScreenHeight-unlayoutHeight) / ([designScreenHeight integerValue]-unlayoutHeight);
        fontScale = scale;
    }
}

+ (double)layout:(double)pxOrPt {
    return pxOrPt / pixelToPoint * scale;
}

+ (double)partLayout:(double)pxOrPt unLayoutPart:(double)unLayout {
    return (pxOrPt - unLayout) / pixelToPoint * scale + unLayout / pixelToPoint;
}

+ (double)prelayout:(double)pxOrPt {
    return pxOrPt / pixelToPoint * scale * _preScale;
}

+ (double)layoutPxToPx:(double)px {
    return px * scale;
}

+ (double)layoutV:(double)pxOrPt {
    return pxOrPt / pixelToPoint * verticalScale;
}

+ (double)prelayoutV:(double)pxOrPt {
    return pxOrPt / pixelToPoint * verticalScale * _preScale;
}

+ (double)unlayout:(double)pxOrPt {
    return pxOrPt / scale;
}

+ (double)preunlayout:(double)pxOrPt {
    return pxOrPt / scale * _preScale;
}

+ (double)layoutY:(double)y withHeight:(double)height {
    return (y*verticalScale + (height*verticalScale - height*scale)/2) / pixelToPoint;
}

+ (double)prelayoutY:(double)y withHeight:(double)height {
    return (y*verticalScale + (height*verticalScale - height*scale)/2) / pixelToPoint * _preScale;
}

+ (UIFont *)font:(double)pxOrPt {
    return [UIFont systemFontOfSize:pxOrPt / fontPixelToPoint * fontScale];
}

+ (NSString *)pixelToPointString:(double)px {
    return [NSString stringWithFormat:@"%.2f", px / pixelToPoint];
}

+ (double)pixelToPoint:(double)px {
    return px / pixelToPoint;
}

CGSize PLCGSizeMake(CGFloat width, CGFloat height) {
    CGSize size;
    size.width = layout(width);
    size.height = layoutV(height);
    return size;
}

CGRect PLCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect rect;
    rect.origin.x = layout(x);
    rect.origin.y = layoutV(y);
    rect.size.width = layout(width);
    rect.size.height = layoutV(height);
    return rect;
}

CGRect PLPreScaleCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect rect;
    rect.origin.x = layout(x);
    rect.origin.y = prelayoutV(y);
    rect.size.width = layout(width);
    rect.size.height = prelayoutV(height);
    return rect;
}

CGRect PLImageCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect rect;
    rect.origin.x = layout(x);
    rect.origin.y = layoutV(y)+(layoutV(height)-layout(height))/2;
    rect.size.width = layout(width);
    rect.size.height = layout(height);
    return rect;
}

CGRect PLPreScaleImageCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGRect rect;
    rect.origin.x = layout(x);
    rect.origin.y = (layoutV(y)+(layoutV(height)-layoutV(height))/2) * _preScale;
    rect.size.width = layout(width);
    rect.size.height = layout(height) * _preScale;
    return rect;
}


+ (NSString *)getCurrentDeviceModel {
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
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone6sPlus";

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
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPadMini4";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPadMini4";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPodTouch";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPodTouch2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPodTouch3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPodTouch4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPodTouch5G";
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPodTouch6G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhoneSimulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhoneSimulator";
    
    return platform;
}

@end
