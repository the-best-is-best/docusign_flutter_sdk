// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// import 'docusign_flutter_sdk_method_channel.dart';

// abstract class DocusignFlutterSdkPlatform extends PlatformInterface {
//   /// Constructs a DocusignFlutterSdkPlatform.
//   DocusignFlutterSdkPlatform() : super(token: _token);

//   static final Object _token = Object();

//   static DocusignFlutterSdkPlatform _instance = MethodChannelDocusignFlutterSdk();

//   /// The default instance of [DocusignFlutterSdkPlatform] to use.
//   ///
//   /// Defaults to [MethodChannelDocusignFlutterSdk].
//   static DocusignFlutterSdkPlatform get instance => _instance;

//   /// Platform-specific implementations should set this with their own
//   /// platform-specific class that extends [DocusignFlutterSdkPlatform] when
//   /// they register themselves.
//   static set instance(DocusignFlutterSdkPlatform instance) {
//     PlatformInterface.verifyToken(instance, _token);
//     _instance = instance;
//   }

//   Future<String?> getPlatformVersion() {
//     throw UnimplementedError('platformVersion() has not been implemented.');
//   }
// }
