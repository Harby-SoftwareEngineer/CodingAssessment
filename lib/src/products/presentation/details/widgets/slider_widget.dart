import 'dart:io';

import 'package:app/core/utils/navigator.dart';
import 'package:app/main.dart';
import 'package:app/src/main_index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/widgets/images/image_network.dart';

class CustomSliderWidget extends StatelessWidget {
  final List<String> images;

  CustomSliderWidget({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    CarouselSliderController carouselController = CarouselSliderController();
    StreamStateInitial<int> streamStateInitial = StreamStateInitial<int>();
    int index = 0;
    return SizedBox(
      height: 222,
      child: StatefulBuilder(builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              // width: double.infinity,
              child: CarouselSlider(
                carouselController: carouselController,
                items: images.map(
                  (e) {
                    return SizedBox(
                        width: double.infinity,
                        child: ImageNetwork(
                          margin: 5.paddingHoriz,
                          image: e,
                          fit: BoxFit.fill,
                        ));
                  },
                ).toList(),
                options: CarouselOptions(
                  height: 190,
                  viewportFraction: 0.90,
                  // enableInfiniteScroll: false,
                  autoPlay: true,
                  // pauseAutoPlayInFiniteScroll: true,
                  // pauseAutoPlayOnTouch: false,
                  // pauseAutoPlayOnManualNavigate: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  onPageChanged: (index, reason) {
                    index = index;
                    streamStateInitial.setData(index);
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            10.ph,
            Center(
              child: StreamBuilder<int>(
                initialData: 0,
                stream: streamStateInitial.stream,
                builder: (context, snapshotIndex) {
                  return Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: AnimatedSmoothIndicator(
                      activeIndex: snapshotIndex.data ?? 0,
                      count: images.length ?? 0,
                      axisDirection: Axis.horizontal,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: context.dividerColor,
                        activeDotColor: context.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
