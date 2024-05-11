import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lesson3/domain/hive/hive_box.dart';
import 'package:lesson3/generated/locale_keys.g.dart';

class NoteEditingController {
 static final TextEditingController titleController = TextEditingController();
 static final TextEditingController textController = TextEditingController();

 static void clearControllers() {
    titleController.clear();
    textController.clear();
  }
  
 static  Future<void> setControllers(int index) async {
    titleController.text =
        HiveBoxes.notes.getAt(index)?.title ?? LocaleKeys.title.tr();
    textController.text =
        HiveBoxes.notes.getAt(index)?.title ?? LocaleKeys.note.tr();
  }
}