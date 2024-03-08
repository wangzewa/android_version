package com.example.android_version

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.Context
import android.content.SharedPreferences
/** AndroidVersionPlugin */
class AndroidVersionPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var sharedPreferences: SharedPreferences
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_version")
    channel.setMethodCallHandler(this)
    sharedPreferences = flutterPluginBinding.getApplicationContext().getSharedPreferences("my_prefs", Context.MODE_PRIVATE);
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getPlatformSDK") {
      result.success("${android.os.Build.VERSION.SDK_INT}")
    }else if (call.method == "getRoute") {
      val data = sharedPreferences.getString("route","")
      val editor = sharedPreferences.edit()
      editor.putString("route", "")
      editor.apply()
      result.success("${data}")
    }else{
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
