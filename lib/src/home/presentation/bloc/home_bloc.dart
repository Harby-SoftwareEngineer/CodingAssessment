
import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/bloc/base_cubit.dart';
import '../../../categories/domain/repositories/categories_repo.dart';
import '../../../main_index.dart';
import '../../../products/domain/repositories/seasons_repo.dart';
import '../../domain/repositories/home_repo.dart';

@Injectable()
class HomeCubit extends BaseCubit {
  final HomeRepo _repo;
  final CategoriesRepo _categoriesRepo;
  final ProductsRepo _productsRepo;

  HomeCubit(this._repo, this._categoriesRepo, this._productsRepo);

  void fetchInitialData() {
    executeDoubleSuccess(() => _categoriesRepo.fetchCategories(), () => _productsRepo.fetchProducts());
  }

}
