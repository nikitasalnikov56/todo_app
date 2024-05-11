import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson3/domain/provider/note_provider.dart';
import 'package:lesson3/generated/locale_keys.g.dart';
import 'package:lesson3/ui/components/app_bar_widget.dart';
import 'package:lesson3/ui/components/notes_body.dart';
import 'package:lesson3/ui/routes/app_routes.dart';
import 'package:lesson3/ui/style/app_colors.dart';
import 'package:lesson3/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NoteProvider>();

    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(
          onPressed: () {
            model.changeLanguage(context);
          },
          icon: const Icon(
            Icons.language,
          ),
        ),
        title: Text(
          LocaleKeys.notes.tr(),
          style: AppStyle.fontStyle,
        ),
        action: IconButton(
          onPressed: () {
            context.go(AppRoutes.searchNotes);
          },
          icon: const Icon(Icons.search),
        ),
      ),
      body: const NotesBody(),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton.extended(
          heroTag: 'add-btn',
          backgroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {
            context.go(AppRoutes.addNotes);
          },
          label: const Icon(
            Icons.edit_outlined,
            color: AppColors.purple,
          ),
        ),
      ),
    );
  }
}
