import '../../../src/main_index.dart';
import 'label_button.dart';

class MoreButton extends StatelessWidget {
  final String routeName;
  final dynamic arguments;

  const MoreButton({
    Key? key,
    required this.routeName,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabelButton(
      title: context.getStrings().more,
      onTap: () {
        Navigator.pushNamed(context, routeName, arguments: arguments);
      },
      color: context.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }
}
