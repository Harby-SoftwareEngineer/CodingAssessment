import '../../src/main_index.dart';
import '../widgets/container/background_container.dart';

class LoadingView extends StatelessWidget {
  LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 30,
/*
                child: Image.asset('images/loading_gify.gif'),
*/
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallLoadingView extends BaseStatelessWidget {
  final double? height;

  SmallLoadingView({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 15.0,
              width: 15.0,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}