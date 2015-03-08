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

#define SCALE scale()

@interface WXLAutolayout : NSObject
float scale();
@end