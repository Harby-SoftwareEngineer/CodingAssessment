
import '../../../src/main_index.dart';

///  Created by harbey on 9/3/2023.
class Logo extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;

  const Logo({super.key, this.width, this.height, this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.splash,
      width: size ?? width ?? 198,
      height: size ?? height ?? 124,
    );
  }
}
