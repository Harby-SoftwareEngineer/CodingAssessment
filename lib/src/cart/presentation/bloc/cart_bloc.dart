import 'package:injectable/injectable.dart';

import '../../../main_index.dart';
import '../../domain/repositories/cart_repo.dart';

@Injectable()
class CartCubit extends BaseCubit {
  final CartRepo repo;

  CartCubit(this.repo);

  void fetchProducts(){
    executeSuccess(() => repo.fetchCartProducts());
  }
}
