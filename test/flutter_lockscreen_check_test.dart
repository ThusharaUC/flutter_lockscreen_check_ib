import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lockscreen_check/flutter_lockscreen_check.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_lockscreen_check');

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
    expect(await FlutterLockScreenCheck.isLockScreenAvailable, '42');
  });
}
