import 'package:device_info_plus/device_info_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'device_marketing_names_test_helpers.mocks.dart';

@GenerateMocks([WebBrowserInfo])
WebBrowserInfo getMockWebInfo(BrowserName name) {
  var mock = MockWebBrowserInfo();
  when(mock.browserName).thenReturn(name);
  return mock;
}

@GenerateMocks([AndroidDeviceInfo])
AndroidDeviceInfo getMockAndroidInfo(String model) {
  var mock = MockAndroidDeviceInfo();
  when(mock.model).thenReturn(model);
  return mock;
}

@GenerateMocks([IosDeviceInfo, IosUtsname])
IosDeviceInfo getMockIosInfo(String model) {
  var mock = MockIosDeviceInfo();
  var internalMock = MockIosUtsname();
  when(mock.utsname).thenReturn(internalMock);
  when(internalMock.machine).thenReturn(model);
  return mock;
}
