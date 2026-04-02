import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_marketing_names/src/logic/base/device_info.dart';
import 'package:device_marketing_names/src/models/device_info_data.dart';

import 'base/platform_info.dart';

DeviceInfo createDeviceInfo() => _DeviceInfo();

class _DeviceInfo implements DeviceInfo {
  final _plugin = DeviceInfoPlugin();

  @override
  Future<DeviceInfoData> getInfo(PlatformInfo platformInfo) async {
    final info = await _plugin.webBrowserInfo;
    return DeviceInfoData(
      model: info.browserName.name,
    );
  }
}
