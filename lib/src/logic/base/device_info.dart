import 'package:device_marketing_names/src/logic/base/platform_info.dart';
import 'package:device_marketing_names/src/models/device_info_data.dart';
import 'package:device_marketing_names/src/logic/base/device_info_fallback.dart'
    if (dart.library.io) 'package:device_marketing_names/src/logic/device_info_io.dart'
    if (dart.library.js_interop) 'package:device_marketing_names/src/logic/device_info_web.dart';

abstract class DeviceInfo {
  Future<DeviceInfoData> getInfo(PlatformInfo platformInfo);

  factory DeviceInfo() => createDeviceInfo();
}
