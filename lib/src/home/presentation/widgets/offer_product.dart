import 'dart:io';

import 'package:app/core/utils/navigator.dart';
import 'package:app/core/widgets/texts/hint_texts.dart';
import 'package:app/main.dart';
import 'package:app/src/home/presentation/widgets/video_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';
import '../../data/models/home_data_dto.dart';

class OfferProduct extends StatelessWidget {
  OfferProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 310,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.slider),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        // alignment: AlignmentDirectional.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.bike,
            scale: 5,
          ),
          5.ph,
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: HintBoldText(
              label: "30% Off",
              fontSize: 26,
            ).paddingHoriz(40),
          ),
          10.ph,
        ],
      ),
    );
  }

  Column favoriteButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    );
  }
}
