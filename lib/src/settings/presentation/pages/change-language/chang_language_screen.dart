import 'package:app/core/utils/navigator.dart';
import 'package:app/core/widgets/buttons/outlined_button.dart';
import 'package:app/core/widgets/images/logo.dart';
import 'package:app/core/widgets/texts/hint_texts.dart';

import '../../../../../core/widgets/texts/primary_texts.dart';
import '../../../../main_index.dart';
import '../../bloc/locale_cubit.dart';
import '../../bloc/locale_state.dart';

class ChangLanguageScreen extends BaseStatelessWidget {
  ChangLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'ar';
    return BlocBuilder<LocaleCubit, LocalState>(
        bloc: LocaleCubit()..getInitialData(),
        builder: (context, state) {
          selectedValue = context.languageCode;
          return Material(
            color: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Padding(padding: 30.paddingTop, child: const Logo())),
                Expanded(
                  child: Container(
                    padding: 20.paddingHoriz + 30.paddingTop,
                    decoration: Decorations.kDecorationTopRadius(radius: 25),
                    child: Column(
                      children: [
                        PrimaryBoldText(label: strings.language, fontSize: 24),
                        5.ph,
                        HintRegularText(label: strings.language_subtitle),
                        30.ph,
                        SecondaryButton(
                          title: strings.arabic,
                          onPressed: () {
                            context.read<LocaleCubit>().setLanguageData('ar');
                            pushNamed(Routes.loginPage);
                          },
                        ),
                        20.ph,
                        SecondaryButton(
                          title: strings.english,
                          onPressed: () {
                            context.read<LocaleCubit>().setLanguageData('ar');
                            pushNamed(Routes.loginPage);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
