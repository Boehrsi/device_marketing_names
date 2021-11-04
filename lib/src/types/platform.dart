import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';

abstract class PlatformInfoBase {
  bool isWeb();

  bool isAndroid();

  bool isIOS();
}

class PlatformInfo implements PlatformInfoBase {
  @override
  bool isAndroid() => UniversalPlatform.isAndroid;

  @override
  bool isIOS() => UniversalPlatform.isIOS;

  @override
  bool isWeb() => kIsWeb;
}
