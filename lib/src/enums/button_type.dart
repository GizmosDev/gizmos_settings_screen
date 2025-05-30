//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

/// ButtonType
/// the type of button so a common UI can be applied, letting the user know what to expect when they press the button
enum ButtonType {
  /// normal - a normal action
  normal,

  /// destructive - will destory something
  destructive,

  /// cancel - abort the current thing
  cancel,

  /// custom - A custom button, implement this in your custom skin using values included in the extraInfo map
  custom,
}

/// Helpful extensions on [ButtonType]
extension ButtonTypeAdditions on ButtonType {
  /// Description - textual name of the button type (useful for debugging)
  String get description {
    switch (this) {
      case ButtonType.normal:
        return 'Normal';
      case ButtonType.destructive:
        return 'Destructive';
      case ButtonType.cancel:
        return 'Cancel';
      case ButtonType.custom:
        return 'Custom';
    }
  }
}
