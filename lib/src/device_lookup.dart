import 'package:device_marketing_names/src/types/device.dart';
import 'package:device_marketing_names/src/types/platform.dart';
import 'package:device_marketing_names/src/utils/text.dart';
import 'package:flutter/services.dart';

import 'data/device_identifiers.dart';

/// Device types for device model based lookups
enum DeviceType {
  android,
  ios,
}

Future<String> lookupDevice(
    PlatformInfoBase platform, DeviceInfoBase device) async {
  if (platform.isWeb()) {
    final webInfo = await device.getWebInfo();
    return webInfo.browserName.name.sentenceCase();
  } else {
    if (platform.isAndroid()) {
      final androidInfo = await device.getAndroidInfo();
      return lookupName(DeviceType.android, androidInfo.model);
    } else if (platform.isIOS()) {
      final iosInfo = await device.getIosInfo();
      return lookupName(DeviceType.ios, iosInfo.utsname.machine);
    } else {
      throw PlatformException(
        code: 'UNSUPPORTED_PLATFORM',
        message:
            'Device name could not be read on device with unsupported type.',
      );
    }
  }
}

String lookupName(DeviceType type, String? model) {
  model ??= "";
  switch (type) {
    case DeviceType.android:
      return lookupAndroidName(model);
    case DeviceType.ios:
      return lookupIosName(model);
  }
}
