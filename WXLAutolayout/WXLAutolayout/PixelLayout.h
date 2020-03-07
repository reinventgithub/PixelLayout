//
//  WXLAutolayout.h
//  WXLAutolayout
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define layout(pxOrPt) [WXLAutolayout layout:pxOrPt]
#define font(pxOrPt) [WXLAutolayout font:pxOrPt]

typedef NS_ENUM(NSInteger, WXLPixelOrPoint) {
    point = 1,
    pixel,
    pixelWithFont,
};

typedef NS_ENUM(NSInteger, WXLScale) {
    notScale = 1,
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

+ (void)setDevice:(NSString *)device isPixel:(WXLPixelOrPoint)pixel isScale:(WXLScale)isScale;
+ (CGFloat)layout:(CGFloat)pxOrPt;
+ (UIFont *)font:(CGFloat)pxOrPt;

@end
