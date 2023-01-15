import 'package:flutter/services.dart';

class DocusignFlutterSdk {
  final methodChannel = const MethodChannel('docusign_flutter_sdk');

  Future<bool?> logout() async {
    return await methodChannel.invokeMethod<bool>('logout_docu');
  }

  Future<void> init() async {
    return await methodChannel.invokeMethod<void>('init');
  }

  Future<String?> login() async {
    return await methodChannel.invokeMethod<String>('login');
  }
}
