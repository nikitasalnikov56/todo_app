import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson3/domain/hive/hive_box.dart';
import 'package:lesson3/domain/hive/notes_data.dart';
import 'package:lesson3/domain/provider/note_controller.dart';
import 'package:lesson3/generated/locale_keys.g.dart';
import 'package:lesson3/ui/routes/app_routes.dart';

class NoteManager {


  final ScrollController scrollController = ScrollController();

  Future<void> addNote(BuildContext context) async {
    final title = NoteEditingController.titleController.text.isNotEmpty
        ? NoteEditingController.titleController.text
        : LocaleKeys.title.tr();

    final text = NoteEditingController.textController.text.isNotEmpty
        ? NoteEditingController.textController.text
        : LocaleKeys.note.tr();

    await HiveBoxes.notes
        .add(NotesData(title: title, text: text))
        .then((value) => context.go(AppRoutes.home))
        .then(
          (value) => NoteEditingController.clearControllers(),
        );
  }

  Future<void> deleteNote(BuildContext context, int index) async {
    await HiveBoxes.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

  Future<void> changeNote(BuildContext context, int index) async {
    final title = NoteEditingController.titleController.text.isNotEmpty
        ? NoteEditingController.titleController.text
        : LocaleKeys.title.tr();

    final text = NoteEditingController.textController.text.isNotEmpty
        ? NoteEditingController.textController.text
        : LocaleKeys.note.tr();

    await HiveBoxes.notes
        .putAt(
          index,
          NotesData(title: title, text: text),
        )
        .then(
          (value) => context.go(AppRoutes.home),
        )
        .then(
          (value) => NoteEditingController.clearControllers(),
        );
  }
}
