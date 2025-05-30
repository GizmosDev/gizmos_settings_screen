//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './settings_cell.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// The SettingsSection manages the header, footer and all cells for a particular section
/// It handles adding any required widgets around each of the elements and renders them appropriately
class SettingsSection extends StatelessWidget {
  // Fields
  final String? header;
  final Map<String, dynamic>? headerInfo;
  final String? footer;
  final Map<String, dynamic>? footerInfo;
  final List<SettingsCell> cells;

  // Constructor
  /// The SettingsSection manages the header, footer and all cells for a particular section
  /// It handles adding any required widgets around each of the elements and renders them appropriately
  /// - [header] title of this section to appear in the header
  /// - [headerInfo] [extraInfo] for the header where you can pass additional info through to your subclasses to be used however you need
  /// - [footer] text to appear in the footer of this section
  /// - [footerInfo] [extraInfo] for the footer where you can pass additional info through to your subclasses to be used however you need
  /// - [cells] list of [SettingsCell] subclasses that will make up this section
  SettingsSection({Key? key, this.header, this.headerInfo, this.footer, this.footerInfo, required this.cells}) : super(key: key);

  // Build
  @override
  Widget build(BuildContext context) {
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();
    var children = <Widget>[];

    children.add(skinDelegate.sectionHeader(context, header: header, extraInfo: headerInfo));

    for (var index = 0; index < cells.length; ++index) {
      children.add(skinDelegate.settingsCellTop(context, cellIndex: index, cellCount: cells.length, extraInfo: cells[index].extraInfo));
      children.add(cells[index]);
      children.add(skinDelegate.settingsCellBottom(context, cellIndex: index, cellCount: cells.length, extraInfo: cells[index].extraInfo));
    }

    children.add(skinDelegate.sectionFooter(context, footer: footer, extraInfo: footerInfo));

    return IntrinsicHeight(
      child: Container(
        color: skinDelegate.cellBackgroundColor(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
