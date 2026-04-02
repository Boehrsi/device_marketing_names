import 'package:device_marketing_names/src/logic/base/device_info.dart';
import 'package:device_marketing_names/src/logic/base/platform_info.dart';
import 'package:device_marketing_names/src/models/device_info_data.dart';

const _unknown = 'unknown';

const unknownDeviceInfoData = DeviceInfoData(model: _unknown);

DeviceInfo createDeviceInfo() => _DeviceInfo();

class _DeviceInfo implements DeviceInfo {
  @override
  Future<DeviceInfoData> getInfo(PlatformInfo platformInfo) async =>
      unknownDeviceInfoData;
}
