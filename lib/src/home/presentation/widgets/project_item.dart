import 'package:app/core/widgets/texts/primary_texts.dart';
import 'package:app/core/widgets/texts/row_texts.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../main_index.dart';
import '../../data/models/home_data_dto.dart';

class ProjectItem extends BaseStatelessWidget {
  final dynamic project;

  ProjectItem({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.kDecorationBorderRadius(),
      // width: context.width,
      padding: 10.paddingAll,
      margin: 10.paddingBottom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTexts(
            value: "#${project.code}",
            title: project.name ?? "",
            titleStyle: blackMediumStyle.copyWith(fontSize: 16),
            valueStyle: blackRegularStyle.copyWith(color: greyColor),
          ),
          10.ph,
          InkWell(
            onTap: () {
              print("open map");
              HelperMethods.launchURL(project.mapLink ?? "");
            },
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.blueColorff,
                  size: 20,
                ),
                10.pw,
                Expanded(
                  child: Row(
                    children: [
                      PrimaryRegularText(
                        label: '${project.location ?? ""} - ${project.city?.name ?? ""}',
                        fontSize: 14,
                        labelColor: blueColorOff,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.greyColorAC,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.ph,
          if (project.startDate != null && project.endDate != null)
          Row(
            children: [
              const AppIcon(
                icon: AppIcons.calendar,
                size: 18,
              ),
              10.pw,
              PrimaryRegularText(
                label: '${project.startDate ?? ""} - ${project.endDate ?? ""}',
                fontSize: 14,
                labelColor: greyColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
