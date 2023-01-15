import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:docusign_flutter_sdk/docusign_flutter_sdk_method_channel.dart';

void main() {
  MethodChannelDocusignFlutterSdk platform = MethodChannelDocusignFlutterSdk();
  const MethodChannel channel = MethodChannel('docusign_flutter_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
