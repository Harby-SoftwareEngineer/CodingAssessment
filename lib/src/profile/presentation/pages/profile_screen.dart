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
            icon: Icons.account_circle,
            title: strings.edit_account,
          ),
          10.ph,
          ProfileItem(
            icon: Icons.contact_page,
            title: strings.contact_us,
          ),
          10.ph,
          ProfileItem(
            icon: Icons.password,
            title: strings.change_password,
          ),
          10.ph,
          ProfileItem(
            icon: Icons.language,
            title: strings.language,
            onTap: () => ChangeLanguagePage.showChangeLanguageSheet(context),
          ),
          10.ph,
          ProfileItem(
            icon: Icons.info,
            title: strings.about_us,
          ),
          10.ph,
          ProfileItem(
            icon: Icons.details,
            title: strings.terms_conditions,
          ),
          20.ph,
          ProfileItem(
            icon: Icons.logout,
            iconSize: 24,
            iconColor: AppColors.errorColor,
            title: strings.logout,
            onTap: () =>
                onLogout(),
          ),
          100.ph,
        ],
      ),
    );
  }
}
