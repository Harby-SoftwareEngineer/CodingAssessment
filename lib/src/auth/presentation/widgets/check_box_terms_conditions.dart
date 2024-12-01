
import '../../../../core/widgets/texts/black_texts.dart';
import '../../../main_index.dart';


class CheckBoxTermsConditions extends BaseStatelessWidget {
  final void Function(bool?)? onChanged;
  CheckBoxTermsConditions({super.key, this.onChanged});

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, snapshot) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              value: value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              activeColor: context.primaryColor,
              side: BorderSide(
                color: context.dividerColor,
                width: 1,
              ),
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                snapshot(() {
                  this.value = value!;
                });
                onChanged!(value);
              },
            ),
          ),
          5.pw,
          Flexible(
            child: BlackSemiBoldText(
              fontSize: 14,
              label: strings.i_read_and_agree_msg,
            ),
          ),
        ],
      );
    });
  }
}
