//
//  WXLAutolayout.h
//  Reader
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//默认WXLDesignScreenWidth为iPhone6
static int WXLDesignScreenWidth = 375;
static float WXLScale = 1;

typedef NS_ENUM(NSInteger, WXLDeviceOfUIDesign) {
    NOTSCALE              = 0,
    iPhone                = 320,
    iPhone3G              = 320,
    iPhone3GS             = 320,
    iPhone4               = 320,
    iPhone4S              = 320,
    iPhone5               = 320,
    iPhone5S              = 320,
    iPhone6               = 375,
    iPhone6Plus           = 414,
    iPad                  = 768,
    iPad2                 = 768,
    TheNewiPad            = 768,
    iPadWithRetinaDisplay = 768,
    iPadAir               = 768,
    iPadAir2              = 768,
    iPadMini              = 768,
    iPadMini2             = 768,
    iPadMini3             = 768
};
#define SCALE scale()

@interface WXLAutolayout : NSObject
+ (void)setDevice:(WXLDeviceOfUIDesign)device;
float scale();
@end