//
//  gizmos_settings_screen_example
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

enum DogType {
  goldenRetriever,
  labradorRetriever,
  germanShepherd,
  cavalierKingCharlesSpaniel,
  boxer,
  frenchBulldog,
  other,
}

extension DogTypeAdditions on DogType {
  static DogType fromId(String? id) {
    var dogTypes = DogType.values;
    for (var index = 0; index < dogTypes.length; ++index) {
      if (dogTypes[index].id == id) return dogTypes[index];
    }
    return DogType.other;
  }

  String get id {
    return name;
  }

  String get description {
    switch (this) {
      case DogType.goldenRetriever:
        return 'Golden Retriever';
      case DogType.labradorRetriever:
        return 'Labrador Retriever';
      case DogType.germanShepherd:
        return 'German Shepherd';
      case DogType.cavalierKingCharlesSpaniel:
        return 'Cavalier King Charles Spaniel';
      case DogType.boxer:
        return 'Boxer';
      case DogType.frenchBulldog:
        return 'French Bulldog';
      case DogType.other:
        return 'Other';
    }
  }
}
