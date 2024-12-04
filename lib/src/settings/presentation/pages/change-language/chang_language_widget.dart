import 'package:app/core/utils/navigator.dart';
import 'package:app/core/widgets/buttons/outlined_button.dart';
import 'package:app/core/widgets/images/logo.dart';
import 'package:app/core/widgets/texts/black_texts.dart';
import 'package:app/core/widgets/texts/hint_texts.dart';

import '../../../../../core/widgets/radio/custom_radio_list.dart';
import '../../../../../core/widgets/texts/primary_texts.dart';
import '../../../../main_index.dart';
import '../../bloc/locale_cubit.dart';
import '../../bloc/locale_state.dart';

class ChangLanguageWidget extends BaseStatelessWidget {
  ChangLanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'ar';
    return BlocBuilder<LocaleCubit, LocalState>(
        bloc: LocaleCubit()..getInitialData(),
        builder: (context, state) {
          selectedValue = context.languageCode;
          return Container(
            padding: 20.paddingHoriz + 30.paddingVert,
            decoration: Decorations.kDecorationTopRadius(radius: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryBoldText(label: strings.language, fontSize: 24),
                5.ph,
                HintRegularText(label: strings.language_subtitle),
                50.ph,
                SecondaryButton(
                  title: strings.arabic,
                  backgroundColor: selectedValue == 'ar' ? primaryColor : null,
                  textColor: selectedValue == 'ar' ? whiteTextColor : null,
                  onPressed: () {
                    context.read<LocaleCubit>().setLanguageData('ar');
                    pushNamed(Routes.loginPage);
                  },
                ),
                20.ph,
                SecondaryButton(
                  title: strings.english,
                  backgroundColor: selectedValue == 'en' ? primaryColor : null,
                  textColor: selectedValue == 'en' ? whiteTextColor : null,
                  onPressed: () {
                    context.read<LocaleCubit>().setLanguageData('ar');
                    pushNamed(Routes.loginPage);
                  },
                ),
              ],
            ),
          );
        });
  }
}
