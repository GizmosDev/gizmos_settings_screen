//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './enums/accessory_type.dart';
import './settings_cell.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// Details Settings Cell
/// This generates a standard details cell with an optional icon/image, title, subtitle, value and accessory
class DetailsSettingsCell extends SettingsCell {
  // Fields
  final String title;
  final String subtitle;
  final String value;
  final Widget? leadingWidget;
  final AccessoryType accessoryType;

  // Constructor
  /// Details Settings Cell
  /// This generates a standard details cell with an optional icon/image, title, subtitle, value and accessory
  /// - [context] the current BuildContext
  /// - [widgetStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [value] current value for this setting/cell
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  DetailsSettingsCell({super.key, super.initialStates, this.title = '', this.subtitle = '', this.value = '', this.leadingWidget, this.accessoryType = AccessoryType.none, super.onPressed, super.extraInfo});

  /// buildContents() is called by the parent's state build() method
  /// - treat this like the build() call of a normal [StatelessWidget], but with the additional [widgetStates] object that can be used for customization
  @override
  Widget buildContents(BuildContext context, {Key? key, Set<WidgetState>? widgetStates}) {
    widgetStates ??= <WidgetState>{};
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();
    return skinDelegate.detailsContent(context, key: key, widgetStates: widgetStates, title: title, subtitle: subtitle, value: value, leadingWidget: leadingWidget, accessoryType: accessoryType, extraInfo: extraInfo);
  }
}
