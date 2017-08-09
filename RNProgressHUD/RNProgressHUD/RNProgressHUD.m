//
//  RNProgressHUD.m
//  RNProgressHUD
//
//  Created by ma arno on 16/9/12.
//  Copyright © 2016年 amsoft. All rights reserved.
//

#import "RNProgressHUD.h"
#import "MBProgressHUD.h"


typedef NS_ENUM(NSInteger, RNProgressHUDMode) {
    /// Ring-shaped progress view.
    RNProgressHUDModeAnnularDeterminate,
    /// Horizontal progress bar.
    RNProgressHUDModeDeterminateHorizontalBar
};

@interface RNProgressHUD()


@property (nonatomic,strong) MBProgressHUD *hud;
@property (nonatomic,strong) UIWindow *window;


@end

@implementation RNProgressHUD


-(UIWindow *)window{
    if (!_window) {
        _window = [UIApplication sharedApplication].keyWindow;
    }
    return _window;
}

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(showSimpleText:(NSString *)message duration:(NSInteger)duration)
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hud){
            [self.hud hideAnimated:YES];
        }
        self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hud.mode = MBProgressHUDModeText;
        self.hud.label.text = message;
        self.hud.bezelView.color = [UIColor blackColor];
        self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.hud.bezelView.opaque = 0.8;
        self.hud.label.textColor = [UIColor whiteColor];
        self.hud.activityIndicatorColor =[UIColor whiteColor];
        if (self.hud) {
            [self.hud hideAnimated:YES afterDelay:duration / 1000];
            self.hud = NULL;
        }
    });
    
}
RCT_EXPORT_METHOD(showSpinIndeterminate)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hud){
            [self.hud hideAnimated:YES];
        }
        self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        self.hud.bezelView.color = [UIColor blackColor];
        self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.hud.bezelView.opaque = 0.8;
        self.hud.label.textColor = [UIColor whiteColor];
        self.hud.activityIndicatorColor =[UIColor whiteColor];
    });
}
RCT_EXPORT_METHOD(showSpinIndeterminateWithTitle:(NSString *)title)
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hud){
            [self.hud hideAnimated:YES];
        }
        self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        self.hud.label.text = title;
        self.hud.bezelView.color = [UIColor blackColor];
        self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.hud.bezelView.opaque = 0.8;
        self.hud.label.textColor = [UIColor whiteColor];
        self.hud.activityIndicatorColor =[UIColor whiteColor];
    });
    
}
RCT_EXPORT_METHOD(showSpinIndeterminateWithTitleAndDetails:(NSString *)title content:(NSString *)details)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hud){
            [self.hud hideAnimated:YES];
        }
        self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        self.hud.label.text = title;
        self.hud.detailsLabel.text = details;
        self.hud.bezelView.color = [UIColor blackColor];
        self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.hud.bezelView.opaque = 0.8;
        self.hud.label.textColor = [UIColor whiteColor];
        self.hud.activityIndicatorColor =[UIColor whiteColor];
    });
}
RCT_EXPORT_METHOD(showDeterminate:(NSInteger *)mode title:(NSString *)title details:(NSString *)details)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hud){
            [self.hud hideAnimated:YES];
        }
        self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hud.bezelView.color = [UIColor blackColor];
        self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.hud.bezelView.opaque = 0.8;
        self.hud.label.textColor = [UIColor whiteColor];
        self.hud.activityIndicatorColor =[UIColor whiteColor];
        
        if(mode == RNProgressHUDModeAnnularDeterminate){
            self.hud.mode = MBProgressHUDModeAnnularDeterminate;
        } else if(mode == RNProgressHUDModeDeterminateHorizontalBar){
            self.hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
        }
        
        if (title) {
            self.hud.label.text = title;
        }
        if(details){
            self.hud.detailsLabel.text = details;
        }
        
    });
}

RCT_EXPORT_METHOD(setProgress:(CGFloat)progress )
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_hud) {
            [MBProgressHUD HUDForView:self.window].progress = progress;
        }
    });
}

RCT_EXPORT_METHOD(dismiss)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hud){
            [self.hud hideAnimated:YES];
            self.hud = NULL;
        }
    });
}


@end
