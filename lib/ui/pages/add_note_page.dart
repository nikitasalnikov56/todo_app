import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson3/domain/provider/note_manager.dart';
import 'package:lesson3/generated/locale_keys.g.dart';
import 'package:lesson3/ui/components/app_bar_widget.dart';
import 'package:lesson3/ui/components/form_widget.dart';
import 'package:lesson3/ui/routes/app_routes.dart';
import 'package:lesson3/ui/style/app_style.dart';


class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    NoteManager noteManager = NoteManager();
    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title:  Text(
          LocaleKeys.addNotes.tr(),
          style: AppStyle.fontStyle,
        ),
        action: const SizedBox(),
      ),
      body: FormWidget(
        btnName: LocaleKeys.addBtn.tr(),
        func: () {
          noteManager.addNote(context);
        },
      ),
    );
  }
}
