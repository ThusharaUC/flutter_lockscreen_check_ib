#import "FlutterLockscreenCheckPlugin.h"
#if __has_include(<flutter_lockscreen_check/flutter_lockscreen_check-Swift.h>)
#import <flutter_lockscreen_check/flutter_lockscreen_check-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_lockscreen_check-Swift.h"
#endif

@implementation FlutterLockscreenCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterLockscreenCheckPlugin registerWithRegistrar:registrar];
}
@end
