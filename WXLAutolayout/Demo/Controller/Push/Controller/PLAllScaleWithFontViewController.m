//
//  PLAllScaleWithFontViewController.m
//  WXLAutolayout
//
//  Created by wxl on 15/9/5.
//  Copyright (c) 2015年 wxl. All rights reserved.
//

#import "PLAllScaleWithFontViewController.h"
#import "PowerLog.h"
#import "HexColors.h"

#define ScreenHight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define tableViewOrigin ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?64:0)

#define COLOR_BACKGROUND [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1]

@interface PLAllScaleWithFontViewController ()

@end

@implementation PLAllScaleWithFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_BACKGROUND;
    self.title = @"AllScaleWithFont";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    [PixelLayout setDevice:iPhone5 isPixel:pixel isScale:allScaleWithFont];
    
    UIScrollView *backgroundScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    backgroundScrollView.contentSize = PLCGSizeMake(640, 1136-128);
    backgroundScrollView.showsVerticalScrollIndicator = NO;
    self.view = backgroundScrollView;
    UIView *topBackgroundView = [[UIView alloc] initWithFrame:PLCGRectMake(0, 0, 640, 644)];
    topBackgroundView.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1];
    [self.view addSubview:topBackgroundView];
    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:PLCGRectMake(177, 197-128, 266, 96)];
    logoImageView.image = [UIImage imageNamed:@"login_logo"];
    [topBackgroundView addSubview:logoImageView];
    
    UITextField *accountTextField = [[UITextField alloc] initWithFrame:PLCGRectMake(20, 238, 640-20*2, 90)];
    accountTextField.placeholder = @"邮箱/手机号";
    [accountTextField setValue:[UIColor colorWithHexString:@"999999"] forKeyPath:@"_placeholderLabel.textColor"];
    accountTextField.background = [UIImage imageNamed:@"login_kuang"];
    accountTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    accountTextField.keyboardType = UIKeyboardTypeEmailAddress;
    [topBackgroundView addSubview:accountTextField];
    //    [accountTextField setLeftImage:@"login_email"];
    UIView *contentView = [[UIView alloc] initWithFrame:PLCGRectMake(0, 0, 90, 90)];
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_email"]];
    CGRect leftImageViewFrame = PLCGRectMake(90-88/2, 90-90/2, 88, 90);
    leftImageView.frame = leftImageViewFrame;
    [contentView addSubview:leftImageView];
    accountTextField.leftViewMode = UITextFieldViewModeAlways;
    accountTextField.leftView = contentView;
    
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:PLCGRectMake(20, 238+90+20, 640-20*2, 90)];
    passwordTextField.placeholder = @"密码";
    [passwordTextField setValue:[UIColor colorWithHexString:@"999999"] forKeyPath:@"_placeholderLabel.textColor"];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.background = [UIImage imageNamed:@"login_kuang"];
    passwordTextField.keyboardType = UIKeyboardTypeASCIICapable;
    [topBackgroundView addSubview:passwordTextField];
    contentView = [[UIView alloc] initWithFrame:PLCGRectMake(0, 0, 90, 90)];
    leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_password"]];
    leftImageViewFrame = PLCGRectMake(90-88/2, 90-90/2, 88, 90);
    leftImageView.frame = leftImageViewFrame;
    [contentView addSubview:leftImageView];
    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passwordTextField.leftView = contentView;
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:PLCGRectMake(20, 238+90*2+20+40, 640-20*2, 80)];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    [loginButton setTitle:@"立即登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = font(16);
    [topBackgroundView addSubview:loginButton];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:PLCGRectMake(25, 238+90*2+20+40+80+24, 90, 30)];
    [registerButton setTitle:@"立即注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
    registerButton.titleLabel.font = font(11);
    [topBackgroundView addSubview:registerButton];
    
    UIButton *forgotPasswordButton = [[UIButton alloc] initWithFrame:PLCGRectMake(640-25-110, 238+90*2+20+40+80+24, 110, 30)];
    [forgotPasswordButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgotPasswordButton setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
    forgotPasswordButton.titleLabel.font = font(11);
    [topBackgroundView addSubview:forgotPasswordButton];
    
    UIView *bottomBackgroundView = [[UIView alloc] initWithFrame:PLCGRectMake(0, 644+40, 640, 324)];
    bottomBackgroundView.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1];
    [self.view addSubview:bottomBackgroundView];
    
    UIImageView *thirdPartyLoginLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_info"]];
    thirdPartyLoginLineImageView.frame = PLCGRectMake(20, 60-24/2, 640-20*2, 24);
    [bottomBackgroundView addSubview:thirdPartyLoginLineImageView];
    
    UIButton *qqLoginButton = [[UIButton alloc] initWithFrame:PLCGRectMake(116, 928-128-644-40, 83, 81)];
    //    qqLoginButton.backgroundColor = COLOR_THEME;
    [qqLoginButton setBackgroundImage:[UIImage imageNamed:@"disanfang_qq"] forState:UIControlStateNormal];
    [bottomBackgroundView addSubview:qqLoginButton];
    UIButton *wechatLoginButton = [[UIButton alloc] initWithFrame:PLCGRectMake(284, 928-128-644-40, 83, 81)];
    [wechatLoginButton setBackgroundImage:[UIImage imageNamed:@"disanfang_weixin"] forState:UIControlStateNormal];
    [bottomBackgroundView addSubview:wechatLoginButton];
    UIButton *weiboLoginButton = [[UIButton alloc] initWithFrame:PLCGRectMake(449, 928-128-644-40, 83, 81)];
    [weiboLoginButton setBackgroundImage:[UIImage imageNamed:@"disanfang_weibo"] forState:UIControlStateNormal];
    [bottomBackgroundView addSubview:weiboLoginButton];
//    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 1.5)];
//    line2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:line2];
//    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 1.25)];
//    line.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:line];
    UIView *view = [[UIView alloc] initWithFrame:PLCGRectMake(0, 0, 640, 1136-128)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    PowerLog(PLCGSizeMake(640, 1136-128));
    PowerLog(NSStringFromCGRect(view.frame));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
