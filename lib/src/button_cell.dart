//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './enums/accessory_type.dart';
import './enums/button_type.dart';
import './settings_cell.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// Button Settings Cell
/// This generates a button cell with an optional icon/image, title, subtitle, and accessory
class ButtonSettingsCell extends SettingsCell {
  // Fields
  final ButtonType type;
  final String title;
  final String subtitle;
  final Widget? leadingWidget;
  final AccessoryType accessoryType;

  // Constructor
  /// Button Settings Cell
  /// This generates a button cell with an optional icon/image, title, subtitle, and accessory
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [type] a button type (Normal, Cancel, Destructive, or Custom)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [onPressed] the function to call when the button is pressed
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  ButtonSettingsCell({Key? key, Set<MaterialState>? initialStates, this.type = ButtonType.Normal, this.title = '', this.subtitle = '', this.leadingWidget, this.accessoryType = AccessoryType.None, VoidCallback? onPressed, Map<String, dynamic>? extraInfo})
      : super(key: key, initialStates: initialStates, onPressed: onPressed, extraInfo: extraInfo);

  /// buildContents() is called by the parent's state build() method
  /// - treat this like the build() call of a normal [StatelessWidget], but with the additional [materialStates] object that can be used for customization
  @override
  Widget buildContents(BuildContext context, {Key? key, Set<MaterialState>? materialStates}) {
    materialStates ??= <MaterialState>{};
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();
    return skinDelegate.buttonContent(context, key: key, type: type, materialStates: materialStates, title: title, subtitle: subtitle, leadingWidget: leadingWidget, accessoryType: accessoryType, extraInfo: extraInfo);
  }
}
