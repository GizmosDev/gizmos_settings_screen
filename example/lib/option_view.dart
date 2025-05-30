//
//  gizmos_settings_screen_example
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gizmos_settings_screen/gizmos_settings_screen.dart';

import 'dog_type.dart';
import 'main.dart';

class OptionView extends StatefulWidget {
  // Fields
  final String title;

  // Constructor
  const OptionView({super.key, this.title = 'Dog Breed'});

  // State
  @override
  State<OptionView> createState() => _OptionViewState();
}

class _OptionViewState extends State<OptionView> {
  // Properties

  // Build
  @override
  Widget build(BuildContext context) {
    var cells = <SettingsCell>[];
    var sampleDogType = DogTypeAdditions.fromId(prefs.getString('sampleDogType'));

    for (var dogType in DogType.values) {
      final cell = DetailsSettingsCell(
        title: dogType.description,
        accessoryType: dogType == sampleDogType ? AccessoryType.check : AccessoryType.none,
        onPressed: () async {
          await prefs.setString('sampleDogType', dogType.id);
          setState(() {});
          if (!context.mounted) return;
          Navigator.of(context).pop();
        },
      );

      cells.add(cell);
    }

    var settingsScreen = SettingsSkin(
      delegate: skinDelegate,
      child: SettingsScreen(
        sections: [
          SettingsSection(
            cells: cells,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: skinDelegate.appHeaderTextStyle(context)),
        iconTheme: IconThemeData(
          color: skinDelegate.primaryColor(), //change your color here
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: useDarkMode ? Brightness.dark : Brightness.light,
        ),
        backgroundColor: skinDelegate.appHeaderBackgroundColor(context),
      ),
      body: SafeArea(
        child: settingsScreen,
      ),
      backgroundColor: skinDelegate.appBackgroundColor(context),
      floatingActionButton: null,
    );
  }
}
