import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:device_marketing_names/src/device_lookup.dart';
import 'package:device_marketing_names/src/types/device.dart';
import 'package:device_marketing_names/src/types/platform.dart';
import 'package:device_marketing_names/src/utils/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'device_marketing_names_test.mocks.dart';
import 'device_marketing_names_test_helpers.dart';

@GenerateMocks([PlatformInfoBase, DeviceInfoBase])
void main() {
  var platform = MockPlatformInfoBase();
  var device = MockDeviceInfoBase();

  TestWidgetsFlutterBinding.ensureInitialized();

  group('Core functions', () {
    test('Lookup Browser', () async {
      when(platform.isWeb()).thenReturn(true);
      when(device.getWebInfo()).thenAnswer((_) async => getMockWebInfo(BrowserName.firefox));

      final result = await lookupDevice(platform, device);

      expect(result, "Firefox");
    });

    test('Lookup Android', () async {
      when(platform.isWeb()).thenReturn(false);
      when(platform.isAndroid()).thenReturn(true);
      when(device.getAndroidInfo()).thenAnswer((_) async => getMockAndroidInfo("KB2005"));

      final result = await lookupDevice(platform, device);

      expect(result, "OnePlus 8T");
    });

    test('Lookup iOS', () async {
      when(platform.isWeb()).thenReturn(false);
      when(platform.isAndroid()).thenReturn(false);
      when(platform.isIOS()).thenReturn(true);
      when(device.getIosInfo()).thenAnswer((_) async => getMockIosInfo("iPhone13,4"));

      final result = await lookupDevice(platform, device);

      expect(result, "iPhone 12 Pro Max");
    });

    test('Lookup by model (iPhone 12 Pro Max)', () {
      final deviceNames = DeviceMarketingNames();
      final result = deviceNames.getMarketingNameFromModel(DeviceType.ios, "iPhone13,4");

      expect(result, 'iPhone 12 Pro Max');
    });

    test('Fail lookup, no match', () {
      final result = lookupName(DeviceType.ios, "no_match");

      expect(result, null);
    });

    test('Fail lookup, null', () {
      final result = lookupName(DeviceType.ios, null);

      expect(result, null);
    });
  });

  group('Utils', () {
    test('Sentence case', () {
      final result = 'a'.sentenceCase();

      expect(result, 'A');
    });
  });
}
