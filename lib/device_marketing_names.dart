library device_marketing_names;

import 'package:device_marketing_names/src/types/device.dart';
import 'package:device_marketing_names/src/types/platform.dart';

import 'src/device_lookup.dart';

export 'src/device_lookup.dart' show DeviceType;

class DeviceNames {
  Future<String?> getMarketingName() async => await lookupByPlatform(PlatformInfo(), DeviceInfo());

  String? getMarketingNameFromModel(DeviceType type, String model) => lookupName(type, model);
}
