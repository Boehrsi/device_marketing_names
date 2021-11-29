library device_marketing_names;

import 'package:device_marketing_names/src/types/device.dart';
import 'package:device_marketing_names/src/types/platform.dart';

import 'src/device_lookup.dart';

export 'src/device_lookup.dart' show DeviceType;

/// Lookup device marketing names for the current device or a specific model
class DeviceMarketingNames {
  /// Loads the marketing name for the current device. Internally the device model is loaded and matched against a list of known devices.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  Future<String?> getMarketingName() async =>
      await lookupDevice(PlatformInfo(), DeviceInfo());

  /// Loads the marketing name for an already known device model. The device model is matched against a list of known devices.
  /// Supported device types are Android and iOS.
  String? getMarketingNameFromModel(DeviceType type, String model) =>
      lookupName(type, model);
}
