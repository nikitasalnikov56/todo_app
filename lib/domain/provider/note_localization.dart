import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoteLocalization {
  changeLanguage(BuildContext context) async {
    if (context.locale == const Locale('ru')) {
      context.setLocale(
        const Locale('en'),
      );
    } else {
      context.setLocale(
        const Locale('ru'),
      );
    }
  }
}
