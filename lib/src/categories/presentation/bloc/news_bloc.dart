import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/repositories/categories_repo.dart';

@Injectable()
class CategoriesCubit extends BaseCubit {
  final CategoriesRepo usecase;

  CategoriesCubit(this.usecase);

  void fetchCategories(){
    executeSuccess(() => usecase.fetchCategories());
  }
}
