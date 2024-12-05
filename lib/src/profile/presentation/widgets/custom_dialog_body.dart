import 'package:app/core/widgets/texts/black_texts.dart';

import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';

class CustomDialogBody extends BaseStatelessWidget {
  final VoidCallback onLogout;
  final String? title;
  final String? description;

  CustomDialogBody( {super.key,required this.onLogout, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlackBoldText(
            label: title ?? strings.logout,
            fontSize: 20,
          ),
          16.ph,
          BlackRegularText(
            label: description ?? 'Are you sure you want to logout?',
            fontSize: 16,
            textAlign: TextAlign.center,
          ),
          PrimaryButton(
            height: 45,
            title: title ?? strings.logout,
            margin: 16.paddingVert,
            onPressed: onLogout,
          ),
          PrimaryButton(
            height: 45,
            backgroundColor: const Color(0xffDCDCDC),
            style: const TextStyle(color: Colors.grey
            ),
            title: strings.cancel,
            onPressed: (){
              pop();
            },
          ),
        ],
      ),
    );
  }
}
