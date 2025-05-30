//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

import 'package:flutter/material.dart';

/// Helpful extentions on [Set<WidgetState>]
extension WidgetStateSetAdditions on Set<WidgetState> {
  /// Whether or not the set of [WidgetState]'s includes [WidgetState.pressed]
  bool get isPressed => contains(WidgetState.pressed);

  /// Whether or not the set of [WidgetState]'s includes [WidgetState.hovered]
  bool get isHovering => contains(WidgetState.hovered);

  /// Whether or not the set of [WidgetState]'s includes [WidgetState.focused]
  bool get isFocused => contains(WidgetState.focused);

  /// Whether or not the set of [WidgetState]'s includes [WidgetState.selected]
  bool get isSelected => contains(WidgetState.selected);

  /// Whether or not the set of [WidgetState]'s includes [WidgetState.disabled]
  bool get isDisabled => contains(WidgetState.disabled);

  /// Add [WidgetState.pressed] to the set
  Set<WidgetState> pressed() {
    add(WidgetState.pressed);
    return this;
  }

  /// Add [WidgetState.pressed] to the set
  Set<WidgetState> highlighted() => pressed();

  /// Add [WidgetState.selected] to the set
  Set<WidgetState> selected() {
    add(WidgetState.selected);
    return this;
  }

  /// Add [WidgetState.disabled] to the set
  Set<WidgetState> disabled() {
    add(WidgetState.disabled);
    return this;
  }

  /// Add [WidgetState.hovered] to the set
  Set<WidgetState> hovered() {
    add(WidgetState.hovered);
    return this;
  }

  /// Add [WidgetState.focused] to the set
  Set<WidgetState> focused() {
    add(WidgetState.focused);
    return this;
  }
}
