import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/repositories/seasons_repo.dart';

@Injectable()
class ProductsCubit extends BaseCubit {
  final ProductsRepo usecase;

  ProductsCubit(this.usecase);

  void fetchProducts(int? categoryId){
    executeBuilder(() => usecase.fetchProducts(), onSuccess: (data) {
      if (categoryId != null) {
        data = data.where((element) => element.category?.id == categoryId).toList();
      }
      if(data.isEmpty){
        throw EmptyListException();
      }
      emit(DataSuccess<List<Product>>(data));
    });
  }
}
