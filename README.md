# Device Names

A simple device name lookup package. Map e.g. 'iPhone13,4' to 'iPhone 12 Pro Max' or 'SM-G980F' to 'Galaxy S20'. No internet connection or database required.

## Features

- Lookup iOS (iPhone & iPad) marketing names
- Lookup Android marketing names
- Relies on [device_info_plus](https://pub.dev/packages/device_info_plus) to get the current device information
- Get the marketing name of the current device or by an already known model

## Usage

### Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  device_marketing_names: ^0.1.0
```

More information on [pub.dev](https://pub.dev/packages/device_marketing_names).

### Examples

For full examples please see the [example app](https://github.com/Boehrsi/device_marketing_names/blob/main/example/lib/main.dart).

```dart
final deviceName = await deviceNames.getMarketingName();
final deviceNameFromModel = deviceNames.getMarketingNameFromModel(DeviceType.android, "ONEPLUS A5010");
```

## Sources

The data is delivered by [device_identifiers](https://github.com/Boehrsi/device_identifiers) which fetches the following sources. Updates are integrated regularly. 

- **iOS**: https://github.com/SeparateRecords/apple_device_identifiers
- **Android**: https://storage.googleapis.com/play_public/supported_devices.html (via https://support.google.com/googleplay/answer/1727131?hl=en)

## How to contribute

If you are interested in contributing, please have a look into the [contribution guide](https://github.com/Boehrsi/device_marketing_names/blob/main/CONTRIBUTING.md). Every
idea, bug report or line of code is heavily appreciated.
