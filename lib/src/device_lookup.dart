import 'device_identifiers.dart';

enum DeviceType {
  android,
  ios,
}

String? lookupName(DeviceType type, String? model) {
  if (model == null) {
    return null;
  }
  switch (type) {
    case DeviceType.android:
      return android[model];
    case DeviceType.ios:
      return iOS[model];
  }
}
