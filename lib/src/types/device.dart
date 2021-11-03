import 'package:device_info_plus/device_info_plus.dart';

abstract class DeviceInfoBase {
  Future<WebBrowserInfo> getWebInfo();

  Future<AndroidDeviceInfo> getAndroidInfo();

  Future<IosDeviceInfo> getIosInfo();
}

class DeviceInfo implements DeviceInfoBase {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  @override
  Future<WebBrowserInfo> getWebInfo() async => await _deviceInfo.webBrowserInfo;

  @override
  Future<AndroidDeviceInfo> getAndroidInfo() async =>
      await _deviceInfo.androidInfo;

  @override
  Future<IosDeviceInfo> getIosInfo() async => await _deviceInfo.iosInfo;
}
