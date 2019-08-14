//
//  main.m
//  WeChat
//
//  Created by wz on 2019/8/13.
//  Copyright © 2019 wz. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "xctheos.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
- (void)openAlertPanel;
@end

%hook AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    %orig();
    [self openAlertPanel];
}
%new
- (void)openAlertPanel{
    
    NSAlert *alert = [[NSAlert alloc] init];
    
    //增加一个按钮
    [alert addButtonWithTitle:@"OK"];//1000
    
    //提示的标题
    [alert setMessageText:@"hook success"];
    //提示的详细内容
    [alert setInformativeText:@"Hi"];
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
