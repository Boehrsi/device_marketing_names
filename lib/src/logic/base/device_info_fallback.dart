import 'package:device_marketing_names/src/logic/base/device_info.dart';
import 'package:device_marketing_names/src/logic/base/platform_info.dart';
import 'package:device_marketing_names/src/models/device_info_data.dart';

const unknown = 'Unknown';
const unknownDeviceInfoData = DeviceInfoData(model: unknown);

DeviceInfo createDeviceInfo() => _DeviceInfo();

class _DeviceInfo implements DeviceInfo {
  @override
  Future<DeviceInfoData> getInfo(PlatformInfo platformInfo) async =>
      unknownDeviceInfoData;
}
