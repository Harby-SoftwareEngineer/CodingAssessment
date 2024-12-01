import 'package:app/core/widgets/images/image_network.dart';
import 'package:app/core/widgets/texts/black_texts.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../main_index.dart';
import '../../domain/entities/home_data.dart';

class Objective extends BaseStatelessWidget {
  final HomeData homeData;

  Objective({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 10.paddingAll,
      decoration: Decorations.shapeDecorationShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.ph,
          aboutTitle(),
          10.ph,
          aboutImageUrl(),
          description(),
        ],
      ),
    );
  }

  Widget aboutTitle() {
    return BlackBoldText(label: homeData.objectiveTitle ?? '', fontSize: 24).paddingStart(10);
  }

  Widget aboutImageUrl() {
    return ImageNetwork(
      image: homeData.objectiveImageUrl,
      height: 300,
      width: 300,
      padding: 10.paddingAll,
    ).center();
  }

  Widget description() {
    return Html(
      data: homeData.objectiveDescription?.markup ?? '',
    );
  }
}
