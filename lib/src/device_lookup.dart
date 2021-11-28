import 'package:device_marketing_names/src/types/device.dart';
import 'package:device_marketing_names/src/types/platform.dart';
import 'package:device_marketing_names/src/utils/text.dart';
import 'package:flutter/foundation.dart';

import 'data/device_identifiers.dart';

/// Device types for device model based lookups
enum DeviceType {
  android,
  ios,
}

Future<String?> lookupDevice(
    PlatformInfoBase platform, DeviceInfoBase device) async {
  if (platform.isWeb()) {
    final webInfo = await device.getWebInfo();
    return describeEnum(webInfo.browserName).sentenceCase();
  } else {
    if (platform.isAndroid()) {
      final androidInfo = await device.getAndroidInfo();
      return lookupName(DeviceType.android, androidInfo.model);
    } else if (platform.isIOS()) {
      final iosInfo = await device.getIosInfo();
      return lookupName(DeviceType.ios, iosInfo.utsname.machine);
    } else {
      return null;
    }
  }
}

String? lookupName(DeviceType type, String? model) {
  if (model == null) {
    return null;
  }
  switch (type) {
    case DeviceType.android:
      return lookupAndroidName(model);
    case DeviceType.ios:
      return lookupIosName(model);
  }
}
