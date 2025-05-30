//
//  gizmos_settings_screen_example
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gizmos_settings_screen/gizmos_settings_screen.dart';

import 'dog_type.dart';
import 'main_view.dart';

bool useMaterial = !Platform.isIOS;

// Note: useDarkMode could be enhanced to query the system setting
bool useDarkMode = false;

bool defaultSampleBooleanSetting = false;
double defaultDoubleSetting = 0.5;
double defaultDoubleSetting2 = 0.5;
DogType defaultSampleDogType = DogType.cavalierKingCharlesSpaniel;

late SharedPreferences prefs;
late SettingsSkinDelegate skinDelegate;

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  static void updateSkin() {
    if (useDarkMode) {
      skinDelegate = useMaterial ? MaterialDarkSettingsSkin() : CupertinoDarkSettingsSkin();
    } else {
      skinDelegate = useMaterial ? MaterialSettingsSkin() : CupertinoSettingsSkin();
    }
  }

  // Build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gizmos.Dev Settings Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainView(title: 'Gizmos.Dev Settings Screen Example'),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  ExampleApp.updateSkin();

  // Check if we've saved a dog type yet, if not assign the default
  // Note: this is only needed because the way I've set up the DogType enum,
  // it will default to DogType.Other which isn't as good as our desired default
  var savedDogTypeId = prefs.getString('sampleDogType') ?? '';
  if (savedDogTypeId.isEmpty) {
    await prefs.setString('sampleDogType', defaultSampleDogType.id);
  }

  runApp(ExampleApp());
}
