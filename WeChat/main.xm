//
//  main.m
//  WeChat
//
//  Created by wz on 2019/8/13.
//  Copyright © 2019 wz. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "xctheos.h"
#import "wechat-headers.h"

#ifndef HBLogDebug
#define HBLogDebug(...) NSLog(__VA_ARGS__)
#endif
#define kWeChatToolsLogId "[WeChat-Tools]"


%hook AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    %orig();
    [self openAlertPanel];
    NSLog(@"[WeChat-Tools] hook success!");
    NSLog(@"[WeChat-Tools] log enable: %d", [%c(MMLogger) shouldEnableDebugLog]);
}

%new
- (void)openAlertPanel{
    
    NSAlert *alert = [[NSAlert alloc] init];
    //增加一个按钮
    [alert addButtonWithTitle:@"OK"];
    //提示的标题
    [alert setMessageText:@"hook success"];
    //提示的详细内容
    [alert setInformativeText:@"Hi 111"];
    //设置告警风格
    [alert setAlertStyle:NSInformationalAlertStyle];
    //开始显示告警
    [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow
                  completionHandler:^(NSModalResponse returnCode){
                      //用户点击告警上面的按钮后的回调
                      NSLog(@"returnCode : %d",returnCode);
                  }
     ];
}

%end

%hook MMLogger

+ (void)logToFile:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 message:(id)arg6 {
    %orig();
//    NSLog(@"[WeChat-Tools-File] %s [%s:%d] %s", arg2, arg3, arg4, arg5);
}
+ (void)logWithMMLogLevel:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 message:(id)arg6 {
    %orig();
//    NSLog(@"[WeChat-Tools-Level] %s [%s:%d] %s", arg2, arg3, arg4, arg5);
}

%end

%hook WeChat

-(void)checkForUpdatesInBackground {
    NSLog(@"%s checkForUpdatesInBackground disable auto update", kWeChatToolsLogId);
}

%end
