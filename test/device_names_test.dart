import 'package:device_names/device_names.dart';
import 'package:device_names/src/device_lookup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Lookup Android device (OnePlus 8T)', () {
    final result = lookupName(DeviceType.android, "KB2005");

    expect(result, 'OnePlus 8T');
  });

  test('Lookup iOS device (iPhone 12 Pro Max)', () {
    final result = lookupName(DeviceType.ios, "iPhone13,4");

    expect(result, 'iPhone 12 Pro Max');
  });

  test('Lookup by model (iPhone 12 Pro Max)', () {
    final deviceNames = DeviceNames();
    final result = deviceNames.getMarketingNameFromModel(DeviceType.ios, "iPhone13,4");

    expect(result, 'iPhone 12 Pro Max');
  });

  test('Fail lookup', () {
    final result = lookupName(DeviceType.ios, "no_match");

    expect(result, null);
  });
}
