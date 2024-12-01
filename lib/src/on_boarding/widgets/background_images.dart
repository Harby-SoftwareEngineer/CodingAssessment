import 'package:app/src/main_index.dart';
import 'onboarding_item.dart';

///  Created by harby on 9/7/2023.
class BackgroundImages {


 static List<OnboardingModel> data (BuildContext context){
   final strings = context.strings;
    return [
      OnboardingModel(
        image: AppIcons.onboarding1,
        title: strings.onboarding_title1,
        description: strings.onboarding_description1,
      ),
      OnboardingModel(
        image: AppIcons.onboarding2,
        title: strings.onboarding_title2,
        description: strings.onboarding_description2,
      ),
      OnboardingModel(
        image: AppIcons.onboarding3,
        title: strings.onboarding_title3,
        description: strings.onboarding_description3,
      ),
      OnboardingModel(
        image: AppIcons.onboarding4,
        title: strings.onboarding_title4,
        description: strings.onboarding_description4,
      ),
    ];
 }

}


