//
//  gizmos_settings_screen_example
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

import 'package:flutter/material.dart';
import 'package:gizmos_settings_screen/gizmos_settings_screen.dart';

import 'dog_type.dart';
import 'main.dart';

class OptionView extends StatefulWidget {
  // Fields
  final String title;

  // Constructor
  OptionView({Key key, this.title = 'Dog Breed'}) : super(key: key);

  // State
  @override
  _OptionViewState createState() => _OptionViewState();
}

class _OptionViewState extends State<OptionView> {
  // Properties

  // Build
  @override
  Widget build(BuildContext context) {
    var cells = <SettingsCell>[];
    var sampleDogType = DogTypeAdditions.fromId(prefs.getString('sampleDogType'));

    DogType.values.forEach((dogType) {
      var cell = DetailsSettingsCell(
        title: dogType.description,
        accessoryType: dogType == sampleDogType ? AccessoryType.Check : AccessoryType.None,
        onPressed: () async {
          await prefs.setString('sampleDogType', dogType.id);
          setState(() {});
          await Navigator.of(context).pop();
        },
      );

      cells.add(cell);
    });

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
        brightness: useDarkMode ? Brightness.dark : Brightness.light,
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
