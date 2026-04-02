import 'package:device_marketing_names/src/data/device_identifiers.dart';
import 'package:device_marketing_names/src/logic/base/device_info.dart';
import 'package:device_marketing_names/src/logic/base/platform_info.dart';
import 'package:device_marketing_names/src/models/device_type.dart';
import 'package:device_marketing_names/src/utils/text.dart';
import 'package:flutter/services.dart';

Future<String> lookupDevice(
    PlatformInfo platformInfo, DeviceInfo deviceInfo) async {
  final info = await deviceInfo.getInfo(platformInfo);
  if (platformInfo.isAndroid) {
    return lookupName(DeviceType.android, info.model);
  } else if (platformInfo.isIOS) {
    return lookupName(DeviceType.ios, info.model);
  } else if (platformInfo.isWeb) {
    return info.model.sentenceCase();
  }
  throw PlatformException(
    code: 'UNSUPPORTED_PLATFORM',
    message: 'Device name could not be read on device with unsupported type.',
  );
}

String lookupName(DeviceType type, String? model) {
  model ??= "";
  switch (type) {
    case DeviceType.android:
      return lookupAndroidName(model);
    case DeviceType.ios:
      return lookupIosName(model);
    default:
      return "";
  }
}
