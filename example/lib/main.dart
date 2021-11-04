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
  String deviceName = "Unknown";
  String deviceNameFromModel = "Unknown";
  String lookupState = "Waiting for lookup";

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  Future<void> initPlugin() async {
    final deviceNames = DeviceMarketingNames();
    final _deviceName = await deviceNames.getMarketingName() ?? "Not found";
    final _deviceNameFromModel = deviceNames.getMarketingNameFromModel(
            DeviceType.android, "ONEPLUS A5010") ??
        "Not found";
    setState(() {
      deviceName = _deviceName;
      deviceNameFromModel = _deviceNameFromModel;
      lookupState = "Done";
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Lookup state: $lookupState',
                textAlign: TextAlign.center,
              ),
              Text(
                'Device: $deviceName',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(
                  'Device lookup for specific model (ONEPLUS A5010): $deviceNameFromModel',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
