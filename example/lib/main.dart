import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:docusign_flutter_sdk/docusign_flutter_sdk.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DocusignFlutterSdk().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _login = 'Loading';
  final _docusignFlutterSdkPlugin = DocusignFlutterSdk();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initPlatformState();
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.



    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on: $_login\n'),
              ElevatedButton(onPressed: ()async{
                await  _docusignFlutterSdkPlugin.logout();
                setState(() {
                  _login="logout";
                });
              }, child: Text('logout')),
              ElevatedButton(onPressed: ()async{
                print("login ${await _docusignFlutterSdkPlugin.login()}");

                _login=await _docusignFlutterSdkPlugin.login()?? "";
                setState(() {

                });
              }, child: Text('login'))
            ],
          ),
        ),
      ),
    );
  }
}
