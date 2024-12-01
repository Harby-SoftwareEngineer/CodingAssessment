import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../components/base_stateless_widget.dart';
import '../../decorations/decorations.dart';
import '../../resources/validation.dart';

class CustomPinCode extends BaseStatelessWidget {
  final TextEditingController pinCodeController;
   CustomPinCode({Key? key, required this.pinCodeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 80,
      height: 52,
      textStyle: primaryBoldStyle,
      decoration: Decorations.kDecorationBorderRadius(
        borderColor: context.theme.inputDecorationTheme.border!.borderSide.color,
      ),
      margin: 3.paddingHoriz,
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: context.theme.inputDecorationTheme.border!.borderSide.color),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        length: 4,
        validator: (value) => Validation.validateRequired(value ?? ''),
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        controller: pinCodeController,
        errorTextStyle: hintRegularStyle.copyWith(color: Colors.red),

      ),
    );
  }
}
