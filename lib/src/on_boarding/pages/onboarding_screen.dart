import 'package:app/core/widgets/texts/black_texts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/helper_methods.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/widgets/buttons/label_button.dart';
import '../../../core/widgets/buttons/outlined_button.dart';
import '../../main_index.dart';
import '../widgets/background_images.dart';
import '../widgets/onboarding_item.dart';

class OnBoardingScreen extends BaseStatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  StreamStateInitial<int> pageStream = StreamStateInitial();
  PageController? controller =
      PageController(initialPage: 0, viewportFraction: 1.0);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    HelperMethods.setFirstTime();
    return Column(
      children: [
        backButton(),
        Expanded(
          // height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            controller: controller,
            itemCount: BackgroundImages.data(context).length,
            onPageChanged: (index) {
              pageStream.setData(index);
            },
            itemBuilder: (context, index) {
              return OnboardingItem(
                item: BackgroundImages.data(context)[index],
              );
            },
          ),
        ),
        30.ph,
        pageIndicator(),
        // const Spacer(),
        20.ph,
        nextButton(),
        20.ph,
      ],
    );
  }

  StreamBuilder nextButton() {
    print('index $index');
    return StreamBuilder<int>(
        stream: pageStream.stream,
        builder: (context, snapshot) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: context.primaryColor,
              padding: 22.paddingHoriz + 16.paddingVert,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (index == 2) {
                pushNamed(Routes.register);
              } else {
                controller!.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlackMediumText(
                  label: index == 3 ? strings.start : strings.next,
                  labelColor: Colors.white,
                  fontSize: 16,
                ).paddingBottom(5),
                12.pw,
                const AppIcon(icon: AppIcons.arrow_right, size: 14),
              ],
            ),
          );
        });
  }

  Widget pageIndicator() {
    return StreamBuilder<int>(
      initialData: 0,
      stream: pageStream.stream,
      builder: (context, snapshot) {
        return Container(
          alignment: AlignmentDirectional.bottomCenter,
          margin: 20.paddingBottom,
          child: AnimatedSmoothIndicator(
            activeIndex: snapshot.data ?? 0,
            count: 4,
            // textDirection: TextDirection.ltr,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: context.dividerColor.withOpacity(0.6),
              activeDotColor: context.primaryColor,
            ),
          ),
        );
      },
    );
  }

  Align backButton() {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Padding(
        padding: 50.paddingTop + 20.paddingEnd,
        child: LabelButton(
          title: context!.strings.skip,
          onTap: () async {
            pushNamedAndRemoveUntil(Routes.loginPage);
            await HelperMethods.setFirstTime();
          },
        ),
      ),
    );
  }
}
