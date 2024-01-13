import 'package:flutter_test/flutter_test.dart';
import 'package:android_version/android_version.dart';
import 'package:android_version/android_version_platform_interface.dart';
import 'package:android_version/android_version_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidVersionPlatform
    with MockPlatformInterfaceMixin
    implements AndroidVersionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidVersionPlatform initialPlatform = AndroidVersionPlatform.instance;

  test('$MethodChannelAndroidVersion is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidVersion>());
  });

  test('getPlatformVersion', () async {
    AndroidVersion androidVersionPlugin = AndroidVersion();
    MockAndroidVersionPlatform fakePlatform = MockAndroidVersionPlatform();
    AndroidVersionPlatform.instance = fakePlatform;

    expect(await androidVersionPlugin.getPlatformVersion(), '42');
  });
}
