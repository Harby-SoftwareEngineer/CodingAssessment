import 'package:injectable/injectable.dart';

import '../../../main_index.dart';
import '../../data/models/cart_query_dto.dart';
import '../../domain/entities/cart_query.dart';
import '../../domain/repositories/cart_repo.dart';

@Injectable()
class CartCubit extends BaseCubit {
  final CartRepo repo;

  CartCubit(this.repo);

  void fetchProducts(){
    executeSuccess(() => repo.fetchCartProducts());
  }

  void removeProduct(CartQueryDto cartQuery){
    executeSuccessState(() => repo.deleteCallLog(cartQuery));
  }

  void updateProduct(CartQueryDto cartQuery){
    executeSuccessState(() => repo.updateProduct(cartQuery));
  }
}
