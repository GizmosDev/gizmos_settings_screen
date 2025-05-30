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

import './extensions/material_state.dart';
import './settings_skin.dart';
import './skins/default.dart';

/// The abstract SettingsCell class that forms the basis for the other specific ...SettingsCell classes
/// This class handles maintaining the WidgetStates of the subclasses and allows for a consistent overall design
/// for each of those subclasses. The state object's build() method will call the subclasses buildContents() method,
/// allowing those subclasses to provide customized internal contents of their cells with consistent interfaces (for both
/// the developer and the user)
abstract class SettingsCell extends StatefulWidget {
  // Fields
  final VoidCallback? onPressed;
  final Map<String, dynamic>? extraInfo;
  final Set<WidgetState> initialStates;

  // Properties
  /// Whether or not this cell has an [onPressed] callback
  bool get hasAction => onPressed != null;

  // Constructor
  /// SettingsCell
  /// - [initialStates] any initial material states that should be applied to this cell (disabled/selected etc)
  /// - [onPressed] a callback that will be executed when the cell is pressed
  /// - [extraInfo] a map where you can pass additional info through to your subclasses to be used however you need
  SettingsCell({Key? key, Set<WidgetState>? initialStates, this.onPressed, this.extraInfo})
      : initialStates = initialStates ?? <WidgetState>{},
        super(key: key);

  @override
  SettingsCellState createState() {
    return SettingsCellState(initialStates: initialStates);
  }

  /// buildContents() is called by the parent's state build() method
  /// - treat this like the build() call of a normal [StatelessWidget], but with the additional [widgetStates] object that can be used for customization
  Widget buildContents(BuildContext context, {Set<WidgetState> widgetStates});
}

class SettingsCellState<T extends SettingsCell> extends State<T> {
  // Note:
  // The control state (pressed/selected/disabled etc) was originally based on code in the ButtonStyleButton class
  // I started to deviate from their implementation though since I don't believe a control without an onPressed
  // handler should be considered 'disabled' as it may be informational only. Being informational only, a control
  // shouldn't be drawn differently (dimmed etc). A control should only be drawn differently when disabled if it
  // can at times actually do something differently.

  // Fields
  final Set<WidgetState> _widgetStates;

  // Properties
  @override
  T get widget => super.widget;

  /// Whether or not the widget's [WidgetState]'s include the [isPressed] state
  bool get isPressed => _widgetStates.isPressed;

  /// Whether or not the widget's [WidgetState]'s include the [isHovering] state
  bool get isHovering => _widgetStates.isHovering;

  /// Whether or not the widget's [WidgetState]'s include the [isFocused] state
  bool get isFocused => _widgetStates.isFocused;

  /// Whether or not the widget's [WidgetState]'s include the [isSelected] state
  bool get isSelected => _widgetStates.isSelected;

  /// Whether or not the widget's [WidgetState]'s include the [isDisabled] state
  bool get isDisabled => _widgetStates.isDisabled;

  /// Whether or not the widget has a non-null onPressed field
  bool get hasAction => widget.onPressed != null;

  /// Shortcut to the widget's onPressed if it exists, returns a noop otherwise
  VoidCallback get onPressed => widget.onPressed ?? () {};

  // Constructor
  SettingsCellState({Set<WidgetState>? initialStates})
      : _widgetStates = initialStates ?? <WidgetState>{},
        super();

  @override
  void initState() {
    super.initState();
    // See note re: ButtonStyleButton
    // _updateState(WidgetState.disabled, !hasAction);
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    // See note re: ButtonStyleButton
    //_updateState(WidgetState.disabled, !hasAction);

    // If the button is disabled while a press gesture is currently ongoing,
    // InkWell makes a call to handleHighlightChanged. This causes an exception
    // because it calls setState in the middle of a build. To preempt this, we
    // manually update pressed to false when this situation occurs.
    if (!hasAction && isPressed) {
      _handleHighlightChanged(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var skinDelegate = SettingsSkin.of(context)?.delegate ?? DefaultSkin();

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (isDisabled || !hasAction) return;
          onPressed();
        },
        onTapDown: (tapDownDetails) {
          if (isDisabled || !hasAction) return;
          _handleHighlightChanged(true);
        },
        onTapUp: (tapUpDetails) {
          if (isDisabled || !hasAction) return;
          _handleHighlightChanged(false);
        },
        onTapCancel: () {
          if (isDisabled || !hasAction) return;
          _handleHighlightChanged(false);
        },
        child: skinDelegate.settingsCell(context, widgetStates: _widgetStates, extraInfo: widget.extraInfo, child: widget.buildContents(context, widgetStates: _widgetStates)),
      ),
    );
  }

  // Material State Methods (not to be confused with widget state)
  void _updateState(WidgetState state, bool value) {
    value ? _widgetStates.add(state) : _widgetStates.remove(state);
  }

  void _handleHighlightChanged(bool value) {
    if (isPressed != value) {
      setState(() {
        _updateState(WidgetState.pressed, value);
      });
    }
  }

  // // Not used right now, since I'm using a GestureDetector instead of an InkWell
  // void _handleHoveredChanged(bool value) {
  //   if (isHovering != value) {
  //     setState(() {
  //       _updateState(WidgetState.hovered, value);
  //     });
  //   }
  // }

  // // Not used right now, since I'm using a GestureDetector instead of an InkWell
  // void _handleFocusedChanged(bool value) {
  //   if (isFocused != value) {
  //     setState(() {
  //       _updateState(WidgetState.focused, value);
  //     });
  //   }
  // }

  // // Not used right now, since I'm using a GestureDetector instead of an InkWell
  // void _handleSelectedChanged(bool value) {
  //   if (isSelected != value) {
  //     setState(() {
  //       _updateState(WidgetState.selected, value);
  //     });
  //   }
  // }
}
