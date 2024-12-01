import 'package:app/core/widgets/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: OnBoardingScreen(),
    );
  }
}
