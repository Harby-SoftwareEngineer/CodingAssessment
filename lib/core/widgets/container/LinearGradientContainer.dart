import '../../../src/main_index.dart';

class LinearGradientContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  const LinearGradientContainer({super.key, required this.child, this.radius = 50.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        gradient: LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: [
            Color(0xFF283141),
            Color(0xFF2D3749),
            Color(0xFF283141),
          ],
        ),
      ),
      child: Container(
        margin: 3.paddingTop,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius + 2),
            topRight: Radius.circular(radius + 2),
          ),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFF262E3D).withOpacity(0.8),
              Color(0xFF262E3D),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
