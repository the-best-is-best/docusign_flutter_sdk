// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';

// import 'docusign_flutter_sdk_platform_interface.dart';

// /// An implementation of [DocusignFlutterSdkPlatform] that uses method channels.
// class MethodChannelDocusignFlutterSdk extends DocusignFlutterSdkPlatform {
//   /// The method channel used to interact with the native platform.
//   @visibleForTesting
//   final methodChannel = const MethodChannel('docusign_flutter_sdk');

//   @override
//   Future<String?> getPlatformVersion() async {
//     final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
//     return version;
//   }
// }
