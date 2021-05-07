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

import '../enums/button_type.dart';
import '../enums/accessory_type.dart';
import '../extensions/color.dart';
import '../extensions/material_state.dart';
import '../settings_section.dart';
import '../skins/default.dart';

/// MaterialSettingsSkin
/// Modeled to closely resemble a plain settings screen on Android
class MaterialSettingsSkin extends DefaultSkin {
  // Constructor
  MaterialSettingsSkin() : super();

  // Customization Methods
  // - Colours
  // - - tints
  @override
  Color primaryColor({Set<MaterialState>? materialStates}) {
    materialStates ??= <MaterialState>{};
    return HexColor.fromHex('#0075f0').withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  // - - backgrounds
  @override
  Color appHeaderBackgroundColor(BuildContext context) {
    return Colors.blue;
  }

  @override
  Color appBackgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Color listBackgroundColor(BuildContext context) {
    return Colors.white;
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
    return Colors.white;
  }

  @override
  Color headerTextColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return Colors.black;
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
      return HexColor.fromHex('#2d2d2d');
    }
  }

  @override
  Color subtitleTextColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
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
      return HexColor.fromHex('#7a7a7a');
    }
  }

  @override
  Color valueTextColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#929295');
  }

  // - - Switch
  @override
  Color? switchActiveColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    return HexColor.fromHex('#1871e3').withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchActiveTrackColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    return HexColor.fromHex('#c4dbf9').withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchInactiveThumbColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    return HexColor.fromHex('#ececec').withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchInactiveTrackColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    materialStates ??= <MaterialState>{};
    return HexColor.fromHex('#bdbdbd').withAlpha(materialStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchFocusColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return switchActiveColor(context, materialStates: materialStates, extraInfo: extraInfo)?.withAlpha(50);
  }

  @override
  Color? switchHoverColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return switchActiveColor(context, materialStates: materialStates, extraInfo: extraInfo)?.withAlpha(50);
  }

  // - - Slider
  @override
  Color? sliderActiveTrackColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    // var slideThemeData = SliderTheme.of(context);
    // return slideThemeData.activeTrackColor;
    return primaryColor(materialStates: materialStates);
  }

  @override
  Color? sliderInactiveTrackColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    // var slideThemeData = SliderTheme.of(context);
    // return slideThemeData.inactiveTrackColor;
    return HexColor.fromHex('#c7ddfa');
  }

  @override
  Color? sliderDisabledActiveTrackColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledActiveTrackColor;
  }

  @override
  Color? sliderDisabledInactiveTrackColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledInactiveTrackColor;
  }

  @override
  Color? sliderActiveTickMarkColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.activeTickMarkColor;
  }

  @override
  Color? sliderInactiveTickMarkColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.inactiveTickMarkColor;
  }

  @override
  Color? sliderDisabledActiveTickMarkColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledActiveTickMarkColor;
  }

  @override
  Color? sliderDisabledInactiveTickMarkColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledInactiveTickMarkColor;
  }

  @override
  Color? sliderThumbColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.thumbColor;
  }

  @override
  Color? sliderOverlappingShapeStrokeColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.overlappingShapeStrokeColor;
  }

  @override
  Color? sliderDisabledThumbColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledThumbColor;
  }

  @override
  Color? sliderOverlayColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.overlayColor;
  }

  @override
  Color? sliderValueIndicatorColor(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.valueIndicatorColor;
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

  // Slider
  @override
  SliderComponentShape sliderOverlayShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    // var slideThemeData = SliderTheme.of(context);
    // return slideThemeData.overlayShape;
    return RoundSliderOverlayShape(overlayRadius: 0.0);
  }

  @override
  SliderTickMarkShape? sliderTickMarkShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.tickMarkShape;
  }

  @override
  SliderComponentShape? sliderThumbShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.thumbShape;
  }

  @override
  SliderTrackShape? sliderTrackShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.trackShape;
  }

  @override
  SliderComponentShape? sliderValueIndicatorShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.valueIndicatorShape;
  }

  @override
  RangeSliderTickMarkShape? sliderRangeTickMarkShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.rangeTickMarkShape;
  }

  @override
  RangeSliderThumbShape? sliderRangeThumbShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.rangeThumbShape;
  }

  @override
  RangeSliderTrackShape? sliderRangeTrackShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.rangeTrackShape;
  }

  @override
  RangeSliderValueIndicatorShape? sliderRangeValueIndicatorShape(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.rangeValueIndicatorShape;
  }

  @override
  ShowValueIndicator? sliderShowValueIndicator(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.showValueIndicator;
  }

  @override
  TextStyle? sliderValueIndicatorTextStyle(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.valueIndicatorTextStyle;
  }

  @override
  double? sliderMinThumbSeparation(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.minThumbSeparation;
  }

  @override
  RangeThumbSelector? sliderThumbSelector(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.thumbSelector;
  }

  // Text Styles
  // - app header
  @override
  TextStyle appHeaderTextStyle(BuildContext context) {
    return TextStyle(color: appHeaderTextColor(context), fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w500);
  }

  // - header
  @override
  TextStyle headerTextStyle(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: headerTextColor(context, extraInfo: extraInfo), fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w400);
  }

  // - footer
  @override
  TextStyle footerTextStyle(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: footerTextColor(context, extraInfo: extraInfo), fontFamily: 'Roboto', fontSize: 13, fontWeight: FontWeight.w400);
  }

  // - title
  @override
  TextStyle titleTextStyle(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: titleTextColor(context, materialStates: materialStates, extraInfo: extraInfo), fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w400);
  }

  @override
  TextStyle subtitleTextStyle(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: subtitleTextColor(context, materialStates: materialStates, extraInfo: extraInfo), fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w500);
  }

  // - value
  @override
  TextStyle valueTextStyle(BuildContext context, {Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo}) {
    return TextStyle(color: valueTextColor(context, materialStates: materialStates, extraInfo: extraInfo), fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w300);
  }

  // Dimensions
  @override
  double leadingIndent(BuildContext context) {
    return 40.0;
  }

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
    return 80.0;
  }

  @override
  double sliderTrackHeight(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return 1.0;
  }

  @override
  double keylineThickness(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return 1.0;
  }

  // Options
  @override
  bool showKeylines(BuildContext context) {
    return true;
  }

  @override
  ScrollPhysics defaultScrollPhysics(BuildContext context) {
    return AlwaysScrollableScrollPhysics();
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
    child ??= SizedBox(width: leadingIndent(context), height: leadingIndent(context));
    return Center(key: key, child: Container(color: Colors.transparent, width: leadingIndent(context), height: leadingIndent(context), alignment: Alignment.center, child: child));
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
                wrappedLeadingWidget(context, child: SizedBox.shrink()),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(header, style: headerTextStyle(context), overflow: TextOverflow.ellipsis),
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
    return SizedBox.shrink(key: key);
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
    return (cellIndex < (cellCount - 1)) ? SizedBox.shrink(key: key) : keyline(context, key: key, extraInfo: extraInfo);
  }

  /// Setting Cell
  /// This generates the frame of a settings cell, with the contents supplied by the [child] parameter
  /// - [context] the current BuildContext
  /// - [materialStates] a set of the current states this cell is in (pressed, selected, disabled, etc)
  /// - [accessoryType] can indicate if a disclosure arrow, checkmark, or other symbol should be on the trailing side of cell
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  /// - [child] the rendered contents of the cell, possibly generated via one of the ...Content() methods below
  @override
  Widget settingsCell(BuildContext context, {Key? key, Set<MaterialState>? materialStates, Map<String, dynamic>? extraInfo, required Widget child}) {
    return Container(
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

    var parts = <String>[];
    if (value.isNotEmpty) {
      parts.add(value);
    }
    if (subtitle.isNotEmpty) {
      parts.add(subtitle);
    }
    var combinedValueAndSubtitle = parts.join('/');

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
          wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) Text('$title', style: titleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                  if (title.isNotEmpty && combinedValueAndSubtitle.isNotEmpty) verticalPadding(context, extraInfo: extraInfo),
                  if (combinedValueAndSubtitle.isNotEmpty) Text('$combinedValueAndSubtitle', style: subtitleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
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
          wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) Text('$title', style: titleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                  if (title.isNotEmpty && subtitle.isNotEmpty) verticalPadding(context, extraInfo: extraInfo),
                  if (subtitle.isNotEmpty) Text('$subtitle', style: subtitleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          horizontalPadding(context, extraInfo: extraInfo),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Switch(
                activeColor: switchActiveColor(context, materialStates: materialStates, extraInfo: extraInfo),
                inactiveThumbColor: switchInactiveThumbColor(context, materialStates: materialStates, extraInfo: extraInfo),
                activeTrackColor: switchActiveTrackColor(context, materialStates: materialStates, extraInfo: extraInfo),
                inactiveTrackColor: switchInactiveTrackColor(context, materialStates: materialStates, extraInfo: extraInfo),
                focusColor: switchFocusColor(context, materialStates: materialStates, extraInfo: extraInfo),
                hoverColor: switchHoverColor(context, materialStates: materialStates, extraInfo: extraInfo),
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
          wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title.isNotEmpty) Text('$title', style: titleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                  if (title.isNotEmpty && subtitle.isNotEmpty) verticalPadding(context, extraInfo: extraInfo),
                  if (subtitle.isNotEmpty) Text('$subtitle', style: subtitleTextStyle(context, materialStates: materialStates, extraInfo: extraInfo), overflow: TextOverflow.ellipsis),
                  verticalPadding(context, extraInfo: extraInfo),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: sliderTrackHeight(context, extraInfo: extraInfo),
                      activeTrackColor: sliderActiveTrackColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      inactiveTrackColor: sliderInactiveTrackColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      disabledActiveTrackColor: sliderDisabledActiveTrackColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      disabledInactiveTrackColor: sliderDisabledInactiveTrackColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      activeTickMarkColor: sliderActiveTickMarkColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      inactiveTickMarkColor: sliderInactiveTickMarkColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      disabledActiveTickMarkColor: sliderDisabledActiveTickMarkColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      disabledInactiveTickMarkColor: sliderDisabledInactiveTickMarkColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      thumbColor: sliderThumbColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      overlappingShapeStrokeColor: sliderOverlappingShapeStrokeColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      disabledThumbColor: sliderDisabledThumbColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      overlayColor: sliderOverlayColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      valueIndicatorColor: sliderValueIndicatorColor(context, materialStates: materialStates, extraInfo: extraInfo),
                      overlayShape: sliderOverlayShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      tickMarkShape: sliderTickMarkShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      thumbShape: sliderThumbShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      trackShape: sliderTrackShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      valueIndicatorShape: sliderValueIndicatorShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      rangeTickMarkShape: sliderRangeTickMarkShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      rangeThumbShape: sliderRangeThumbShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      rangeTrackShape: sliderRangeTrackShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      rangeValueIndicatorShape: sliderRangeValueIndicatorShape(context, materialStates: materialStates, extraInfo: extraInfo),
                      showValueIndicator: sliderShowValueIndicator(context, materialStates: materialStates, extraInfo: extraInfo),
                      valueIndicatorTextStyle: sliderValueIndicatorTextStyle(context, materialStates: materialStates, extraInfo: extraInfo),
                      minThumbSeparation: sliderMinThumbSeparation(context, materialStates: materialStates, extraInfo: extraInfo),
                      thumbSelector: sliderThumbSelector(context, materialStates: materialStates, extraInfo: extraInfo),
                    ),
                    child: Slider(
                      value: value,
                      onChanged: materialStates.isDisabled ? null : onChanged,
                    ),
                  ),
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
          wrappedLeadingWidget(context, extraInfo: extraInfo, child: leadingWidget),
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
