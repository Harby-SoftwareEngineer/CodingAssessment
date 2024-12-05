import 'package:app/core/utils/navigator.dart';
import 'package:app/core/widgets/texts/primary_texts.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../main_index.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;


  late Widget startWidget;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        bool isLogin = await HelperMethods.isLogin();
        if ( isLogin) {
          pushNamedAndRemoveUntil(Routes.navigationPages);
        } else {
          pushNamedAndRemoveUntil(Routes.loginPage);
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            curve: Curves.decelerate,
            height: double.infinity,
            width: double.infinity,
            padding: 50.paddingAll,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff000F3C),
                  Color(0xff243158),
                ],
              ),
            ),
            child: AnimatedBuilder(
            animation: _opacityAnimation,
            builder: (context, child) {
            return Opacity(opacity: _opacityAnimation.value,
                          child: Image.asset(AppImages.logo, fit: BoxFit.scaleDown),
            );},
                        )), // Set image
      ),
    );
  }
}
