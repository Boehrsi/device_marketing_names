library device_marketing_names;

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_marketing_names/src/device_lookup.dart';

export 'src/device_lookup.dart' show DeviceType;

class DeviceNames {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<String?> getMarketingName() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return lookupName(DeviceType.android, androidInfo.model);
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return lookupName(DeviceType.ios, iosInfo.utsname.machine);
    } else {
      throw UnimplementedError('getMarketingName() has not been implemented for this platform.');
    }
  }

  String? getMarketingNameFromModel(DeviceType type, String model) => lookupName(type, model);
}
