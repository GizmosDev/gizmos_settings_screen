# gizmos\_settings\_screen

[![badge-pubdev]][pub.dev]
[![badge-repo]][repo]
![github-stars][]

![badge-platforms][]
[![badge-language]][dart.dev]
[![badge-license]][license]

[![badge-sponsors]][cerebral-gardens]
[![badge-githubsponsors]][github-davewoodcom]
[![badge-patreon]][patreon-davewoodx]

[![badge-mastodon]][mastodon-davewoodx]
[![badge-twitter]][twitter-davewoodx]
[![badge-twitter-gizmosdev]][twitter-gizmosdev]

A Flutter package for displaying settings screens (or similar screens). I built this after finding it near impossible to customize the look and feel of the other popular settings screen packages. This package takes a different approach and separates the functionality from the UI customization. This lets you create custom skins to better fit into your existing app. There are several skin prototypes included for Cupertino (light and dark modes), and Material (light and dark modes). In most cases, you can just subclass those, alter your colours and move on to the rest of your app.

This package doesn't depend on any specific package for settings storage. In fact, `gizmos_settings_screen` can be used for any type of general purpose cell based list, it's just that settings is the most obvious use case. The example application included uses [`shared_preferences`](https://pub.dev/packages/shared_preferences), but I've also used [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage) in production apps.


## Installation

To use this package, add `gizmos_settings_screen` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages#adding-a-package-dependency-to-an-app).

```yaml
dependencies:
  gizmos_settings_screen: any
```

## Import the library

```dart
import 'package:gizmos_settings_screen/gizmos_settings_screen.dart';
```


## Usage

Check the included example app for full details. For basic usage, you need to instantiate a `SkinDelegate` using one of the supplied skins, or by create your own subclass of one of the supplied skins. Then customize a `SettingsScreen` by attaching one of more `SettingsSections` configured with one or more `SettingsCell` subclasses. Included subclasses include `DetailsSettingCell`, `SwitchSettingsCell`, 'SliderSettingsCell` and `ButtonSettingsCell`. These will cover most of your basic needs, but it's trivial to create additional subclasses to handle specific options for your app.


## Screenshots

<img src="https://github.com/GizmosDev/gizmos_settings_screen/raw/main/assets/screenshots/screenshot_ios_cupertino_light.png" alt="iOS Light Mode" width="320" height="693" />&nbsp;<img src="https://github.com/GizmosDev/gizmos_settings_screen/raw/main/assets/screenshots/screenshot_ios_cupertino_dark.png" alt="iOS Dark Mode" width="320" height="693" />

<img src="https://github.com/GizmosDev/gizmos_settings_screen/raw/main/assets/screenshots/screenshot_android_material_light.png" alt="Android Light Mode" width="320" height="658" />&nbsp;<img src="https://github.com/GizmosDev/gizmos_settings_screen/raw/main/assets/screenshots/screenshot_android_material_dark.png" alt="Android Dark Mode" width="320" height="658" />


## Example

```dart
// Select the default skin to use
SettingsSkinDelegate skinDelegate = !Platform.isIOS ? MaterialSettingsSkin() : CupertinoSettingsSkin();

// Return the configured SettingsScreen wrapped in a SettingsSkin with an assigned delegate
return SettingsSkin(
  delegate: skinDelegate,
  child: SettingsScreen(
	sections: [
	  SettingsSection(
		header: 'App Settings',
		footer: 'Your app preferences are set here',
		cells: [
		  DetailsSettingsCell(
			title: 'Informational',
			subtitle: 'Can include simple cells',
			leadingWidget: Icon(
			  Icons.star,
			  color: Colors.blue,
			),
		  ),
		  SwitchSettingsCell(
			title: 'Toggleable option',
			subtitle: 'Uses a switch to set something on or off',
			value: sampleBooleanSetting,
			onPressed: () {
			  setState(() {
				sampleBooleanSetting = !sampleBooleanSetting;
			  });
			},
			onChanged: (bool value) {
			  setState(() {
				sampleBooleanSetting = value;
			  });
			},
		  ),
		  SliderSettingsCell(
			title: 'Fractional option (i.e. Volume)',
			subtitle: 'Uses a slider to adjust a double',
			value: sampleDoubleSetting,
			onChanged: (value) {
			  setState(() {
				sampleDoubleSetting = value;
			  });
			},
		  ),
		  DetailsSettingsCell(
			title: 'Multiple choice option',
			value: preferences.currentOption.description,
			accessoryType: AccessoryType.Disclosure,
			onPressed: () async {
			  // Your code goes here
			},
		  ),
		  ButtonSettingsCell(
			type: ButtonType.Normal,
			title: 'Check for updates',
			onPressed: () async {
			  // Your code goes here
			},
		  ),
		],
	  ),
	],
  ),
);
```

Please see the example app in this package for a full example.


## Notes

* This is my second Flutter package, and I'm still learning the Flutter way of doing things so a lot of this package may change. Specifically, I'll be looking to make use of `ThemeData` etc in the skins to reduce duplication of having to set specific colours for your app.

Please send me suggestions/bug fixes.
   
# [![gizmosdev-logo]][gizmos.dev] gizmos.dev

<!-- Link references -->

[pub.dev]: https://pub.dev/packages/gizmos_settings_screen
[license]: https://github.com/GizmosDev/gizmos_settings_screen/blob/main/LICENSE
[repo]: https://github.com/GizmosDev/gizmos_settings_screen
[badge-repo]: https://img.shields.io/badge/GitHub-gizmos__settings__screen-blue.svg?style=flat
[badge-pubdev]: https://img.shields.io/pub/v/gizmos_settings_screen.svg?label=gizmos_settings_screen
[github-stars]: https://img.shields.io/github/stars/gizmosdev/gizmos_settings_screen?style=social

[gizmos.dev]: https://gizmos.dev/
[gizmosdev-logo]: https://gizmos.dev/images/GizmosDevLogo_32@2x.png

[dart.dev]: https://dart.dev
[cerebral-gardens]: https://www.cerebralgardens.com/
[cerebral-gardens-apps]: https://www.cerebralgardens.com/apps/

[github-davewoodcom]: https://github.com/DaveWoodCom
[mastodon-davewoodx]: https://mastodon.social/@davewoodx
[twitter-davewoodx]: https://twitter.com/davewoodx
[patreon-davewoodx]: https://www.patreon.com/DaveWoodX

[github-gizmosdev]: https://github.com/GizmosDev
[twitter-gizmosdev]: https://twitter.com/gizmosdev

[badge-language]: https://img.shields.io/badge/Dart-%3E2.7.x-orange.svg?style=flat
[badge-platforms]: https://img.shields.io/badge/Platforms-iOS%20%7C%20Android-lightgray.svg?style=flat
[badge-license]: https://img.shields.io/badge/License-BSD%203--Clause-blue.svg?style=flat

[badge-githubsponsors]: https://img.shields.io/badge/GitHub-DaveWoodCom-blue.svg?style=flat
[badge-sponsors]: https://img.shields.io/badge/Sponsors-Cerebral%20Gardens-orange.svg?style=flat
[badge-mastodon]: https://img.shields.io/mastodon/follow/000415670?domain=https%3A%2F%2Fmastodon.social&style=social
[badge-twitter]: https://img.shields.io/twitter/follow/DaveWoodX.svg?style=social
[badge-twitter-gizmosdev]: https://img.shields.io/twitter/follow/GizmosDev.svg?style=social
[badge-patreon]: https://img.shields.io/badge/Patreon-DaveWoodX-F96854.svg?style=flat
