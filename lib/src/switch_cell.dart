//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library gizmos_settings_screen;

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './enums/accessory_type.dart';
import './settings_cell.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// Switch Settings Cell
/// This generates a toggle/switch cell with an optional icon/image, title, subtitle, value (used to set the initial value of the switch) and accessory
class SwitchSettingsCell extends SettingsCell {
  // Fields
  final String title;
  final String subtitle;
  final bool value;
  final Widget leadingWidget;
  final AccessoryType accessoryType;
  final Function(bool) onChanged;

  // Constructor
  /// Switch Settings Cell
  /// This generates a toggle/switch cell with an optional icon/image, title, subtitle, value (used to set the initial value of the switch) and accessory
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [value] current value for this setting/cell
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [onChanged] callback method called when the value of the swich changes
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  SwitchSettingsCell({Key key, Set<MaterialState> initialStates, this.title, this.subtitle, bool value, this.leadingWidget, AccessoryType accessoryType, VoidCallback onPressed, this.onChanged, Map<String, dynamic> extraInfo})
      : accessoryType = accessoryType ?? AccessoryType.None,
        value = value ?? false,
        super(key: key, initialStates: initialStates, onPressed: onPressed, extraInfo: extraInfo);

  /// buildContents() is called by the parent's state build() method
  /// - treat this like the build() call of a normal [StatelessWidget], but with the additional [materialStates] object that can be used for customization
  @override
  Widget buildContents(BuildContext context, {Set<MaterialState> materialStates}) {
    materialStates ??= <MaterialState>{};
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();
    return skinDelegate.switchContent(context, materialStates: materialStates, title: title, subtitle: subtitle, value: value, leadingWidget: leadingWidget, accessoryType: accessoryType, onChanged: onChanged, extraInfo: extraInfo);
  }
}
