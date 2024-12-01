import 'package:injectable/injectable.dart';

import '../../../../main_index.dart';
import '../../../domain/repositories/seasons_repo.dart';

@Injectable()
class ProductsCubit extends BaseCubit {
  final ProductsRepo usecase;

  ProductsCubit(this.usecase);

  void fetchProducts(){
    executeSuccess(() => usecase.fetchProducts());
  }
}
