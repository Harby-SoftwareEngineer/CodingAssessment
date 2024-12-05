import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:app/core/widgets/scaffold/app_scaffold.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import 'chang_language_screen.dart';
import 'chang_language_widget.dart';

class ChangeLanguagePage extends BaseStatelessWidget {
  ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: ChangLanguageScreen());
  }

  static void showChangeLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      isScrollControlled: true,
      backgroundColor: context.scaffoldBackgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return ChangLanguageWidget();
      },
    );
  }
}
