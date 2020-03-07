//
//  PixelLayout.h
//  PixelLayout
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define layout(PxOrPt) [PixelLayout layout:PxOrPt]
#define layoutV(PxOrPt) [PixelLayout layoutV:PxOrPt]
#define layoutY(Y, Width) [PixelLayout layoutY:Y withWidth:Width]
#define unlayout(PxOrPt) [PixelLayout unlayout:PxOrPt]
#define font(PxOrPt) [PixelLayout font:PxOrPt]

typedef NS_ENUM(NSInteger, PLPixelOrPoint) {
    point = 1,
    pixel,
    pixelWithFont,
};

typedef NS_ENUM(NSInteger, PLScale) {
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

@interface PixelLayout : NSObject

+ (void)setDevice:(NSString *)device isPixel:(PLPixelOrPoint)pixel isScale:(PLScale)isScale;
+ (double)layout:(double)pxOrPt;
+ (double)layoutV:(double)pxOrPt;
+ (double)layoutY:(double)y withWidth:(double)width;
+ (double)unlayout:(double)pxOrPt;
+ (UIFont *)font:(double)pxOrPt;
CGRect PLCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);

@end
