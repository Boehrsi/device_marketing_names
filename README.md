[![Pub Version](https://img.shields.io/pub/v/device_marketing_names)](https://pub.dev/packages/device_marketing_names)
[![codecov](https://codecov.io/gh/Boehrsi/device_marketing_names/branch/main/graph/badge.svg?token=HCTVMPPX2V)](https://codecov.io/gh/Boehrsi/device_marketing_names)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Boehrsi/device_marketing_names/main.yml)](https://github.com/Boehrsi/device_marketing_names/actions)
[![GitHub](https://img.shields.io/github/license/boehrsi/device_marketing_names)](https://github.com/Boehrsi/device_marketing_names/blob/main/LICENSE)
[![likes](https://img.shields.io/pub/likes/device_marketing_names)](https://pub.dev/packages/device_marketing_names/score)
[![popularity](https://img.shields.io/pub/popularity/device_marketing_names)](https://pub.dev/packages/device_marketing_names/score)
[![pub points](https://img.shields.io/pub/points/device_marketing_names)](https://pub.dev/packages/device_marketing_names/score)

# Device Marketing Names

A simple device name lookup package. Map e.g. 'iPhone13,4' to 'iPhone 12 Pro Max' or 'SM-G980F' to 'Galaxy S20'. No internet connection or database required.

<a href="https://idx.google.com/import?url=https://github.com/Boehrsi/device_marketing_names">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="https://cdn.idx.dev/btn/open_dark_32.svg">
    <source
      media="(prefers-color-scheme: light)"
      srcset="https://cdn.idx.dev/btn/open_light_32.svg">
    <img
      height="32"
      alt="Open in IDX"
      src="https://cdn.idx.dev/btn/open_purple_32.svg">
  </picture>
</a>

## Features

- Lookup Android marketing names
- Lookup iOS (iPhone & iPad) marketing names
- Lookup web browser names
- Get the marketing name of the current device or by an already known Android or iOS model
- Relies on [device_info_plus](https://pub.dev/packages/device_info_plus) to get the current device model information on Android or iOS and
  [device_identifiers](https://github.com/Boehrsi/device_identifiers) which maps those to the marketing names. The browser name is forwarded directly from
  device_info_plus

## Usage

### Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  device_marketing_names: ^0.9.4
```

More information on [pub.dev](https://pub.dev/packages/device_marketing_names).

### Examples

For full examples please see the [example app](https://github.com/Boehrsi/device_marketing_names/blob/main/example/lib/main.dart).

```dart
final deviceNames = DeviceMarketingNames();

// Get one marketing name of the device.
final singleDeviceName = await deviceNames.getSingleName();

// Get all marketing names of the device.
final allDeviceNames = await deviceNames.getNames();

// Get one marketing name for the given model.
final singleDeviceNameFromModel = deviceNames.getSingleNameFromModel(DeviceType.android, "ONEPLUS A5010");

// Get all marketing names for the given model.
final allDeviceNamesFromModel = deviceNames.getNamesFromModel(DeviceType.android, "ONEPLUS A5010");
```

### Migration from 0.3.0 to 0.4.0

- Replace `getMarketingName()` with `getSingleName()` if you want to get exactly one matching name.
- Replace `getMarketingName()` with `getNames()` if you want all matching names as a single string. Names are separated by " / ".
- Replace `getMarketingNameFromModel()` with `getSingleNameFromModel()` if you want to get exactly one matching name.
- Replace `getMarketingNameFromModel()` with `getNamesFromModel()` if you want all matching names as a single string. Names are separated by " / ".

## How to contribute

If you are interested in contributing, please have a look into
the [contribution guide](https://github.com/Boehrsi/device_marketing_names/blob/main/CONTRIBUTING.md). Every idea, bug report or line of code is heavily
appreciated.
