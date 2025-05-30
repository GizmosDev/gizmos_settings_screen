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

import '../enums/button_type.dart';
import '../enums/accessory_type.dart';
import '../extensions/color.dart';
import '../extensions/material_state.dart';
import '../settings_section.dart';
import '../skins/default.dart';

/// CupertinoSettingsSkin
/// Modeled to closely resemble a plain settings screen on iOS
class CupertinoSettingsSkin extends DefaultSkin {
  // Constructor
  CupertinoSettingsSkin() : super();

  // Customization Methods
  // - Colours
  // - - tints
  @override
  Color primaryColor({Set<MaterialState>? materialStates}) {
    materialStates ??= <MaterialState>{};
    return Colors.blue.withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  // - - backgrounds
  @override
  Color appHeaderBackgroundColor(BuildContext context) {
    return HexColor.fromHex('#fbfbfd');
  }

  @override
  Color appBackgroundColor(BuildContext context) {
    return HexColor.fromHex('#f2f2f6');
  }

  @override
  Color listBackgroundColor(BuildContext context) {
    return HexColor.fromHex('#f2f2f6');
  }

  @override
  Color headerBackgroundColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return listBackgroundColor(context);
  }

  @override
  Color footerBackgroundColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return headerBackgroundColor(context);
  }

  @override
  Color cellBackgroundColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};

    if (materialStates.isPressed) {
      return HexColor.fromHex('#d1d1d6');
    } else if (materialStates.isHovering || materialStates.isFocused) {
      return primaryColor().withAlpha(50);
    } else if (materialStates.isSelected) {
      return primaryColor().withAlpha(100);
    } else if (materialStates.isDisabled) {
      return Colors.grey[200] ?? Colors.grey;
    } else {
      // isNormal
      return Colors.white;
    }
  }

  // - - text colours
  @override
  Color appHeaderTextColor(BuildContext context) {
    return Colors.black;
  }

  @override
  Color headerTextColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#828286');
  }

  @override
  Color footerTextColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return headerTextColor(context);
  }

  @override
  Color titleTextColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};

    if (materialStates.isPressed) {
      return Colors.grey[900] ?? Colors.grey;
    } else if (materialStates.isHovering || materialStates.isFocused) {
      return (Colors.grey[900] ?? Colors.grey).withAlpha(100);
    } else if (materialStates.isSelected) {
      return (Colors.grey[900] ?? Colors.grey).withAlpha(200);
    } else if (materialStates.isDisabled) {
      return Colors.grey;
    } else {
      // isNormal
      return (Colors.grey[900] ?? Colors.grey);
    }
  }

  @override
  Color subtitleTextColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return titleTextColor(context, materialStates: materialStates, extraInfo: extraInfo);
  }

  @override
  Color valueTextColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#929295');
  }

  // - - Switch
  @override
  Color? switchActiveColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    return HexColor.fromHex('#35c759').withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  Color? switchTrackColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    return HexColor.fromHex('#e9e9eb').withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  // - - Slider
  Color? sliderActiveColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return primaryColor(materialStates: materialStates);
  }

  @override
  Color? sliderThumbColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return Colors.white;
  }

  // - - misc
  @override
  Color keylineColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return showKeylines(context) ? HexColor.fromHex('#e2e2e5') : Colors.transparent;
  }

  @override
  Color accessoryColor(BuildContext context, {AccessoryType accessoryType = AccessoryType.None, Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};

    switch (accessoryType) {
      case AccessoryType.Check:
        return primaryColor(materialStates: materialStates);

      case AccessoryType.Disclosure:
        return materialStates.isPressed ? HexColor.fromHex('#a4a4aa') : HexColor.fromHex('#c4c4c7');

      case AccessoryType.Custom:
        return primaryColor(materialStates: materialStates);

      case AccessoryType.None:
      default:
        return Colors.transparent;
    }
  }

  // Text Styles
  // - app header
  @override
  TextStyle appHeaderTextStyle(BuildContext context) {
    return TextStyle(color: appHeaderTextColor(context), fontFamily: 'Helvetica Neue', fontSize: 18, fontWeight: FontWeight.w700);
  }

  // - header
  @override
  TextStyle headerTextStyle(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: headerTextColor(context, extraInfo: extraInfo), fontFamily: 'Helvetica Neue', fontSize: 13, fontWeight: FontWeight.w400);
  }

  // - footer
  @override
  TextStyle footerTextStyle(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: footerTextColor(context, extraInfo: extraInfo), fontFamily: 'Helvetica Neue', fontSize: 13, fontWeight: FontWeight.w400);
  }

  // - title
  @override
  TextStyle titleTextStyle(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: titleTextColor(context, materialStates: materialStates, extraInfo: extraInfo), fontFamily: 'Helvetica Neue', fontSize: 17, fontWeight: FontWeight.w400);
  }

  @override
  TextStyle subtitleTextStyle(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: subtitleTextColor(context, materialStates: materialStates, extraInfo: extraInfo), fontFamily: 'Helvetica Neue', fontSize: 12, fontWeight: FontWeight.w300);
  }

  // - value
  @override
  TextStyle valueTextStyle(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: valueTextColor(context, materialStates: materialStates, extraInfo: extraInfo), fontFamily: 'Helvetica Neue', fontSize: 16, fontWeight: FontWeight.w400);
  }

  // Dimensions
  @override
  double headerHeight(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return 56.0;
  }

  @override
  double footerHeight(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return 20.0;
  }

  @override
  double rowHeight(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return 40.0;
  }

  @override
  double keylineThickness(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return 1.0;
  }

  // Options
  @override
  bool showKeylines(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return true;
  }

  @override
  ScrollPhysics defaultScrollPhysics(BuildContext context) {
    return BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }

  // Misc Widget Helpers
  @override
  Widget leadingCellPadding(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return SizedBox(width: 20, height: 20);
  }

  @override
  Widget trailingCellPadding(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return SizedBox(width: 20, height: 20);
  }

  @override
  Widget horizontalPadding(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return SizedBox(width: 4, height: 1);
  }

  @override
  Widget verticalPadding(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return SizedBox(width: 1, height: 4);
  }

  @override
  Widget keyline(BuildContext context, {Key? key, double indent = 0.0, Map<String, dynamic>? extraInfo}) {
    if (!showKeylines(context)) return SizedBox.shrink();

    var mediaQuery = MediaQuery.of(context);
    var contextWidth = mediaQuery.size.width;

    var keyline = Container(
      width: contextWidth - indent,
      height: keylineThickness(context, extraInfo: extraInfo),
      color: keylineColor(context, extraInfo: extraInfo),
      child: SizedBox.shrink(),
    );

    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [keyline],
    );
  }

  @override
  Widget? accessoryWidget(BuildContext context, {AccessoryType accessoryType = AccessoryType.None, Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    Widget? accessoryWidget;

    switch (accessoryType) {
      case AccessoryType.Check:
        accessoryWidget = Icon(
          Icons.check,
          color: accessoryColor(context, accessoryType: accessoryType, materialStates: materialStates, extraInfo: extraInfo),
        );
        break;

      case AccessoryType.Disclosure:
        accessoryWidget = Icon(
          Icons.arrow_forward_ios_rounded,
          color: accessoryColor(context, accessoryType: accessoryType, materialStates: materialStates, extraInfo: extraInfo),
          size: 14.0,
        );
        break;

      case AccessoryType.Custom:
        if (extraInfo != null) {
          var customAccessoryWidget = extraInfo['CustomAccessory'] as Widget?;
          if (customAccessoryWidget != null) {
            accessoryWidget = customAccessoryWidget;
          }
        }
        break;

      case AccessoryType.None:
      default:
        break;
    }

    return accessoryWidget;
  }

  @override
  Widget wrappedLeadingWidget(BuildContext context, {Key? key, Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo, Widget? child}) {
    child ??= SizedBox.shrink();
    return Center(key: key, child: Container(color: Colors.transparent, alignment: Alignment.center, child: child));
  }

  // Widget Generators
  /// Section Header
  @override
  Widget sectionHeader(BuildContext context, {Key? key, String? header, Map<String, dynamic>? extraInfo}) {
    return Container(
      key: key,
      height: headerHeight(context),
      color: headerBackgroundColor(context),
      child: header == null || header.isEmpty
          ? SizedBox.shrink()
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leadingCellPadding(context, extraInfo: extraInfo),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(header.toUpperCase(), style: headerTextStyle(context), overflow: TextOverflow.ellipsis),
                        SizedBox(width: 1, height: 8),
                      ],
                    ),
                  ),
                ),
                trailingCellPadding(context, extraInfo: extraInfo),
              ],
            ),
    );
  }

  /// Section Footer
  @override
  Widget sectionFooter(BuildContext context, {Key? key, String? footer, Map<String, dynamic>? extraInfo}) {
    if (footer?.isEmpty ?? true) return SizedBox.shrink();

    return Container(
      key: key,
      height: footerHeight(context),
      color: footerBackgroundColor(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingCellPadding(context, extraInfo: extraInfo),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(footer ?? '', style: footerTextStyle(context), overflow: TextOverflow.ellipsis),
            ),
          ),
          trailingCellPadding(context, extraInfo: extraInfo),
        ],
      ),
    );
  }

  /// Section
  @override
  Widget section(BuildContext context, SettingsSection section) {
    return section;
  }

  /// Cells

  /// Settings Cell Topper
  /// - a widget to appear above of the settings cell (keyline or something)
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [cellIndex] the index number of this cell in its section
  /// - [cellCount] the total number of cells in its section
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  @override
  Widget settingsCellTop(BuildContext context, {Key? key, Set<MaterialState>? materialStates, required int cellIndex, required int cellCount, Map<String, dynamic>? extraInfo}) {
    return cellIndex == 0 ? keyline(context, key: key, extraInfo: extraInfo) : SizedBox.shrink();
  }

  /// Settings Cell Bottom
  /// - a widget to appear below of the settings cell (keyline or something)
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [cellIndex] the index number of this cell in its section
  /// - [cellCount] the total number of cells in its section
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  @override
  Widget settingsCellBottom(BuildContext context, {Key? key, Set<MaterialState>? materialStates, required int cellIndex, required int cellCount, Map<String, dynamic>? extraInfo}) {
    return keyline(context, key: key, indent: cellIndex < (cellCount - 1) ? 20 : 0, extraInfo: extraInfo);
  }

  /// Setting Cell
  /// This generates the frame of a settings cell, with the contents supplied by the [child] parameter
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  /// - [child] the rendered contents of the cell, possibly generated via one of the ...Content() methods below
  @override
  Widget settingsCell(BuildContext context, {Key? key, Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo, required Widget child}) {
    return Container(
      key: key,
      color: cellBackgroundColor(context, materialStates: materialStates, extraInfo: extraInfo),
      // height: rowHeight(context, extraInfo: extraInfo),
      child: child,
    );
  }

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
  @override
  Widget detailsContent(BuildContext context, {Key? key, Set<MaterialState>? materialStates, String title = '', String subtitle = '', String value = '', Widget? leadingWidget, AccessoryType accessoryType = AccessoryType.None, Map<String, dynamic>? extraInfo}) {
    var accessoryWidget = this.accessoryWidget(context, accessoryType: accessoryType, materialStates: materialStates, extraInfo: extraInfo);

    return Container(
      key: key,
      color: Colors.transparent,
      height: rowHeight(context, extraInfo: extraInfo),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingCellPadding(context, extraInfo: extraInfo),
          if (leadingWidget != null) wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
          if (leadingWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) Text('$title', style: titleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                  if (subtitle.isNotEmpty) Text('$subtitle', style: subtitleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          if (value.isNotEmpty) horizontalPadding(context, extraInfo: extraInfo),
          if (value.isNotEmpty)
            Flexible(
              flex: 0,
              fit: FlexFit.loose,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text('$value', style: valueTextStyle(context, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
              ),
            ),
          if (accessoryWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          if (accessoryWidget != null) accessoryWidget,
          trailingCellPadding(context, extraInfo: extraInfo),
        ],
      ),
    );
  }

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
  @override
  Widget switchContent(BuildContext context, {Key? key, Set<MaterialState>? materialStates, String title = '', String subtitle = '', bool value = false, Widget? leadingWidget, AccessoryType accessoryType = AccessoryType.None, required Function(bool) onChanged, Map<String, dynamic>? extraInfo}) {
    var accessoryWidget = this.accessoryWidget(context, accessoryType: accessoryType, materialStates: materialStates, extraInfo: extraInfo);

    return Container(
      key: key,
      color: Colors.transparent,
      height: rowHeight(context, extraInfo: extraInfo),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingCellPadding(context, extraInfo: extraInfo),
          if (leadingWidget != null) wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
          if (leadingWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) Text('$title', style: titleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                  if (subtitle.isNotEmpty) Text('$subtitle', style: subtitleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          horizontalPadding(context, extraInfo: extraInfo),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CupertinoSwitch(
                activeColor: switchActiveColor(context, materialStates: materialStates, extraInfo: extraInfo),
                trackColor: switchTrackColor(context, materialStates: materialStates, extraInfo: extraInfo),
                value: value,
                onChanged: onChanged,
              ),
            ),
          ),
          if (accessoryWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          if (accessoryWidget != null) accessoryWidget,
          trailingCellPadding(context, extraInfo: extraInfo),
        ],
      ),
    );
  }

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
  @override
  Widget sliderContent(BuildContext context, {Key? key, Set<MaterialState>? materialStates, String title = '', String subtitle = '', double value = 0.0, Widget? leadingWidget, AccessoryType accessoryType = AccessoryType.None, required Function(double) onChanged, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    var accessoryWidget = this.accessoryWidget(context, accessoryType: accessoryType, materialStates: materialStates, extraInfo: extraInfo);

    return Container(
      key: key,
      color: Colors.transparent,
      height: rowHeight(context, extraInfo: extraInfo),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingCellPadding(context, extraInfo: extraInfo),
          if (leadingWidget != null) wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
          if (leadingWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) Text('$title', style: titleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                  if (subtitle.isNotEmpty) Text('$subtitle', style: subtitleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          horizontalPadding(context, extraInfo: extraInfo),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CupertinoSlider(
                activeColor: sliderActiveColor(context, materialStates: materialStates, extraInfo: extraInfo),
                thumbColor: sliderThumbColor(context, materialStates: materialStates, extraInfo: extraInfo) ?? CupertinoColors.white,
                onChanged: materialStates.isDisabled ? null : onChanged,
                value: value,
              ),
            ),
          ),
          if (accessoryWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          if (accessoryWidget != null) accessoryWidget,
          trailingCellPadding(context, extraInfo: extraInfo),
        ],
      ),
    );
  }

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
  @override
  Widget buttonContent(BuildContext context, {Key? key, Set<MaterialState>? materialStates, ButtonType type = ButtonType.Normal, String title = '', String subtitle = '', Widget? leadingWidget, AccessoryType accessoryType = AccessoryType.None, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    var accessoryWidget = this.accessoryWidget(context, accessoryType: accessoryType, materialStates: materialStates, extraInfo: extraInfo);

    var titleTextStyle = this.titleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo);
    var subtitleTextStyle = this.subtitleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo);
    var textColor = Colors.transparent;
    switch (type) {
      case ButtonType.Normal:
        textColor = primaryColor();
        break;
      case ButtonType.Destructive:
        textColor = Colors.red;
        break;
      case ButtonType.Cancel:
        textColor = Colors.grey;
        break;
      case ButtonType.Custom:
        break;
    }

    if (materialStates.isDisabled) {
      titleTextStyle = titleTextStyle.copyWith(color: textColor.withAlpha(100));
    } else {
      titleTextStyle = titleTextStyle.copyWith(color: textColor);
    }

    return Container(
      key: key,
      color: Colors.transparent,
      height: rowHeight(context, extraInfo: extraInfo),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingCellPadding(context, extraInfo: extraInfo),
          if (leadingWidget != null) wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
          if (leadingWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) Text('$title', style: titleTextStyle, overflow: TextOverflow.ellipsis),
                  if (subtitle.isNotEmpty) Text('$subtitle', style: subtitleTextStyle, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          if (accessoryWidget != null) horizontalPadding(context, extraInfo: extraInfo),
          if (accessoryWidget != null) accessoryWidget,
          trailingCellPadding(context, extraInfo: extraInfo),
        ],
      ),
    );
  }
}
