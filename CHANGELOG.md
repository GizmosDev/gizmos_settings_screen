
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
