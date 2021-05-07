//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library gizmos_settings_screen;

/// AccessoryType
/// an image/icon or custom widget that applies a common meaning to the cell (disclosure -> more info, check -> selected option etc)
enum AccessoryType {
  /// None - No accessory
  None,

  /// Disclosure - A disclosure arrow
  Disclosure,

  /// Check - A checkmark
  Check,

  /// Custom - A custom accessory, implement this in your custom skin using values included in the extraInfo map
  Custom,
}

/// Helpful extensions on [AccessoryType]
extension AccessoryTypeAdditions on AccessoryType {
  /// Description - textual name of the accessory type (useful for debugging)
  String get description {
    switch (this) {
      case AccessoryType.None:
        return 'None';
      case AccessoryType.Disclosure:
        return 'Disclosure';
      case AccessoryType.Check:
        return 'Check';
      case AccessoryType.Custom:
        return 'Custom';
    }
  }
}
