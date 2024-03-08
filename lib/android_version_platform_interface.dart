import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_version_method_channel.dart';

abstract class AndroidVersionPlatform extends PlatformInterface {
  /// Constructs a AndroidVersionPlatform.
  AndroidVersionPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidVersionPlatform _instance = MethodChannelAndroidVersion();

  /// The default instance of [AndroidVersionPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidVersion].
  static AndroidVersionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidVersionPlatform] when
  /// they register themselves.
  static set instance(AndroidVersionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getPlatformSDK() {
    throw UnimplementedError('platformSDK() has not been implemented.');
  }
  Future<String?> getRoute() {
    throw UnimplementedError('platformSDK() has not been implemented.');
  }
}
