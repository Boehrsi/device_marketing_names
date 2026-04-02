import 'package:device_marketing_names/src/logic/base/device_info.dart';
import 'package:device_marketing_names/src/logic/base/device_info_fallback.dart';
import 'package:device_marketing_names/src/models/device_info_data.dart';
import 'package:web/web.dart' as web;

import 'base/platform_info.dart';

DeviceInfo createDeviceInfo() => _DeviceInfo();

class _DeviceInfo implements DeviceInfo {
  @override
  Future<DeviceInfoData> getInfo(PlatformInfo platformInfo) async {
    return DeviceInfoData(model: _getBrowserName());
  }

  String _getBrowserName() {
    final userAgent = web.window.navigator.userAgent.toLowerCase();
    if (userAgent.contains('trident') || userAgent.contains('msie')) {
      return 'Internet Explorer';
    }
    if (userAgent.contains('firefox')) return 'Firefox';
    if (userAgent.contains('samsungbrowser')) return 'Samsung Browser';
    if (userAgent.contains('opera') || userAgent.contains('opr')) {
      return 'Opera';
    }
    if (userAgent.contains('vivaldi')) return 'Vivaldi';
    if (userAgent.contains('ucbrowser')) return 'UC Browser';
    if (userAgent.contains('edg')) return 'Edge';

    if (userAgent.contains('chrome')) return 'Chrome';
    if (userAgent.contains('safari')) return 'Safari';
    return unknown;
  }
}
