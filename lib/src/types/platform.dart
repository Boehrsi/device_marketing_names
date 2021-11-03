import 'dart:io' if (dart.library.js) 'dart:html';

import 'package:flutter/foundation.dart';

abstract class PlatformInfoBase {
  bool isWeb();

  bool isAndroid();

  bool isIOS();
}

class PlatformInfo implements PlatformInfoBase {
  @override
  bool isAndroid() => Platform.isAndroid;

  @override
  bool isIOS() => Platform.isIOS;

  @override
  bool isWeb() => kIsWeb;
}
