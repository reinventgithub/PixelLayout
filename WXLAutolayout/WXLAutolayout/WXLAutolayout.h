//
//  WXLAutolayout.h
//  Reader
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCALE [WXLAutolayout scale]
#define scale(pxOrPt) [WXLAutolayout scaleWithPxOrPt:pxOrPt];
#define font(pt) [UIFont systemFontOfSize:pt]

typedef NS_ENUM(NSInteger, WXLPixelOrPoint) {
    point,
    pixel
};
static const NSString *NOTSCALE = @"NOTSCALE";
static const NSString *iPhone6 = @"iPhone6";
static const NSDictionary *deviceDict;
//默认WXLDesignScreenWidth为iPhone6
//static int screenWidthOfDesign = 375;
static CGFloat scale = 1;
//static NSInteger pixelOrPoint = point;
static NSInteger pixelToPoint;
//static BOOL isScale = 1;

@interface WXLAutolayout : NSObject
+ (void)setDevice:(NSString *)device;
+ (void)setDevice:(NSString *)device withPixel:(WXLPixelOrPoint)pixel;
+ (void)setDevice:(NSString *)device withPixel:(WXLPixelOrPoint)pixel andNotScale:(NSString *)NOTSACLE;
+ (CGFloat)scale;
+ (CGFloat)scaleWithPxOrPt:(CGFloat)pxOrPt;
+ (UIFont *)scaleForFont:(CGFloat)pt;
//+ (CGFloat)scaleWithDevice:(WXLDeviceOfDesign)device;
@end
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