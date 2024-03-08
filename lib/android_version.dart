
import 'android_version_platform_interface.dart';

class AndroidVersion {
  Future<String?> getPlatformVersion() {
    return AndroidVersionPlatform.instance.getPlatformVersion();
  }
  Future<String?> getPlatformSDK() {
    return AndroidVersionPlatform.instance.getPlatformSDK();
  }
  Future<String?> getRoute() {
    return AndroidVersionPlatform.instance.getRoute();
  }
}
