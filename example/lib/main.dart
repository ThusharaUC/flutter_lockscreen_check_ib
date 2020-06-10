import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:flutter_lockscreen_check/flutter_lockscreen_check.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _lockScreenAvailable = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool lockScreenAvailable;
    if(Platform.isAndroid) {
      try {
        lockScreenAvailable = await FlutterLockScreenCheck.isLockScreenAvailable;
      } on PlatformException {
        lockScreenAvailable = false;
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;
    }else{
      _lockScreenAvailable = false;
    }
    setState(() {
      _lockScreenAvailable = lockScreenAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('LockScreen Available: $_lockScreenAvailable\n'),
        ),
      ),
    );
  }
}
