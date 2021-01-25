//
//  gizmos_settings_screen_example
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

import 'package:flutter/foundation.dart';

enum DogType {
  GoldenRetriever,
  LabradorRetriever,
  GermanShepherd,
  CavalierKingCharlesSpaniel,
  Boxer,
  FrenchBulldog,
  Other,
}

extension DogTypeAdditions on DogType {
  static DogType fromId(String id) {
    var dogTypes = DogType.values;
    for (var index = 0; index < dogTypes.length; ++index) {
      if (dogTypes[index].id == id) return dogTypes[index];
    }
    return DogType.Other;
  }

  String get id {
    return describeEnum(this);
  }

  String get description {
    switch (this) {
      case DogType.GoldenRetriever:
        return 'Golden Retriever';
      case DogType.LabradorRetriever:
        return 'Labrador Retriever';
      case DogType.GermanShepherd:
        return 'German Shepherd';
      case DogType.CavalierKingCharlesSpaniel:
        return 'Cavalier King Charles Spaniel';
      case DogType.Boxer:
        return 'Boxer';
      case DogType.FrenchBulldog:
        return 'French Bulldog';
      case DogType.Other:
        return 'Other';
    }
    return 'Invalid';
  }
}
