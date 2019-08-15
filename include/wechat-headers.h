//
//  wechat-headers.h
//  WeChat
//
//  Created by wz on 2019/8/15.
//  Copyright © 2019 wz. All rights reserved.
//

#ifndef wechat_headers_h
#define wechat_headers_h

@interface WeChat : NSObject
- (void)checkForUpdatesInBackground;

@end

@interface AppDelegate : NSObject <NSApplicationDelegate>
- (void)openAlertPanel;
@end
@interface MMLogger : NSObject



+ (void)logToFile:(unsigned int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 fmt:(id)arg6 arguments:(id)arg7;
+ (void)logToFile:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 message:(id)arg6;
+ (void)logWithMMLogLevel:(int)arg1 module:(const char *)arg2 file:(const char *)arg3 line:(int)arg4 func:(const char *)arg5 message:(id)arg6;

+ (BOOL)shouldEnableDebugLog;


@end


#endif /* wechat_headers_h */
