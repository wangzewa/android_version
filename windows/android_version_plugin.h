#ifndef FLUTTER_PLUGIN_ANDROID_VERSION_PLUGIN_H_
#define FLUTTER_PLUGIN_ANDROID_VERSION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace android_version {

class AndroidVersionPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AndroidVersionPlugin();

  virtual ~AndroidVersionPlugin();

  // Disallow copy and assign.
  AndroidVersionPlugin(const AndroidVersionPlugin&) = delete;
  AndroidVersionPlugin& operator=(const AndroidVersionPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace android_version

#endif  // FLUTTER_PLUGIN_ANDROID_VERSION_PLUGIN_H_
