library device_marketing_names;

import 'package:device_marketing_names/src/types/device.dart';
import 'package:device_marketing_names/src/types/platform.dart';

import 'src/device_lookup.dart';

export 'src/device_lookup.dart' show DeviceType;

/// Lookup device marketing names for the current device or a specific model
class DeviceMarketingNames {
  String? deviceNames;

  /// Get all marketing names of the device. If multiple names match the model, those are concatenated and separated by " / ". Lookup results are cached.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  Future<String> getNames() async {
    deviceNames ??= await lookupDevice(PlatformInfo(), DeviceInfo());
    return deviceNames!;
  }

  /// Get all marketing names of the device as list. Lookup results are cached.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  Future<List<String>> getNamesAsList() async => (await getNames()).getList();

  /// Get one marketing name of the device. If multiple names match the model, the first match is selected. Lookup results are cached.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  Future<String> getSingleName() async => (await getNames()).getFirst();

  /// Get all marketing names for the given model. If multiple names match the model, those are concatenated and separated by " / ".
  String getNamesFromModel(DeviceType type, String model) =>
      lookupName(type, model);

  /// Get all marketing names for the given model as list.
  List<String> getNamesFromModelAsList(DeviceType type, String model) =>
      getNamesFromModel(type, model).getList();

  /// Get one marketing name for the given model. If multiple names match the model, the first match is selected.
  String getSingleNameFromModel(DeviceType type, String model) =>
      getNamesFromModel(type, model).getFirst();

  /// Loads the marketing name for the current device. Internally the device model is loaded and matched against a list of known devices.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  @Deprecated('Use getSingleName() or getNames() instead.')
  Future<String?> getMarketingName() async =>
      await lookupDevice(PlatformInfo(), DeviceInfo());

  /// Loads the marketing name for an already known device model. The device model is matched against a list of known devices.
  /// Supported device types are Android and iOS.
  @Deprecated('Use getSingleNameFromModel() or getNamesFromModel instead.')
  String? getMarketingNameFromModel(DeviceType type, String model) =>
      lookupName(type, model);
}

extension GetData on String {
  List<String> getList() =>
      split('/').map((String element) => element.trim()).toList();

  String getFirst() => getList().first;
}
