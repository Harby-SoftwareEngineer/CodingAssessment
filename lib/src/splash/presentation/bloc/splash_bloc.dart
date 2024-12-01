import 'package:injectable/injectable.dart';
import 'package:app/core/resources/data_state.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/splash.dart';
import '../../domain/use_cases/splash_usecase.dart';

@Injectable()
class SplashCubit extends BaseCubit {
  final SplashUseCase usecase;

  SplashCubit(this.usecase);

  fetchSplashData() async {
    try {
      emit(LoadingStateListener());
      final splashData = await usecase.fetchSplashData();
      emit(DataSuccess<List<Splash>>(splashData));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
