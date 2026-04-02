import 'package:universal_platform/universal_platform.dart';

abstract class PlatformInfo {
  bool get isWeb;

  bool get isAndroid;

  bool get isIOS;
}

class PlatformInfoImpl implements PlatformInfo {
  @override
  bool get isAndroid => UniversalPlatform.isAndroid;

  @override
  bool get isIOS => UniversalPlatform.isIOS;

  @override
  bool get isWeb => UniversalPlatform.isWeb;
}
