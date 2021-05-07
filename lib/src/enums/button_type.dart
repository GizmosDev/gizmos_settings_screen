//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library gizmos_settings_screen;

/// ButtonType
/// the type of button so a common UI can be applied, letting the user know what to expect when they press the button
enum ButtonType {
  /// Normal - a normal action
  Normal,

  /// Destructive - will destory something
  Destructive,

  /// Cancel - abort the current thing
  Cancel,

  /// Custom - A custom button, implement this in your custom skin using values included in the extraInfo map
  Custom,
}

/// Helpful extensions on [ButtonType]
extension ButtonTypeAdditions on ButtonType {
  /// Description - textual name of the button type (useful for debugging)
  String get description {
    switch (this) {
      case ButtonType.Normal:
        return 'Normal';
      case ButtonType.Destructive:
        return 'Destructive';
      case ButtonType.Cancel:
        return 'Cancel';
      case ButtonType.Custom:
        return 'Custom';
    }
  }
}
