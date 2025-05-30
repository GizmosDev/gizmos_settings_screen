//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

/// AccessoryType
/// an image/icon or custom widget that applies a common meaning to the cell (disclosure -> more info, check -> selected option etc)
enum AccessoryType {
  /// none - No accessory
  none,

  /// disclosure - A disclosure arrow
  disclosure,

  /// check - A checkmark
  check,

  /// custom - A custom accessory, implement this in your custom skin using values included in the extraInfo map
  custom,
}

/// Helpful extensions on [AccessoryType]
extension AccessoryTypeAdditions on AccessoryType {
  /// Description - textual name of the accessory type (useful for debugging)
  String get description {
    switch (this) {
      case AccessoryType.none:
        return 'None';
      case AccessoryType.disclosure:
        return 'Disclosure';
      case AccessoryType.check:
        return 'Check';
      case AccessoryType.custom:
        return 'Custom';
    }
  }
}
