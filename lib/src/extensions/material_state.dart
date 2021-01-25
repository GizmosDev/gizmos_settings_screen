//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library gizmos_settings_screen;

import 'package:flutter/material.dart';

/// Helpful extentions on [Set<MaterialState>]
extension MaterialStateSetAdditions on Set<MaterialState> {
  /// Whether or not the set of [MaterialState]'s includes [MaterialState.pressed]
  bool get isPressed => contains(MaterialState.pressed);

  /// Whether or not the set of [MaterialState]'s includes [MaterialState.hovered]
  bool get isHovering => contains(MaterialState.hovered);

  /// Whether or not the set of [MaterialState]'s includes [MaterialState.focused]
  bool get isFocused => contains(MaterialState.focused);

  /// Whether or not the set of [MaterialState]'s includes [MaterialState.selected]
  bool get isSelected => contains(MaterialState.selected);

  /// Whether or not the set of [MaterialState]'s includes [MaterialState.disabled]
  bool get isDisabled => contains(MaterialState.disabled);

  /// Add [MaterialState.pressed] to the set
  Set<MaterialState> pressed() {
    add(MaterialState.pressed);
    return this;
  }

  /// Add [MaterialState.pressed] to the set
  Set<MaterialState> highlighted() => pressed();

  /// Add [MaterialState.selected] to the set
  Set<MaterialState> selected() {
    add(MaterialState.selected);
    return this;
  }

  /// Add [MaterialState.disabled] to the set
  Set<MaterialState> disabled() {
    add(MaterialState.disabled);
    return this;
  }

  /// Add [MaterialState.hovered] to the set
  Set<MaterialState> hovered() {
    add(MaterialState.hovered);
    return this;
  }

  /// Add [MaterialState.focused] to the set
  Set<MaterialState> focused() {
    add(MaterialState.focused);
    return this;
  }
}
