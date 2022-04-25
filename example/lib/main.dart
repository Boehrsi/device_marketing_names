import 'dart:async';

import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DeviceNamesExample());
}

class DeviceNamesExample extends StatefulWidget {
  const DeviceNamesExample({Key? key}) : super(key: key);

  @override
  State<DeviceNamesExample> createState() => _DeviceNamesExampleState();
}

class _DeviceNamesExampleState extends State<DeviceNamesExample> {
  String singleDeviceName = "Unknown";
  String singleDeviceNameFromModel = "Unknown";
  String deviceNames = "Unknown";
  String deviceNamesFromModel = "Unknown";

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  Future<void> initPlugin() async {
    const model = "SM-J250F";
    final deviceMarketingNames = DeviceMarketingNames();
    final currentSingleDeviceName = await deviceMarketingNames.getSingleName();
    final currentDeviceNames = await deviceMarketingNames.getNames();
    setState(() {
      singleDeviceName = currentSingleDeviceName;
      deviceNames = currentDeviceNames;
      singleDeviceNameFromModel = deviceMarketingNames.getSingleNameFromModel(
          DeviceType.android, model);
      deviceNamesFromModel =
          deviceMarketingNames.getNamesFromModel(DeviceType.android, model);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DeviceNames example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'First device name:\n$singleDeviceName',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'All possible device names:\n$deviceNames',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'First device name for model "SM-J250F":\n$singleDeviceNameFromModel',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'All possible device names for model "SM-J250F":\n$deviceNamesFromModel',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
