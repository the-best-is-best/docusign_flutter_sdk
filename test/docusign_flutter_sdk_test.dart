import 'package:flutter_test/flutter_test.dart';
import 'package:docusign_flutter_sdk/docusign_flutter_sdk.dart';
import 'package:docusign_flutter_sdk/docusign_flutter_sdk_platform_interface.dart';
import 'package:docusign_flutter_sdk/docusign_flutter_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDocusignFlutterSdkPlatform
    with MockPlatformInterfaceMixin
    implements DocusignFlutterSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DocusignFlutterSdkPlatform initialPlatform = DocusignFlutterSdkPlatform.instance;

  test('$MethodChannelDocusignFlutterSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDocusignFlutterSdk>());
  });

  test('getPlatformVersion', () async {
    DocusignFlutterSdk docusignFlutterSdkPlugin = DocusignFlutterSdk();
    MockDocusignFlutterSdkPlatform fakePlatform = MockDocusignFlutterSdkPlatform();
    DocusignFlutterSdkPlatform.instance = fakePlatform;

    expect(await docusignFlutterSdkPlugin.getPlatformVersion(), '42');
  });
}
