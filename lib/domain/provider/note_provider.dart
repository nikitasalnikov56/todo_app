import 'package:flutter/material.dart';
import 'package:lesson3/domain/provider/note_localization.dart';
import 'package:lesson3/domain/provider/note_manager.dart';

class NoteProvider extends ChangeNotifier {
  final NoteLocalization _noteLocalization = NoteLocalization();
  NoteManager noteManager = NoteManager();

  // //add notes

  Future<void> onAddNote(BuildContext context) async {
    noteManager.addNote(context);
  }

  //delete notes
  Future<void> deleteNote(BuildContext context, int index) async {
    noteManager.deleteNote(context, index);
  }

  //редактирование заметки
  Future<void> changeNote(BuildContext context, int index) async {
    noteManager.changeNote(context, index);
  }


  changeLanguage(BuildContext context) {
    _noteLocalization.changeLanguage(context);
  }
}
