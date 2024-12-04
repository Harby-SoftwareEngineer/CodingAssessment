
import 'package:app/core/widgets/texts/white_texts.dart';

import '../main_index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OrdersScreen extends BaseStatelessWidget {

  OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.orders,
      body: Center(
        child: WhiteBoldText(label: strings.coming_soon, fontSize: 26),
      ),
    );
  }
}
