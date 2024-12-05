import 'dart:io';

import 'package:app/core/widgets/images/image_network.dart';
import 'package:app/core/widgets/texts/primary_texts.dart';

import '../../../../core/widgets/texts/black_texts.dart';
import '../../../../core/widgets/texts/white_texts.dart';
import '../../../main_index.dart';
import '../../domain/entities/profile.dart';

class ProfileHeaderWidget extends BaseStatelessWidget {
  final Profile profile;
  final Function(File) onSelectImage;

  ProfileHeaderWidget(
      {super.key, required this.profile, required this.onSelectImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122,
      padding: 10.paddingAll,
      decoration:
          Decorations.shapeDecorationShadow(color: primaryColorDark),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         CircleAvatar(
            radius: 40,
            backgroundColor: cardColor,
           child: Icon(
              Icons.account_circle,
              size: 80,
              color: primaryColorDark,
            ),
         ),
          10.pw,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteBoldText(
                label: profile.displayName ?? '',
                fontSize: 20,
              ),
              10.ph,
              Text(
                profile.email ?? '',
                style: hintRegularStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
