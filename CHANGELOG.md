
## 0.0.1-alpha.1 - 2021/01/25

* Initial pre-release


## 0.1.0-nullsafety.1 - 2021/05/08

* Null-safety
* Minor API tweaks:
    * `sectionHeader` and `sectionFooter` moved their string parameters into optional named parameters instead
        ```dart
        Widget sectionHeader(BuildContext context, {Key? key, String? header, Map<String, dynamic>? extraInfo})
        Widget sectionFooter(BuildContext context, {Key? key, String? footer, Map<String, dynamic>? extraInfo})
        ```


## 0.1.0-nullsafety.2 - 2021/05/10

* Added a missing `?`
* Minor code/comment clean up


## 0.3.0 - 2025/05/30

### Notes:
  * Updated required SDK version: `>=3.6.0 <4.0.0`
  * Updated required Flutter version: `>=3.27.0`
  * Updated dependencies
  * Updated various deprecated API's to their current replacements
  * Updated build scripts (Gradle etc)
  * Dropped `-nullsafety` pre-release tag in the version number

### Additions:

#### Extensions:


## 0.4.0 - 2025/05/30

### Notes:
  * Static analyis updates/clean up
  * [Breaking] Changed enum members to be lowerCamelCase (see: https://dart.dev/tools/linter-rules/constant_identifier_names)

### Additions:

#### Extensions:
