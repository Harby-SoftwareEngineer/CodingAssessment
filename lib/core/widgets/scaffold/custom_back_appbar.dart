import 'dart:math';

import '../../../src/main_index.dart';

class CustomBackAppBar extends BaseStatelessWidget {
   CustomBackAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: AppIcons.back,
      // size: 130,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
