#include "include/android_version/android_version_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "android_version_plugin.h"

void AndroidVersionPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  android_version::AndroidVersionPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
