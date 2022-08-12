import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtil {
  static final _deviceInfo = DeviceInfoPlugin();

  static Future<String> getId() async {
    if (Platform.isIOS) {
      final iosDeviceInfo = await _deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor!; // unique ID on iOS
    } else {
      final androidDeviceInfo = await _deviceInfo.androidInfo;
      return androidDeviceInfo.id!; // unique ID on Android
    }
  }
}
