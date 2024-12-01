import 'package:app/core/widgets/texts/black_texts.dart';
import 'package:app/core/widgets/texts/hint_texts.dart';


import '../../src/main_index.dart';

class CustomEmptyWidget extends BaseStatelessWidget {
  CustomEmptyWidget( {Key? key,required this.image, this.titleButton,this.onPressed, this.hasButton,required this.text, required this.title,}) : super(key: key);
  final String image;
  final String title;
  final String text;
  final String? titleButton;
  final bool? hasButton;
  dynamic Function()? onPressed;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: 20.paddingHoriz,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: AppIcon(
                icon: image,
                size: 50,
              ),
            ),
            30.ph,
            BlackBoldText(
              fontSize: 20,
              textAlign: TextAlign.center,
              label: title,
            ),
            8.ph,
            Padding(
              padding:10.paddingHoriz,
              child: HintMediumText(
                label: text,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
            ),
            hasButton==true?
            Padding(
              padding: 70.paddingTop,
              child: PrimaryButton(
                height: 54,
                title: titleButton??strings.not_data_found,
                margin: 30.paddingVert+10.paddingHoriz,
                onPressed: onPressed,
              ),
            ):const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
