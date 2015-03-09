//
//  WXLAutolayout.m
//  Reader
//
//  Created by wxl on 15/3/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "WXLAutolayout.h"

@implementation WXLAutolayout
+ (void)load
{
#ifdef iPhone
    WXLDesignscreenWidth = 320;
#endif
#ifdef iPhone3G
    WXLDesignscreenWidth = 320;
#endif
#ifdef iPhone3GS
    WXLDesignscreenWidth = 320;
#endif
#ifdef iPhone4
    WXLDesignscreenWidth = 320;
#endif
#ifdef iPhone4S
    WXLDesignscreenWidth = 320;
#endif
#ifdef iPhone5
    WXLDesignscreenWidth = 320;
#endif
#ifdef iPhone5S
    WXLDesignscreenWidth = 320;
#endif
#ifdef iPhone6
#endif
#ifdef iPhone6Plus
    WXLDesignScreenWidth = 414;
#endif
#ifdef iPad
    WXLDesignScreenWidth = 768;
#endif
#ifdef iPad2
    WXLDesignScreenWidth = 768;
#endif
#ifdef ThenewiPad
    WXLDesignScreenWidth = 768;
#endif
#ifdef iPadwithRetinadisplay
    WXLDesignScreenWidth = 768;
#endif
#ifdef iPadmini
    WXLDesignScreenWidth = 768;
#endif
#ifdef iPadmini2
    WXLDesignScreenWidth = 768;
#endif
#ifdef iPadmini3
    WXLDesignScreenWidth = 768;
#endif
#ifdef iPadAir
    WXLDesignScreenWidth = 768;
#endif
#ifdef iPadAir2
    WXLDesignScreenWidth = 768;
#endif
#ifndef NOTSCALE
    CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
    WXLScale = currentScreenWidth/(float)WXLDesignScreenWidth;
#endif
}

float scale()
{
    return WXLScale;
}

+ (void)setDevice:(WXLDeviceOfUIDesign)device
{
    if (device) {
        CGFloat currentScreenWidth = [UIScreen mainScreen].bounds.size.width;
        WXLScale = currentScreenWidth/(float)device;
    } else {
        WXLScale = 1;
    }
}
@end
