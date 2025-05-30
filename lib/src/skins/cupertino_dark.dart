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
import '../skins/cupertino.dart';

/// CupertinoDarkSettingsSkin
/// Modeled to closely resemble a plain settings screen on iOS with Dark Mode enabled
class CupertinoDarkSettingsSkin extends CupertinoSettingsSkin {
  // Constructor
  CupertinoDarkSettingsSkin() : super();

  // Customization Methods
  // - Colours
  // - - tints
  @override
  Color primaryColor({Set<WidgetState>? widgetStates}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#0b84fe').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  // - - backgrounds
  @override
  Color appHeaderBackgroundColor(BuildContext context) {
    return HexColor.fromHex('#121312');
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
      return HexColor.fromHex('#3a3a3c');
    } else if (widgetStates.isHovering || widgetStates.isFocused) {
      return primaryColor().withAlpha(50);
    } else if (widgetStates.isSelected) {
      return primaryColor().withAlpha(100);
    } else if (widgetStates.isDisabled) {
      return Colors.grey[900] ?? Colors.grey;
    } else {
      // isNormal
      return HexColor.fromHex('#1c1c1e');
    }
  }

  // - - text colours
  @override
  Color appHeaderTextColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Color headerTextColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return HexColor.fromHex('#86868b');
  }

  @override
  Color footerTextColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return headerTextColor(context);
  }

  @override
  Color titleTextColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};

    if (widgetStates.isPressed) {
      return Colors.white;
    } else if (widgetStates.isHovering || widgetStates.isFocused) {
      return Colors.white.withAlpha(100);
    } else if (widgetStates.isSelected) {
      return Colors.white.withAlpha(200);
    } else if (widgetStates.isDisabled) {
      return Colors.white;
    } else {
      // isNormal
      return Colors.white;
    }
  }

  @override
  Color subtitleTextColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return titleTextColor(context, widgetStates: widgetStates, extraInfo: extraInfo);
  }

  @override
  Color valueTextColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return widgetStates.isPressed ? HexColor.fromHex('#6e6e72') : HexColor.fromHex('#5a5a5f');
  }

  // - - Switch
  @override
  Color? switchActiveColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#ffffff').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchActiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#35c759').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchInactiveThumbColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#ffffff').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  @override
  Color? switchInactiveTrackColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};
    return HexColor.fromHex('#333333').withAlpha(widgetStates.isDisabled ? 100 : 255);
  }

  // - - Slider
  @override
  Color? sliderActiveColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return primaryColor(widgetStates: widgetStates);
  }

  @override
  Color? sliderThumbColor(BuildContext context, {Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    return Colors.white;
  }

  // - - misc
  @override
  Color keylineColor(BuildContext context, {Map<String, dynamic>? extraInfo}) {
    return showKeylines(context) ? HexColor.fromHex('#28282a') : Colors.transparent;
  }

  @override
  Color accessoryColor(BuildContext context, {AccessoryType accessoryType = AccessoryType.None, Set<WidgetState>? widgetStates, Map<String, dynamic>? extraInfo}) {
    widgetStates ??= <WidgetState>{};

    switch (accessoryType) {
      case AccessoryType.Check:
        return primaryColor(widgetStates: widgetStates);

      case AccessoryType.Disclosure:
        return widgetStates.isPressed ? HexColor.fromHex('#6e6e72') : HexColor.fromHex('#5a5a5f');

      case AccessoryType.Custom:
        return primaryColor(widgetStates: widgetStates);

      case AccessoryType.None:
        return Colors.transparent;
    }
  }
}
