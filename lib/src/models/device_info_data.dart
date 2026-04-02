import 'package:device_marketing_names/src/logic/base/device_info_fallback.dart';

class DeviceInfoData {
  final String model;

  const DeviceInfoData({
    String? model,
  }) : model = model ?? unknown;
}
