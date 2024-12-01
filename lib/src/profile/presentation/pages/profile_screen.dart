import 'dart:io';

import 'package:app/core/utils/navigator.dart';
import 'package:app/core/widgets/buttons/outlined_button.dart';
import 'package:app/core/widgets/texts/black_texts.dart';

import '../../../main_index.dart';
import '../../../settings/domain/entities/about.dart';
import '../../../settings/presentation/pages/change-language/chang_language_page.dart';
import '../../domain/entities/profile.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends BaseStatelessWidget {
  final Profile profile;
  final VoidCallback onLogout;
  final VoidCallback onDeleteAccount;
  final VoidCallback onRefresh;
  final Function(File) onSelectImage;

  ProfileScreen({
    Key? key,
    required this.profile,
    required this.onLogout,
    required this.onDeleteAccount,
    required this.onRefresh,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 15.paddingHoriz,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeaderWidget(
            profile: profile,
            onSelectImage: onSelectImage,
          ),
          30.ph,
          ProfileItem(
            icon: AppIcons.contact_us,
            title: strings.contact_us,
            routeName: Routes.contactUsPage,
          ),
          16.ph,
          ProfileItem(
            icon: AppIcons.mobile,
            title: strings.edit_account,
            // routeName: Routes.changeMobileNumberPage,
          ),
          16.ph,
          ProfileItem(
            icon: AppIcons.lock,
            title: strings.change_password,
            routeName: Routes.changePasswordSendOtpPage,
          ),
          16.ph,
          ProfileItem(
            icon: AppIcons.language,
            title: strings.language,
            onTap: () => ChangeLanguagePage.showChangeLanguageSheet(context),
          ),
          20.ph,
          const Divider(
            color: AppColors.greysColor,
          ),
          20.ph,
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   // visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          //   onTap: () => pushNamed(Routes.aboutPage, arguments: AboutType.aboutUs),
          //   title: BlackMediumText(
          //     label: strings.about_us,
          //     fontSize: 16,
          //   ),
          // ),
          // ListTile(
          //   contentPadding: EdgeInsets.zero,
          //   // visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          //   onTap: () => pushNamed(Routes.aboutPage, arguments: AboutType.terms),
          //   title: BlackMediumText(
          //     label: strings.terms_conditions,
          //     fontSize: 16,
          //   ),
          // ),
          ProfileItem(
            icon: AppIcons.logout,
            iconSize: 24,
            iconColor: AppColors.errorColor,
            title: strings.sign_outs,
            onTap: () =>
                onLogout(),
          ),
          24.ph,
        ],
      ),
    );
  }

  showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context,
        isScrollControlled: true,
        backgroundColor: cardColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return Container(
            height: 480,
            width: double.infinity,
            color: cardColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  100.ph,
                  const AppIcon(icon: AppIcons.log),
                  30.ph,
                  BlackBoldText(
                    label: strings.do_you_want_to_go_out,
                    labelColor: AppColors.blackColor,
                    fontSize: 22,
                  ),
                  55.ph,
                  PrimaryButton(
                    title: strings.yes,
                    margin: 16.paddingHoriz,
                    fontSize: 16,
                    radius: 10,
                    onPressed: () {
                      onLogout();
                    },
                  ),
                  14.ph,
                  SecondaryButton(
                    title: strings.cancel,
                    margin: 16.paddingHoriz,
                    fontSize: 16,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
