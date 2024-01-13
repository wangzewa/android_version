import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_version_platform_interface.dart';

/// An implementation of [AndroidVersionPlatform] that uses method channels.
class MethodChannelAndroidVersion extends AndroidVersionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_version');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getPlatformSDK() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformSDK');
    return version;
  }
}
