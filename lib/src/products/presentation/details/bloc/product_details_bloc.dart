import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/api_exception.dart';
import '../../../../cart/data/data_sources/local/cart_database.dart';
import '../../../../cart/data/models/cart_query_dto.dart';
import '../../../../cart/domain/repositories/cart_repo.dart';
import '../../../../main_index.dart';
import '../../../domain/repositories/seasons_repo.dart';

@Injectable()
class ProductDetailsCubit extends BaseCubit {
  final ProductsRepo repo;
  final CartRepo cartRepo;

  ProductDetailsCubit(this.repo, this.cartRepo);

  void addToCart(CartQueryDto query) async {
    try {
      emit(LoadingStateListener());
      await cartRepo.insertProduct(query);
      emit(SuccessStateListener('Product added to cart successfully!'));
    } catch (e) {
      String message = 'The product already exists';
      emit(FailureStateListener(ApiException(message, 500)));
      rethrow;
    }
  }
}
