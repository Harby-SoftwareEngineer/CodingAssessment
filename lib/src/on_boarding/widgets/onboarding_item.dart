
import '../../../core/utils/helper_methods.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/buttons/label_button.dart';
import '../../../core/widgets/texts/black_texts.dart';
import '../../../core/widgets/texts/hint_texts.dart';
import '../../main_index.dart';

class OnboardingItem extends BaseStatelessWidget {
  final OnboardingModel item;

  OnboardingItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (kToolbarHeight - 40).ph,
        Padding(
          padding: 10.paddingVert,
          child: BlackMediumText(
            label: item.title,
            fontSize: 26,
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AppIcon(
                icon: item.image,
              ),
              BlackRegularText(
                label: item.description,
                fontSize: 18,
                labelColor: Colors.white,
                textAlign: TextAlign.center,
              ).paddingAll(50),
            ],
          ),
        ),
      ],
    );
  }
}

class OnboardingModel {
  String title;
  String description;
  String image;
  bool? isImageStart;

  OnboardingModel(
      {required this.title,
      required this.description,
      required this.image,
      this.isImageStart});
}
