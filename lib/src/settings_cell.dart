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

import './extensions/material_state.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// The abstract SettingsCell class that forms the basis for the other specific ...SettingsCell classes
/// This class handles maintaining the MaterialStates of the subclasses and allows for a consistent overall design
/// for each of those subclasses. The state object's build() method will call the subclasses buildContents() method,
/// allowing those subclasses to provide customized internal contents of their cells with consistent interfaces (for both
/// the developer and the user)
abstract class SettingsCell extends StatefulWidget {
  // Fields
  final VoidCallback onPressed;
  final Map<String, dynamic> extraInfo;
  final Set<MaterialState> initialStates;

  // Properties
  /// Whether or not this cell has an [onPressed] callback
  bool get hasAction => onPressed != null;

  // Constructor
  /// SettingsCell
  /// - [initialStates] any initial material states that should be applied to this cell (disabled/selected etc)
  /// - [onPressed] a callback that will be executed when the cell is pressed
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  SettingsCell({Key key, this.initialStates, this.onPressed, this.extraInfo}) : super(key: key);

  @override
  SettingsCellState createState() => SettingsCellState(initialStates: initialStates);

  /// buildContents() is called by the parent's state build() method
  /// - treat this like the build() call of a normal [StatelessWidget], but with the additional [materialStates] object that can be used for customization
  Widget buildContents(BuildContext context, {Set<MaterialState> materialStates});
}

class SettingsCellState<T extends SettingsCell> extends State<T> {
  // Note:
  // The control state (pressed/selected/disabled etc) was originally based on code in the ButtonStyleButton class
  // I started to deviate from their implementation though since I don't believe a control without an onPressed
  // handler should be considered 'disabled' as it may be informational only. Being informational only, a control
  // shouldn't be drawn differently (dimmed etc). A control should only be drawn differently when disabled if it
  // can at times actually do something differently.

  // Fields
  final Set<MaterialState> _materialStates;

  // Properties
  @override
  T get widget => super.widget;

  /// Whether or not the widget's [MaterialState]'s include the [isPressed] state
  bool get isPressed => _materialStates.isPressed;

  /// Whether or not the widget's [MaterialState]'s include the [isHovering] state
  bool get isHovering => _materialStates.isHovering;

  /// Whether or not the widget's [MaterialState]'s include the [isFocused] state
  bool get isFocused => _materialStates.isFocused;

  /// Whether or not the widget's [MaterialState]'s include the [isSelected] state
  bool get isSelected => _materialStates.isSelected;

  /// Whether or not the widget's [MaterialState]'s include the [isDisabled] state
  bool get isDisabled => _materialStates.isDisabled;

  // Constructor
  SettingsCellState({Set<MaterialState> initialStates})
      : _materialStates = initialStates ?? <MaterialState>{},
        super();

  @override
  void initState() {
    super.initState();
    // See note re: ButtonStyleButton
    // _updateState(MaterialState.disabled, !widget.hasAction);
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    // See note re: ButtonStyleButton
    //_updateState(MaterialState.disabled, !widget.hasAction);

    // If the button is disabled while a press gesture is currently ongoing,
    // InkWell makes a call to handleHighlightChanged. This causes an exception
    // because it calls setState in the middle of a build. To preempt this, we
    // manually update pressed to false when this situation occurs.
    if (!widget.hasAction && isPressed) {
      _handleHighlightChanged(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (isDisabled || !widget.hasAction) return;
          widget.onPressed();
        },
        onTapDown: (tapDownDetails) {
          if (isDisabled || !widget.hasAction) return;
          _handleHighlightChanged(true);
        },
        onTapUp: (tapUpDetails) {
          if (isDisabled || !widget.hasAction) return;
          _handleHighlightChanged(false);
        },
        onTapCancel: () {
          if (isDisabled || !widget.hasAction) return;
          _handleHighlightChanged(false);
        },
        child: skinDelegate.settingsCell(context, materialStates: _materialStates, extraInfo: widget.extraInfo, child: widget.buildContents(context, materialStates: _materialStates)),
      ),
    );
  }

  // Material State Methods (not to be confused with widget state)
  void _updateState(MaterialState state, bool value) {
    value ? _materialStates.add(state) : _materialStates.remove(state);
  }

  void _handleHighlightChanged(bool value) {
    if (isPressed != value) {
      setState(() {
        _updateState(MaterialState.pressed, value);
      });
    }
  }

  // // Not used right now, since I'm using a GestureDetector instead of an InkWell
  // void _handleHoveredChanged(bool value) {
  //   if (isHovering != value) {
  //     setState(() {
  //       _updateState(MaterialState.hovered, value);
  //     });
  //   }
  // }

  // // Not used right now, since I'm using a GestureDetector instead of an InkWell
  // void _handleFocusedChanged(bool value) {
  //   if (isFocused != value) {
  //     setState(() {
  //       _updateState(MaterialState.focused, value);
  //     });
  //   }
  // }

  // // Not used right now, since I'm using a GestureDetector instead of an InkWell
  // void _handleSelectedChanged(bool value) {
  //   if (isSelected != value) {
  //     setState(() {
  //       _updateState(MaterialState.selected, value);
  //     });
  //   }
  // }
}
