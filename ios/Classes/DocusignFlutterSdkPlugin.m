#import "DocusignFlutterSdkPlugin.h"
#if __has_include(<docusign_flutter_sdk/docusign_flutter_sdk-Swift.h>)
#import <docusign_flutter_sdk/docusign_flutter_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "docusign_flutter_sdk-Swift.h"
#endif

@implementation DocusignFlutterSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDocusignFlutterSdkPlugin registerWithRegistrar:registrar];
}
@end
