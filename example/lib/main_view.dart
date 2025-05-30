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
import 'option_view.dart';

class MainView extends StatefulWidget {
  // Fields
  final String title;

  // Constructor
  MainView({Key? key, required this.title}) : super(key: key);

  // State
  @override
  _MainViewState createState() {
    updateSkin();
    return _MainViewState();
  }

  void updateSkin() {
    if (useDarkMode) {
      skinDelegate = useMaterial ? MaterialDarkSettingsSkin() : CupertinoDarkSettingsSkin();
    } else {
      skinDelegate = useMaterial ? MaterialSettingsSkin() : CupertinoSettingsSkin();
    }
  }
}

class _MainViewState extends State<MainView> {
  // Helper Methods
  Future<void> showSimpleAlert(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok', textAlign: TextAlign.end),
            ),
          ],
        );
      },
    );
  }

  // Build
  @override
  Widget build(BuildContext context) {
    var settingsScreen = SettingsSkin(
      delegate: skinDelegate,
      child: SettingsScreen(
        sections: [
          SettingsSection(
            header: 'Theme Options',
            cells: [
              ButtonSettingsCell(
                type: ButtonType.Normal,
                title: useDarkMode ? 'Switch to Light' : 'Switch to Dark',
                onPressed: () {
                  useDarkMode = !useDarkMode;
                  setState(() {
                    widget.updateSkin();
                  });
                },
              ),
              ButtonSettingsCell(
                type: ButtonType.Normal,
                title: useMaterial ? 'Switch to Cupertino' : 'Switch to Material',
                onPressed: () {
                  useMaterial = !useMaterial;
                  setState(() {
                    widget.updateSkin();
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            header: 'Sample Cells',
            footer: 'You can see some of the built-in cell types above.',
            cells: [
              DetailsSettingsCell(
                title: 'A details setting cell',
              ),
              DetailsSettingsCell(
                title: 'A details setting cell, with a tapable action',
                onPressed: () async {
                  return await showSimpleAlert('Awesome', 'You tapped the cell. Here, we\'re just showing an alert, but you could do anything...');
                },
              ),
              DetailsSettingsCell(
                title: 'Another details setting cell',
                subtitle: 'With a subtitle',
              ),
              DetailsSettingsCell(
                title: 'Yet another details setting cell',
                subtitle: 'With a subtitle',
                value: 'and a value',
              ),
              DetailsSettingsCell(
                title: 'This one has a leading widget',
                value: 'On',
                leadingWidget: Icon(
                  Icons.fact_check,
                  color: Colors.blue,
                ),
              ),
              DetailsSettingsCell(
                title: 'A details cell with a long text message that overflows.',
              ),
              SwitchSettingsCell(
                title: 'A switch setting cell',
                subtitle: 'This also supports a subtitle',
                value: prefs.getBool('sampleBooleanSetting') ?? defaultSampleBooleanSetting,
                onPressed: () async {
                  await prefs.setBool('sampleBooleanSetting', !(prefs.getBool('sampleBooleanSetting') ?? defaultSampleBooleanSetting));
                  setState(() {});
                },
                onChanged: (bool value) async {
                  await prefs.setBool('sampleBooleanSetting', value);
                  setState(() {});
                },
              ),
              SliderSettingsCell(
                title: 'A slider settings cell',
                subtitle: 'Watch the star on the left',
                value: prefs.getDouble('sampleDoubleSetting') ?? defaultDoubleSetting,
                leadingWidget: Opacity(
                  opacity: prefs.getDouble('sampleDoubleSetting') ?? defaultDoubleSetting,
                  child: Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                ),
                onChanged: (value) async {
                  await prefs.setDouble('sampleDoubleSetting', value);
                  setState(() {});
                },
              ),
              SliderSettingsCell(
                initialStates: {WidgetState.disabled},
                title: 'A disabled slider',
                value: prefs.getDouble('sampleDoubleSetting2') ?? defaultDoubleSetting2,
                onChanged: (value) async {
                  await prefs.setDouble('sampleDoubleSetting2', value);
                  setState(() {});
                },
              ),
              DetailsSettingsCell(
                title: 'Dog breed',
                value: (DogTypeAdditions.fromId(prefs.getString('sampleDogType')).description),
                accessoryType: AccessoryType.Disclosure,
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute<OptionView>(builder: (context) => OptionView(title: 'Dog Breed')));
                  setState(() {});
                },
              ),
              DetailsSettingsCell(
                title: 'Checkmark accessory',
                accessoryType: AccessoryType.Check,
              ),
              DetailsSettingsCell(
                title: 'A custom accessory',
                accessoryType: AccessoryType.Custom,
                extraInfo: <String, dynamic>{'CustomAccessory': Icon(Icons.info_outline_rounded, color: skinDelegate.primaryColor())},
              ),
              ButtonSettingsCell(
                type: ButtonType.Normal,
                title: 'Do something',
                onPressed: () async {
                  return await showSimpleAlert('Did something', 'Was it everything you\'d hoped it would be?');
                },
              ),
              ButtonSettingsCell(
                type: ButtonType.Normal,
                title: 'Do something else',
                subtitle: 'With a subtitle',
                onPressed: () async {
                  return await showSimpleAlert('Did something else', 'Was it even better than the other thing?');
                },
              ),
              ButtonSettingsCell(
                type: ButtonType.Cancel,
                title: 'Cancel',
                onPressed: () async {
                  return await showSimpleAlert('Cancelled', 'Not that you\'d notice...');
                },
              ),
              ButtonSettingsCell(
                type: ButtonType.Destructive,
                title: 'Destroy!',
                onPressed: () async {
                  return await showSimpleAlert('Destroyed', 'It\'ll be back.');
                },
              ),
              ButtonSettingsCell(
                type: ButtonType.Destructive,
                initialStates: {WidgetState.disabled},
                title: 'Destroy (Disabled)',
                onPressed: () async {
                  return await showSimpleAlert('Peek-a-boo!', 'This shouldn\'t run since the button is disabled.');
                },
              ),
              ButtonSettingsCell(
                type: ButtonType.Normal,
                initialStates: {WidgetState.disabled},
                title: 'Disabled',
                onPressed: () async {
                  return await showSimpleAlert('Peek-a-boo!', 'This shouldn\'t run since the button is disabled.');
                },
              ),
            ],
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
