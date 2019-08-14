#line 1 "./WeChat/main.xm"








#import <Cocoa/Cocoa.h>
#import "xctheos.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
- (void)openAlertPanel;
@end


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

@class AppDelegate; 
static void (*_logos_orig$_ungrouped$AppDelegate$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, NSNotification *); static void _logos_method$_ungrouped$AppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL, NSNotification *); static void _logos_method$_ungrouped$AppDelegate$openAlertPanel(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST, SEL); 

#line 16 "./WeChat/main.xm"


static void _logos_method$_ungrouped$AppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
    _logos_orig$_ungrouped$AppDelegate$applicationDidFinishLaunching$(self, _cmd, notification);
    [self openAlertPanel];
}

static void _logos_method$_ungrouped$AppDelegate$openAlertPanel(_LOGOS_SELF_TYPE_NORMAL AppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    
    NSAlert *alert = [[NSAlert alloc] init];
    
    
    [alert addButtonWithTitle:@"OK"];
    
    
    [alert setMessageText:@"hook success"];
    
    [alert setInformativeText:@"Hi"];
    
    [alert setAlertStyle:NSInformationalAlertStyle];
    
    
    
    [alert beginSheetModalForWindow:[NSApplication sharedApplication].keyWindow
                  completionHandler:^(NSModalResponse returnCode){
                      
                      NSLog(@"returnCode : %d",returnCode);
                  }
     ];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$AppDelegate = objc_getClass("AppDelegate"); MSHookMessageEx(_logos_class$_ungrouped$AppDelegate, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$AppDelegate$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$AppDelegate$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AppDelegate, @selector(openAlertPanel), (IMP)&_logos_method$_ungrouped$AppDelegate$openAlertPanel, _typeEncoding); }} }
#line 48 "./WeChat/main.xm"
