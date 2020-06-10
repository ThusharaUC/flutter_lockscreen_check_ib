import 'dart:async';
import 'package:flutter/services.dart';

class FlutterLockScreenCheck {
  static const MethodChannel _channel =
      const MethodChannel('flutter_lockscreen_check');




  static Future<bool> get isLockScreenAvailable async {
    final bool isLockScreenAvailable = await _channel.invokeMethod('checkLockScreenAvailable');
    return isLockScreenAvailable;
  }

}
