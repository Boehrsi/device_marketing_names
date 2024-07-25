library device_marketing_names;

import 'package:device_marketing_names/src/types/device.dart';
import 'package:device_marketing_names/src/types/platform.dart';

import 'src/device_lookup.dart';

export 'src/device_lookup.dart' show DeviceType;

/// Lookup device marketing names for the current device or a specific model
class DeviceMarketingNames {
  static final DeviceMarketingNames _instance =
      DeviceMarketingNames._internal();

  factory DeviceMarketingNames() => _instance;

  DeviceMarketingNames._internal();

  String? deviceNames;

  /// Get all marketing names of the device. If multiple names match the model, those are concatenated and separated by " / ". Lookup results are cached.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  /// If no marketing names were found the model name is returned.
  Future<String> getNames() async {
    deviceNames ??= await lookupDevice(PlatformInfo(), DeviceInfo());
    return deviceNames!;
  }

  /// Get all marketing names of the device as list. Lookup results are cached.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  /// If no marketing names were found the model name is returned.
  Future<List<String>> getNamesAsList() async => (await getNames()).getList();

  /// Get one marketing name of the device. If multiple names match the model, the first match is selected. Lookup results are cached.
  /// For web browsers the browser name delivered by device_info_plus is forwarded.
  /// If no marketing name was found the model name is returned.
  Future<String> getSingleName() async => (await getNames()).getFirst();

  /// Get all marketing names for the given model. If multiple names match the model, those are concatenated and separated by " / ".
  /// If no marketing names were found the model name is returned.
  String getNamesFromModel(DeviceType type, String model) =>
      lookupName(type, model);

  /// Get all marketing names for the given model as list.
  /// If no marketing names were found the model name is returned.
  List<String> getNamesFromModelAsList(DeviceType type, String model) =>
      getNamesFromModel(type, model).getList();

  /// Get one marketing name for the given model. If multiple names match the model, the first match is selected.
  /// If no marketing name was found the model name is returned.
  String getSingleNameFromModel(DeviceType type, String model) =>
      getNamesFromModel(type, model).getFirst();
}

extension GetData on String {
  List<String> getList() =>
      split('/').map((String element) => element.trim()).toList();

  String getFirst() => getList().first;
}
