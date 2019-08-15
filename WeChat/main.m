#line 1 "./WeChat/main.xm"








#import <Cocoa/Cocoa.h>
#import "xctheos.h"
#import "wechat-headers.h"

#ifndef HBLogDebug
#define HBLogDebug(...) NSLog(__VA_ARGS__)
#endif
#define kWeChatToolsLogId "[WeChat-Tools]"



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MMLogger; @class WeChat; @class AppDelegate; 
static void (*_logos_orig$_ungrouped$AppDelegate$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, NSNotification *); static void _logos_method$_ungrouped$AppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, NSNotification *); static void _logos_method$_ungrouped$AppDelegate$openAlertPanel(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$MMLogger$logToFile$module$file$line$func$message$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int, const char *, const char *, int, const char *, id); static void _logos_meta_method$_ungrouped$MMLogger$logToFile$module$file$line$func$message$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int, const char *, const char *, int, const char *, id); static void (*_logos_meta_orig$_ungrouped$MMLogger$logWithMMLogLevel$module$file$line$func$message$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int, const char *, const char *, int, const char *, id); static void _logos_meta_method$_ungrouped$MMLogger$logWithMMLogLevel$module$file$line$func$message$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, int, const char *, const char *, int, const char *, id); static void (*_logos_orig$_ungrouped$WeChat$checkForUpdatesInBackground)(_LOGOS_SELF_TYPE_NORMAL WeChat* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WeChat$checkForUpdatesInBackground(_LOGOS_SELF_TYPE_NORMAL WeChat* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMLogger(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMLogger"); } return _klass; }
#line 19 "./WeChat/main.xm"


static void _logos_method$_ungrouped$AppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
    _logos_orig$_ungrouped$AppDelegate$applicationDidFinishLaunching$(self, _cmd, notification);
    [self openAlertPanel];
    NSLog(@"[WeChat-Tools] hook success!");
    NSLog(@"[WeChat-Tools] log enable: %d", [_logos_static_class_lookup$MMLogger() shouldEnableDebugLog]);
}


static void _logos_method$_ungrouped$AppDelegate$openAlertPanel(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    
    NSAlert *alert = [[NSAlert alloc] init];
    
    [alert addButtonWithTitle:@"OK"];
    
    [alert setMessageText:@"hook success"];
    
    [alert setInformativeText:@"Hi 111"];
    
    [alert setAlertStyle:NSInformationalAlertStyle];
    
    [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow
                  completionHandler:^(NSModalResponse returnCode){
                      
                      NSLog(@"returnCode : %d",returnCode);
                  }
     ];
}





static void _logos_meta_method$_ungrouped$MMLogger$logToFile$module$file$line$func$message$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1, const char * arg2, const char * arg3, int arg4, const char * arg5, id arg6) {
    _logos_meta_orig$_ungrouped$MMLogger$logToFile$module$file$line$func$message$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6);

}
static void _logos_meta_method$_ungrouped$MMLogger$logWithMMLogLevel$module$file$line$func$message$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1, const char * arg2, const char * arg3, int arg4, const char * arg5, id arg6) {
    _logos_meta_orig$_ungrouped$MMLogger$logWithMMLogLevel$module$file$line$func$message$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6);

}





static void _logos_method$_ungrouped$WeChat$checkForUpdatesInBackground(_LOGOS_SELF_TYPE_NORMAL WeChat* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"%s checkForUpdatesInBackground disable auto update", kWeChatToolsLogId);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AppDelegate = objc_getClass("AppDelegate"); MSHookMessageEx(_logos_class$_ungrouped$AppDelegate, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$AppDelegate$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$AppDelegate$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AppDelegate, @selector(openAlertPanel), (IMP)&_logos_method$_ungrouped$AppDelegate$openAlertPanel, _typeEncoding); }Class _logos_class$_ungrouped$MMLogger = objc_getClass("MMLogger"); Class _logos_metaclass$_ungrouped$MMLogger = object_getClass(_logos_class$_ungrouped$MMLogger); MSHookMessageEx(_logos_metaclass$_ungrouped$MMLogger, @selector(logToFile:module:file:line:func:message:), (IMP)&_logos_meta_method$_ungrouped$MMLogger$logToFile$module$file$line$func$message$, (IMP*)&_logos_meta_orig$_ungrouped$MMLogger$logToFile$module$file$line$func$message$);MSHookMessageEx(_logos_metaclass$_ungrouped$MMLogger, @selector(logWithMMLogLevel:module:file:line:func:message:), (IMP)&_logos_meta_method$_ungrouped$MMLogger$logWithMMLogLevel$module$file$line$func$message$, (IMP*)&_logos_meta_orig$_ungrouped$MMLogger$logWithMMLogLevel$module$file$line$func$message$);Class _logos_class$_ungrouped$WeChat = objc_getClass("WeChat"); MSHookMessageEx(_logos_class$_ungrouped$WeChat, @selector(checkForUpdatesInBackground), (IMP)&_logos_method$_ungrouped$WeChat$checkForUpdatesInBackground, (IMP*)&_logos_orig$_ungrouped$WeChat$checkForUpdatesInBackground);} }
#line 71 "./WeChat/main.xm"
