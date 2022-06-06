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

  const model = "SM-J250F";
  const modelFirstResult = "Galaxy Grand Prime Pro";
  const modelResult = "Galaxy Grand Prime Pro / Galaxy J2 / Galaxy J2 Pro";
  const modelExampleList = "some / device / data";
  const modelExampleSome = "some";
  const modelExampleDevice = "device";
  const modelExampleData = "data";
  const modelExampleInvalid = "invalid_data";
  const modelExampleEmpty = "";
  const modelIos = "iPhone13,4";
  const modelIosResult = "iPhone 12 Pro Max";

  group('Core functions', () {
    test('Lookup Browser', () async {
      when(platform.isWeb()).thenReturn(true);
      when(device.getWebInfo())
          .thenAnswer((_) async => getMockWebInfo(BrowserName.firefox));

      final result = await lookupDevice(platform, device);

      expect(result, "Firefox");
    });

    test('Lookup Android', () async {
      when(platform.isWeb()).thenReturn(false);
      when(platform.isAndroid()).thenReturn(true);
      when(device.getAndroidInfo())
          .thenAnswer((_) async => getMockAndroidInfo(model));

      final result = await lookupDevice(platform, device);

      expect(result, modelResult);
    });

    test('Lookup iOS', () async {
      when(platform.isWeb()).thenReturn(false);
      when(platform.isAndroid()).thenReturn(false);
      when(platform.isIOS()).thenReturn(true);
      when(device.getIosInfo())
          .thenAnswer((_) async => getMockIosInfo(modelIos));

      final result = await lookupDevice(platform, device);

      expect(result, modelIosResult);
    });

    test('Lookup names by Android model', () {
      final deviceNames = DeviceMarketingNames();
      final result = deviceNames.getNamesFromModel(DeviceType.android, model);

      expect(result, modelResult);
    });

    test('Lookup names by Android model as list', () {
      final deviceNames = DeviceMarketingNames();
      final result =
          deviceNames.getNamesFromModelAsList(DeviceType.android, model);

      expect(result.length, 3);
      expect(result.contains(modelFirstResult), true);
    });

    test('Lookup single name by Android model', () {
      final deviceNames = DeviceMarketingNames();
      final result =
          deviceNames.getSingleNameFromModel(DeviceType.android, model);

      expect(result, modelFirstResult);
    });

    test('Lookup single name by Android invalid model', () {
      final deviceNames = DeviceMarketingNames();
      final result = deviceNames.getSingleNameFromModel(
          DeviceType.android, modelExampleInvalid);

      expect(result, modelExampleInvalid);
    });

    test('Lookup names by iOS model', () {
      final deviceNames = DeviceMarketingNames();
      final result = deviceNames.getNamesFromModel(DeviceType.ios, modelIos);

      expect(result, modelIosResult);
    });

    test('Lookup names by iOS model as list', () {
      final deviceNames = DeviceMarketingNames();
      final result =
          deviceNames.getNamesFromModelAsList(DeviceType.ios, modelIos);

      expect(result.length, 1);
      expect(result.contains(modelIosResult), true);
    });

    test('Lookup single name by iOS model', () {
      final deviceNames = DeviceMarketingNames();
      final result =
          deviceNames.getSingleNameFromModel(DeviceType.ios, modelIos);

      expect(result, modelIosResult);
    });

    test('Lookup single name by iOS invalid model', () {
      final deviceNames = DeviceMarketingNames();
      final result = deviceNames.getSingleNameFromModel(
          DeviceType.ios, modelExampleInvalid);

      expect(result, modelExampleInvalid);
    });

    test('Verify data', () {
      final deviceNames = DeviceMarketingNames();
      final result0 =
          deviceNames.getNamesFromModel(DeviceType.android, "001HT");
      final result1 =
          deviceNames.getNamesFromModel(DeviceType.android, "10 Plus");
      final result2 =
          deviceNames.getNamesFromModel(DeviceType.android, "2000_000170_00");
      final result3 = deviceNames.getNamesFromModel(DeviceType.android, "3000");
      final result4 =
          deviceNames.getNamesFromModel(DeviceType.android, "4003J");
      final result5 =
          deviceNames.getNamesFromModel(DeviceType.android, "5-Inches");
      final result6 = deviceNames.getNamesFromModel(DeviceType.android, "6002");
      final result7 =
          deviceNames.getNamesFromModel(DeviceType.android, "701HW");
      final result8 = deviceNames.getNamesFromModel(DeviceType.android, "80-1");
      final result9 =
          deviceNames.getNamesFromModel(DeviceType.android, "9 inch SDU");
      final resultA =
          deviceNames.getNamesFromModel(DeviceType.android, "A-TT00");
      final resultB =
          deviceNames.getNamesFromModel(DeviceType.android, "B BOT 550");
      final resultC =
          deviceNames.getNamesFromModel(DeviceType.android, "C Bot Tab 70");
      final resultD =
          deviceNames.getNamesFromModel(DeviceType.android, "D-805XATV HD");
      final resultE =
          deviceNames.getNamesFromModel(DeviceType.android, "E-Tab 4G");
      final resultF = deviceNames.getNamesFromModel(
          DeviceType.android, "F and U Android TV");
      final resultG =
          deviceNames.getNamesFromModel(DeviceType.android, "G Guard SMART TV");
      final resultH = deviceNames.getNamesFromModel(DeviceType.android, "H-35");
      final resultI =
          deviceNames.getNamesFromModel(DeviceType.android, "I star two");
      final resultJ = deviceNames.getNamesFromModel(DeviceType.android, "J101");
      final resultK =
          deviceNames.getNamesFromModel(DeviceType.android, "K-BOOK73G");
      final resultL =
          deviceNames.getNamesFromModel(DeviceType.android, "L-01E");
      final resultM =
          deviceNames.getNamesFromModel(DeviceType.android, "M BOT TAB 100");
      final resultN =
          deviceNames.getNamesFromModel(DeviceType.android, "N-01D");
      final resultO =
          deviceNames.getNamesFromModel(DeviceType.android, "O2 TV Box");
      final resultP =
          deviceNames.getNamesFromModel(DeviceType.android, "P-01K");
      final resultQ =
          deviceNames.getNamesFromModel(DeviceType.android, "Q Explorist HR");
      final resultR =
          deviceNames.getNamesFromModel(DeviceType.android, "R1 HD");
      final resultS =
          deviceNames.getNamesFromModel(DeviceType.android, "S-SAB220");
      final resultT =
          deviceNames.getNamesFromModel(DeviceType.android, "T-01D");
      final resultU =
          deviceNames.getNamesFromModel(DeviceType.android, "U FEEL");
      final resultV =
          deviceNames.getNamesFromModel(DeviceType.android, "V TAB 10'' LITE");
      final resultW =
          deviceNames.getNamesFromModel(DeviceType.android, "W-K130-EEA");
      final resultX =
          deviceNames.getNamesFromModel(DeviceType.android, "X MAX");
      final resultY = deviceNames.getNamesFromModel(DeviceType.android, "Y10");
      final resultZ =
          deviceNames.getNamesFromModel(DeviceType.android, "Z-2252");
      final resulta = deviceNames.getNamesFromModel(DeviceType.android, "a4");
      final resultb =
          deviceNames.getNamesFromModel(DeviceType.android, "b1-720");
      final resultc =
          deviceNames.getNamesFromModel(DeviceType.android, "calgary");
      final resultd =
          deviceNames.getNamesFromModel(DeviceType.android, "d-01H");
      final resulte =
          deviceNames.getNamesFromModel(DeviceType.android, "e-tab 20");
      final resultf = deviceNames.getNamesFromModel(DeviceType.android, "f400");
      final resultg = deviceNames.getNamesFromModel(DeviceType.android, "g06");
      final resulth = deviceNames.getNamesFromModel(DeviceType.android, "h33");
      final resulti =
          deviceNames.getNamesFromModel(DeviceType.android, "i-STYLE 713");
      final resultj =
          deviceNames.getNamesFromModel(DeviceType.android, "jupiter");
      final resultk =
          deviceNames.getNamesFromModel(DeviceType.android, "keeby");
      final resultl =
          deviceNames.getNamesFromModel(DeviceType.android, "l4300");
      final resultm =
          deviceNames.getNamesFromModel(DeviceType.android, "mDESK");
      final resultn =
          deviceNames.getNamesFromModel(DeviceType.android, "nJoy_Arcas_7");
      final resulto =
          deviceNames.getNamesFromModel(DeviceType.android, "omega_lite_4");
      final resultp =
          deviceNames.getNamesFromModel(DeviceType.android, "pearl");
      final resultq =
          deviceNames.getNamesFromModel(DeviceType.android, "quattro");
      final resultr = deviceNames.getNamesFromModel(
          DeviceType.android, "realme SA Smart TV");
      final results = deviceNames.getNamesFromModel(DeviceType.android, "s4");
      final resultt =
          deviceNames.getNamesFromModel(DeviceType.android, "tab10");
      final resultu =
          deviceNames.getNamesFromModel(DeviceType.android, "uie4027lgu");
      final resultv =
          deviceNames.getNamesFromModel(DeviceType.android, "v7-EEA");
      final resultw = deviceNames.getNamesFromModel(DeviceType.android, "w6");
      final resultx =
          deviceNames.getNamesFromModel(DeviceType.android, "xTablet-A680");
      final resulty =
          deviceNames.getNamesFromModel(DeviceType.android, "yetruepad21");
      final resultz = deviceNames.getNamesFromModel(DeviceType.android, "zx70");

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
  });

  group('Utils', () {
    test('Sentence case', () {
      final result = 'a'.sentenceCase();

      expect(result, 'A');
    });

    test('Get list with multiple devices', () {
      final result = modelExampleList.getList();

      expect(result.length, 3);
      expect(true, result.contains(modelExampleSome));
      expect(true, result.contains(modelExampleDevice));
      expect(true, result.contains(modelExampleData));
    });

    test('Get list with single device', () {
      final result = modelExampleDevice.getList();

      expect(result.length, 1);
      expect(true, result.contains(modelExampleDevice));
    });

    test('Get list with no devices', () {
      final result = modelExampleEmpty.getList();

      expect(result.length, 1);
      expect(true, result.contains(modelExampleEmpty));
    });

    test('Get first entry with multiple devices', () {
      final result = modelExampleList.getFirst();

      expect(result, modelExampleSome);
    });

    test('Get first entry with single device', () {
      final result = modelExampleDevice.getFirst();

      expect(result, modelExampleDevice);
    });

    test('Get first entry with no devices', () {
      final result = modelExampleEmpty.getFirst();

      expect(result, modelExampleEmpty);
    });
  });
}
