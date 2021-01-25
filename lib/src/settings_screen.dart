//
//  gizmos_settings_screen
//
//  Copyright (c) 2021, Dave Wood.
//  All rights reserved.
//  Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
//

library gizmos_settings_screen;

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './settings_section.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// The SettingsScreen manages all of the sections added to this screen
class SettingsScreen extends StatelessWidget {
  // Constants

  // Fields
  final List<SettingsSection> sections;
  final bool shrinkWrap;
  final ScrollPhysics physics;

  // Constructor
  /// The SettingsScreen manages all of the sections added to this screen
  /// - [shrinkWrap] passed through to [ListView] used to render this widget
  /// - [physics] passed through to [ListView] used to render this widget
  /// - [sections] list of [SettingsSection]'s that compose this screen
  SettingsScreen({Key key, this.shrinkWrap = false, this.physics, @required this.sections}) : super(key: key);

  // Build
  @override
  Widget build(BuildContext context) {
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();

    return Container(
      color: skinDelegate.listBackgroundColor(context),
      child: ListView.builder(
          itemCount: sections.length,
          shrinkWrap: shrinkWrap,
          physics: physics ?? skinDelegate.defaultScrollPhysics(context),
          itemBuilder: (BuildContext context, int index) {
            return skinDelegate.section(context, sections[index]);
          }),
    );
  }
}
