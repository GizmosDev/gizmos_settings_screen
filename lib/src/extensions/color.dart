//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

import 'package:flutter/material.dart';

/// Helpful extensions on [Color]
// Based on code here: https://stackoverflow.com/a/50081214/144857
extension HexColor on Color {
  /// Create a [Color] from the supplied [hexString]
  /// - string is in the format "rrggbb" or "aarrggbb" with an optional leading "#"
  static Color fromHex(String hexString) {
    var buffer = StringBuffer();

    hexString = hexString.replaceFirst('#', '');
    if (hexString.length == 6) {
      buffer.write('ff');
    }

    buffer.write(hexString);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Returns the textual representative of the Color as a hex string
  /// [leadingHashSign] - whether or not to prefix a hash symbol (#) (defaults to `true`)
  /// [includeAlpha] - whether or not to include the opacity of the colour (defaults to `true`)
  String toHex({bool leadingHashSign = true, bool includeAlpha = true}) => '${leadingHashSign ? '#' : ''}'
      '${includeAlpha ? (255 * a).round().toRadixString(16).padLeft(2, '0') : ''}'
      '${(255 * r).round().toRadixString(16).padLeft(2, '0')}'
      '${(255 * g).round().toRadixString(16).padLeft(2, '0')}'
      '${(255 * b).round().toRadixString(16).padLeft(2, '0')}';
}
