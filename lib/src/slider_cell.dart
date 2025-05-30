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
import './settings_cell.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// Slider Settings Cell
/// This generates a slider cell with an optional icon/image, title, subtitle, value (used to set the initial value of the slider) and accessory
class SliderSettingsCell extends SettingsCell {
  // Fields
  final String title;
  final String subtitle;
  final double value;
  final Widget? leadingWidget;
  final AccessoryType accessoryType;
  final Function(double) onChanged;

  // Constructor
  /// Slider Settings Cell
  /// This generates a slider cell with an optional icon/image, title, subtitle, value (used to set the initial value of the slider) and accessory
  /// - [initialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [value] current value for this setting/cell
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [onChanged] callback method called when the value of the slider changes
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  SliderSettingsCell({Key? key, Set<MaterialState>? initialStates, this.title = '', this.subtitle = '', this.value = 0.0, this.leadingWidget, this.accessoryType = AccessoryType.None, VoidCallback? onPressed, required this.onChanged, Map<String, dynamic>? extraInfo})
      : super(key: key, initialStates: initialStates, onPressed: onPressed, extraInfo: extraInfo);

  /// buildContents() is called by the parent's state build() method
  /// - treat this like the build() call of a normal [StatelessWidget], but with the additional [materialStates] object that can be used for customization
  @override
  Widget buildContents(BuildContext context, {Set<MaterialState>? materialStates}) {
    materialStates ??= <MaterialState>{};
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();
    return skinDelegate.sliderContent(context, materialStates: materialStates, title: title, subtitle: subtitle, value: value, leadingWidget: leadingWidget, accessoryType: accessoryType, onChanged: onChanged, extraInfo: extraInfo);
  }
}
