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

import './enums/button_type.dart';
import './enums/accessory_type.dart';
import './settings_section.dart';

/// SettingsSkin is an [InheritedWidget] that wraps your settings screen and allows you to apply a custom skin to be used when rendering the widgets
/// All rendering will be handled by the [SettingsSkinDelegate] set by your application
class SettingsSkin extends InheritedWidget {
  // Static Methods
  static SettingsSkin of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingsSkin>();
  }

  // Fields
  final SettingsSkinDelegate delegate;

  // Constructor
  SettingsSkin({Key key, @required this.delegate, @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

/// The abstract [SettingsSkinDelegate] class that your skins must subclass
/// This lists the minimum methods that need to be included in your subclasses, though the provided skins sometimes contain some other common methods
/// See [DefaultSkin], [CupertinoSettingsSkin], [CupertinoDarkSettingsSkin], [MaterialSettingsSkin], [MaterialDarkSettingsSkin] for examples of subclasses
/// In most cases, you'll likely want to subclass one of those
abstract class SettingsSkinDelegate {
  // Constructor
  SettingsSkinDelegate() : super();

  // Customization Methods
  // - Colours
  // - - basic
  Color primaryColor({Set<MaterialState> materialStates});

  // - - backgrounds
  Color appHeaderBackgroundColor(BuildContext context);

  Color appBackgroundColor(BuildContext context);

  Color listBackgroundColor(BuildContext context);

  Color headerBackgroundColor(BuildContext context, {Map<String, dynamic> extraInfo});

  Color footerBackgroundColor(BuildContext context, {Map<String, dynamic> extraInfo});

  Color cellBackgroundColor(BuildContext context, {Set<MaterialState> materialStates, Map<String, dynamic> extraInfo});

  // Text Styles
  // - app header
  TextStyle appHeaderTextStyle(BuildContext context);

  // - header
  TextStyle headerTextStyle(BuildContext context, {Map<String, dynamic> extraInfo});

  // - footer
  TextStyle footerTextStyle(BuildContext context, {Map<String, dynamic> extraInfo});

  // - title
  TextStyle titleTextStyle(BuildContext context, {Set<MaterialState> materialStates, Map<String, dynamic> extraInfo});

  TextStyle subtitleTextStyle(BuildContext context, {Set<MaterialState> materialStates, Map<String, dynamic> extraInfo});

  // - value
  TextStyle valueTextStyle(BuildContext context, {Set<MaterialState> materialStates, Map<String, dynamic> extraInfo});

  // Options
  ScrollPhysics defaultScrollPhysics(BuildContext context);

  // Widget Generators
  /// Section Header
  Widget sectionHeader(BuildContext context, String title, {Map<String, dynamic> extraInfo});

  /// Section Footer
  Widget sectionFooter(BuildContext context, String footer, {Map<String, dynamic> extraInfo});

  /// Section
  Widget section(BuildContext context, SettingsSection section);

  /// Cells

  /// Settings Cell Topper
  /// - a widget to appear above of the settings cell (keyline or something)
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [cellIndex] the index number of this cell in its section
  /// - [cellCount] the total number of cells in its section
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  Widget settingsCellTop(BuildContext context, {Key key, Set<MaterialState> materialStates, @required int cellIndex, @required int cellCount, Map<String, dynamic> extraInfo});

  /// Settings Cell Bottom
  /// - a widget to appear below of the settings cell (keyline or something)
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [cellIndex] the index number of this cell in its section
  /// - [cellCount] the total number of cells in its section
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  Widget settingsCellBottom(BuildContext context, {Key key, Set<MaterialState> materialStates, @required int cellIndex, @required int cellCount, Map<String, dynamic> extraInfo});

  /// Setting Cell
  /// This generates the frame of a settings cell, with the contents supplied by the [child] parameter
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  /// - [child] the rendered contents of the cell, possibly generated via one of the ...Content() methods below
  Widget settingsCell(BuildContext context, {Key key, Set<MaterialState> materialStates, Map<String, dynamic> extraInfo, Widget child});

  /// Details Content
  /// This generates the internal contents of a standard details cell with an optional icon/image, title, subtitle, value and accessory
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [value] current value for this setting/cell
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  Widget detailsContent(BuildContext context, {Key key, Set<MaterialState> materialStates, String title, String subtitle, String value, Widget leadingWidget, AccessoryType accessoryType, Map<String, dynamic> extraInfo});

  /// Switch Content
  /// This generates the internal contents of a toggle/switch cell with an optional icon/image, title, subtitle, value (used to set the initial value of the switch) and accessory
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [value] current value for this setting/cell
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [onChanged] callback method called when the value of the swich changes
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  Widget switchContent(BuildContext context, {Key key, Set<MaterialState> materialStates, String title, String subtitle, bool value, Widget leadingWidget, AccessoryType accessoryType, @required Function(bool) onChanged, Map<String, dynamic> extraInfo});

  /// Slider Content
  /// This generates the internal contents of a slider cell with an optional icon/image, title, subtitle, value (used to set the initial value of the slider) and accessory
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [value] current value for this setting/cell
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [onChanged] callback method called when the value of the slider changes
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  Widget sliderContent(BuildContext context, {Key key, Set<MaterialState> materialStates, String title, String subtitle, double value, Widget leadingWidget, AccessoryType accessoryType, @required Function(double) onChanged, Map<String, dynamic> extraInfo});

  /// Button Content
  /// This generates the internal contents of a button cell with an optional icon/image, title, subtitle, and accessory
  /// Note: the callback to handle the button press is handled in the main settings cell, so it isn't passed down to this content method
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [type] a button type (Normal, Cancel, Destructive, or Custom)
  /// - [title] main text description
  /// - [subtitle] secondary text description
  /// - [leadingWidget] an optional leading image/icon
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  Widget buttonContent(BuildContext context, {Key key, Set<MaterialState> materialStates, ButtonType type, String title, String subtitle, Widget leadingWidget, AccessoryType accessoryType, Map<String, dynamic> extraInfo});
}
