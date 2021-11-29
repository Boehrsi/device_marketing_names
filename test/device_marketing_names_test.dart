import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:device_marketing_names/src/data/device_identifiers.dart';
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

    test('Lookup iOS by model', () {
      final deviceNames = DeviceMarketingNames();
      final result = deviceNames.getMarketingNameFromModel(DeviceType.ios, "iPhone13,4");

      expect(result, 'iPhone 12 Pro Max');
    });

    test('Lookup Android by model', () {
      final deviceNames = DeviceMarketingNames();
      final result = deviceNames.getMarketingNameFromModel(DeviceType.android, "KB2005");

      expect(result, 'OnePlus 8T');
    });

    test('Verify data', () {
      final deviceNames = DeviceMarketingNames();
      final result0 = deviceNames.getMarketingNameFromModel(DeviceType.android, "001HT");
      final result1 = deviceNames.getMarketingNameFromModel(DeviceType.android, "10 Plus");
      final result2 = deviceNames.getMarketingNameFromModel(DeviceType.android, "2000_000170_00");
      final result3 = deviceNames.getMarketingNameFromModel(DeviceType.android, "3000");
      final result4 = deviceNames.getMarketingNameFromModel(DeviceType.android, "4003J");
      final result5 = deviceNames.getMarketingNameFromModel(DeviceType.android, "5-Inches");
      final result6 = deviceNames.getMarketingNameFromModel(DeviceType.android, "6002");
      final result7 = deviceNames.getMarketingNameFromModel(DeviceType.android, "701HW");
      final result8 = deviceNames.getMarketingNameFromModel(DeviceType.android, "80-1");
      final result9 = deviceNames.getMarketingNameFromModel(DeviceType.android, "9 inch SDU");
      final resultA = deviceNames.getMarketingNameFromModel(DeviceType.android, "A-TT00");
      final resultB = deviceNames.getMarketingNameFromModel(DeviceType.android, "B BOT 550");
      final resultC = deviceNames.getMarketingNameFromModel(DeviceType.android, "C Bot Tab 70");
      final resultD = deviceNames.getMarketingNameFromModel(DeviceType.android, "D-805XATV HD");
      final resultE = deviceNames.getMarketingNameFromModel(DeviceType.android, "E-Tab 4G");
      final resultF = deviceNames.getMarketingNameFromModel(DeviceType.android, "F and U Android TV");
      final resultG = deviceNames.getMarketingNameFromModel(DeviceType.android, "G Guard SMART TV");
      final resultH = deviceNames.getMarketingNameFromModel(DeviceType.android, "H-35");
      final resultI = deviceNames.getMarketingNameFromModel(DeviceType.android, "I star two");
      final resultJ = deviceNames.getMarketingNameFromModel(DeviceType.android, "J101");
      final resultK = deviceNames.getMarketingNameFromModel(DeviceType.android, "K-BOOK73G");
      final resultL = deviceNames.getMarketingNameFromModel(DeviceType.android, "L-01E");
      final resultM = deviceNames.getMarketingNameFromModel(DeviceType.android, "M BOT TAB 100");
      final resultN = deviceNames.getMarketingNameFromModel(DeviceType.android, "N-01D");
      final resultO = deviceNames.getMarketingNameFromModel(DeviceType.android, "O2 TV Box");
      final resultP = deviceNames.getMarketingNameFromModel(DeviceType.android, "P-01K");
      final resultQ = deviceNames.getMarketingNameFromModel(DeviceType.android, "Q Explorist HR");
      final resultR = deviceNames.getMarketingNameFromModel(DeviceType.android, "R1 HD");
      final resultS = deviceNames.getMarketingNameFromModel(DeviceType.android, "S-SAB220");
      final resultT = deviceNames.getMarketingNameFromModel(DeviceType.android, "T-01D");
      final resultU = deviceNames.getMarketingNameFromModel(DeviceType.android, "U FEEL");
      final resultV = deviceNames.getMarketingNameFromModel(DeviceType.android, "V TAB 10'' LITE");
      final resultW = deviceNames.getMarketingNameFromModel(DeviceType.android, "W-K130-EEA");
      final resultX = deviceNames.getMarketingNameFromModel(DeviceType.android, "X MAX");
      final resultY = deviceNames.getMarketingNameFromModel(DeviceType.android, "Y10");
      final resultZ = deviceNames.getMarketingNameFromModel(DeviceType.android, "Z-2252");
      final resulta = deviceNames.getMarketingNameFromModel(DeviceType.android, "a4");
      final resultb = deviceNames.getMarketingNameFromModel(DeviceType.android, "b1-720");
      final resultc = deviceNames.getMarketingNameFromModel(DeviceType.android, "calgary");
      final resultd = deviceNames.getMarketingNameFromModel(DeviceType.android, "d-01H");
      final resulte = deviceNames.getMarketingNameFromModel(DeviceType.android, "e-tab 20");
      final resultf = deviceNames.getMarketingNameFromModel(DeviceType.android, "f400");
      final resultg = deviceNames.getMarketingNameFromModel(DeviceType.android, "g06");
      final resulth = deviceNames.getMarketingNameFromModel(DeviceType.android, "h33");
      final resulti = deviceNames.getMarketingNameFromModel(DeviceType.android, "i-STYLE 713");
      final resultj = deviceNames.getMarketingNameFromModel(DeviceType.android, "jupiter");
      final resultk = deviceNames.getMarketingNameFromModel(DeviceType.android, "keeby");
      final resultl = deviceNames.getMarketingNameFromModel(DeviceType.android, "l4300");
      final resultm = deviceNames.getMarketingNameFromModel(DeviceType.android, "mDESK");
      final resultn = deviceNames.getMarketingNameFromModel(DeviceType.android, "nJoy_Arcas_7");
      final resulto = deviceNames.getMarketingNameFromModel(DeviceType.android, "omega_lite_4");
      final resultp = deviceNames.getMarketingNameFromModel(DeviceType.android, "pearl");
      final resultq = deviceNames.getMarketingNameFromModel(DeviceType.android, "quattro");
      final resultr = deviceNames.getMarketingNameFromModel(DeviceType.android, "realme SA Smart TV");
      final results = deviceNames.getMarketingNameFromModel(DeviceType.android, "s4");
      final resultt = deviceNames.getMarketingNameFromModel(DeviceType.android, "tab10");
      final resultu = deviceNames.getMarketingNameFromModel(DeviceType.android, "uie4027lgu");
      final resultv = deviceNames.getMarketingNameFromModel(DeviceType.android, "v7-EEA");
      final resultw = deviceNames.getMarketingNameFromModel(DeviceType.android, "w6");
      final resultx = deviceNames.getMarketingNameFromModel(DeviceType.android, "xTablet-A680");
      final resulty = deviceNames.getMarketingNameFromModel(DeviceType.android, "yetruepad21");
      final resultz = deviceNames.getMarketingNameFromModel(DeviceType.android, "zx70");

      expect(result0, 'Desire HD');
      expect(result1, '10 Plus');
      expect(result2, 'rephone');
      expect(result3, '3000');
      expect(result4, 'PIXI3(4)');
      expect(result5, '5-Inches');
      expect(result6, 'G3 Pro');
      expect(result7, 'HUAWEI MediaPad M3 Lite');
      expect(result8, 'Maxwell 10 / Maxwell-10');
      expect(result9, 'SDU');
      expect(resultA, 'A-TT00');
      expect(resultB, 'B bot 550');
      expect(resultC, 'C bot tab 70');
      expect(resultD, 'D-805XATV HD');
      expect(resultE, 'chagall');
      expect(resultF, 'Greece');
      expect(resultG, 'G Guard SMART TV');
      expect(resultH, 'H-35');
      expect(resultI, 'I star two');
      expect(resultJ, 'J101');
      expect(resultK, 'K-BOOK73G');
      expect(resultL, 'LG Optimus G');
      expect(resultM, 'M bot tab 100');
      expect(resultN, 'MEDIAS PP N-01D');
      expect(resultO, 'O2 TV Box');
      expect(resultP, 'P-01K');
      expect(resultQ, 'Wear');
      expect(resultR, 'R1 HD');
      expect(resultS, 'S-SAB220');
      expect(resultT, 'REGZA Phone T-01D');
      expect(resultU, 'U FEEL');
      expect(resultV, 'VT10E2');
      expect(resultW, 'Y50');
      expect(resultX, 'X MAX');
      expect(resultY, 'Y10 / Y10_1 / Y10_1_EEA / Y10_EEA');
      expect(resultZ, 'Z-2252');
      expect(resulta, 'a4');
      expect(resultb, 'B1-720');
      expect(resultc, 'Devour');
      expect(resultd, 'd-01H');
      expect(resulte, 'e-tab 20');
      expect(resultf, 'F400');
      expect(resultg, 'g06+');
      expect(resulth, 'H-33');
      expect(resulti, 'i-STYLE 713');
      expect(resultj, 'B.PROカーナビ / CyberNavi / Navigation');
      expect(resultk, 'Intel Jasper Lake Chromebook');
      expect(resultl, 'L4300');
      expect(resultm, 'mDESK');
      expect(resultn, 'Arcas 7');
      expect(resulto, 'Omega Lite 4');
      expect(resultp, 'NETBOX');
      expect(resultq, 'quattro');
      expect(resultr, 'realme SA Smart TV');
      expect(results, 's4');
      expect(resultt, 'tab10');
      expect(resultu, 'U+tv UHD3');
      expect(resultv, 'v7-EEA');
      expect(resultw, 'w6');
      expect(resultx, 'xTablet-A680');
      expect(resulty, 'yetruepad21');
      expect(resultz, 'ZX70');
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
