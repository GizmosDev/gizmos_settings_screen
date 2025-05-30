//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

import 'package:flutter/material.dart';

import '../enums/accessory_type.dart';
import '../extensions/color.dart';
import '../extensions/material_state.dart';
import '../skins/material.dart';

/// MaterialSettingsSkin
/// Modeled to closely resemble a plain settings screen on Android with Dark Mode enabled
class MaterialDarkSettingsSkin extends MaterialSettingsSkin {
  // Constructor
  MaterialDarkSettingsSkin() : super();

  // Customization Methods
  // - Colours
  // - - tints
  @override
  Color primaryColor({Set<WidgetState>? widgetStates}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#0075f0').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  // - - backgrounds
  @override
  Color appHeaderBackgroundColor(BuildContext context) {
    return Colors.black;
  }

  @override
  Color appBackgroundColor(BuildContext context) {
    return Colors.black;
  }

  @override
  Color listBackgroundColor(BuildContext context) {
    return Colors.black;
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
  Color cellBackgroundColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};

    if (widgetStates.isPressed) {
      return HexColor.fromHex('#1a1a1a');
    } else if (widgetStates.isHovering || widgetStates.isFocused) {
      return primaryColor().withAlpha(50);
    } else if (widgetStates.isSelected) {
      return primaryColor().withAlpha(100);
    } else if (widgetStates.isDisabled) {
      return Colors.grey[900] ?? Colors.grey;
    } else {
      // isNormal
      return Colors.black;
    }
  }

  // - - text colours
  @override
  Color appHeaderTextColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Color headerTextColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return Colors.white;
  }

  @override
  Color footerTextColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return headerTextColor(context);
  }

  @override
  Color titleTextColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};

    if (widgetStates.isPressed) {
      return Colors.grey[500] ?? Colors.grey;
    } else if (widgetStates.isHovering || widgetStates.isFocused) {
      return (Colors.grey[900] ?? Colors.grey).withAlpha(100);
    } else if (widgetStates.isSelected) {
      return (Colors.grey[900] ?? Colors.grey).withAlpha(200);
    } else if (widgetStates.isDisabled) {
      return Colors.grey;
    } else {
      // isNormal
      return Colors.white;
    }
  }

  @override
  Color subtitleTextColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};

    if (widgetStates.isPressed) {
      return Colors.white;
    } else if (widgetStates.isHovering || widgetStates.isFocused) {
      return Colors.white.withAlpha(100);
    } else if (widgetStates.isSelected) {
      return (Colors.grey[900] ?? Colors.grey).withAlpha(200);
    } else if (widgetStates.isDisabled) {
      return Colors.grey;
    } else {
      // isNormal
      return HexColor.fromHex('#7a7a7a');
    }
  }

  @override
  Color valueTextColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#929295');
  }

  // - - Switch
  @override
  Color? switchActiveColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#7bb1f9').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchActiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#27364d').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchInactiveThumbColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('b9b9b9').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchInactiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#4d4d4d').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchFocusColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return switchActiveColor(context, widgetStates: widgetStates, extraInfo: extraInfo)?.withAlpha(50);
  }

  @override
  Color? switchHoverColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return switchActiveColor(context, widgetStates: widgetStates, extraInfo: extraInfo)?.withAlpha(50);
  }

  // - - Slider
  @override
  Color? sliderActiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#7bb1f9');
  }

  @override
  Color? sliderInactiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#4d4d4d');
  }

  @override
  Color? sliderDisabledActiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledActiveTrackColor;
  }

  @override
  Color? sliderDisabledInactiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledInactiveTrackColor;
  }

  @override
  Color? sliderActiveTickMarkColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.activeTickMarkColor;
  }

  @override
  Color? sliderInactiveTickMarkColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.inactiveTickMarkColor;
  }

  @override
  Color? sliderDisabledActiveTickMarkColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledActiveTickMarkColor;
  }

  @override
  Color? sliderDisabledInactiveTickMarkColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.disabledInactiveTickMarkColor;
  }

  @override
  Color? sliderThumbColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#7bb1f9');
  }

  @override
  Color? sliderOverlappingShapeStrokeColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.overlappingShapeStrokeColor;
  }

  @override
  Color? sliderDisabledThumbColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#4d4d4d');
  }

  @override
  Color? sliderOverlayColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.overlayColor;
  }

  @override
  Color? sliderValueIndicatorColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    var slideThemeData = SliderTheme.of(context);
    return slideThemeData.valueIndicatorColor;
  }

  // - - misc
  @override
  Color keylineColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return showKeylines(context) ? HexColor.fromHex('#e2e2e5') : Colors.transparent;
  }

  @override
  Color accessoryColor(BuildContext context, {AccessoryType accessoryType = AccessoryType.None, Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};

    switch (accessoryType) {
      case AccessoryType.Check:
        return primaryColor(widgetStates: widgetStates);

      case AccessoryType.Disclosure:
        return widgetStates.isPressed ? HexColor.fromHex('#a4a4aa') : HexColor.fromHex('#c4c4c7');

      case AccessoryType.Custom:
        return primaryColor(widgetStates: widgetStates);

      case AccessoryType.None:
        return Colors.transparent;
    }
  }
}
