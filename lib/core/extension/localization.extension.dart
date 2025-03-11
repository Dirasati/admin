import 'package:flutter/cupertino.dart';
import 'package:dirasaty_admin/core/localization/app_localization.dart';

extension LocalizationExtension on String {
  String tr(BuildContext context) =>
      AppLocalizations.of(context)?.translate(this) ?? this;

  void changeLanguage(BuildContext context, String langCode) {
    AppLocalizations.of(context)?.load();
  }
}
