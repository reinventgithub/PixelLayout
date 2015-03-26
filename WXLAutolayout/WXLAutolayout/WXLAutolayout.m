//
//  WXLAutolayout.m
//  Reader
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLAutolayout.h"
#import <sys/sysctl.h>
#import <sys/utsname.h>

@implementation WXLAutolayout
+(void)load
{
    deviceDict = @{@"NOSCALE" : @[@0, @0],
                   @"SCALE"   : @[@1, @0],
                   @"iPhone6" : @[@375, @2]};
}

+ (void)setDevice:(NSString *)device
{
    NSArray *array = deviceDict[device];
    NSNumber *designScreenWidth = array[0];
    if ([designScreenWidth integerValue]) {
        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
        scale = currentScreenWidth/[designScreenWidth integerValue];
    } else {
        scale = 1;
//        screenWidthOfDesign = NOTSCALE;
    }
}

+ (void)setDevice:(NSString *)device withPixel:(WXLPixelOrPoint)pixel
{
    NSArray *array = deviceDict[device];
    NSNumber *designScreenWidth = array[0];
    NSNumber *multiple = array[1];
    if ([designScreenWidth integerValue]) {
        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
        scale = currentScreenWidth/[designScreenWidth integerValue];
        if (pixel) {
            pixelToPoint = [multiple integerValue];
        }
    } else {
        scale = 1;
        //        screenWidthOfDesign = NOTSCALE;
    }
}

+ (void)setDevice:(NSString *)device withPixel:(WXLPixelOrPoint)pixel andNotScale:(NSString *)NOTSACLE
{
    NSArray *array = deviceDict[NOTSACLE];
    NSNumber *isScale = array[0];
    if ([isScale integerValue]) {
        NSArray *array = deviceDict[device];
        NSNumber *designScreenWidth = array[0];
        NSNumber *multiple = array[1];
        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
        scale = currentScreenWidth/[designScreenWidth integerValue];
        if (pixel) {
            pixelToPoint = [multiple integerValue];
        }
    } else {
        
    }
}

+ (CGFloat)scale
{
    
    return scale;
}

+ (CGFloat)scaleWithPxOrPt:(CGFloat)pxOrPt
{
    return pxOrPt/pixelToPoint*scale;
}

+ (UIFont *)scaleForFont:(CGFloat)size
{
    return [UIFont systemFontOfSize:size*SCALE];
}

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
