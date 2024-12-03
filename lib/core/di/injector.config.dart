// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i27;

import '../../src/auth/data/data_sources/firebase_auth_service.dart' as _i10;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i11;
import '../../src/auth/data/repositories/auth_repo_imp.dart' as _i30;
import '../../src/auth/data/repositories/forgot_password_repo_imp.dart' as _i13;
import '../../src/auth/domain/repositories/auth_repo.dart' as _i29;
import '../../src/auth/domain/repositories/forgot_password_repo.dart' as _i12;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i43;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i37;
import '../../src/cart/data/data_sources/local/cart_database.dart' as _i5;
import '../../src/cart/data/repositories/cart_repo_imp.dart' as _i4;
import '../../src/cart/domain/repositories/cart_repo.dart' as _i3;
import '../../src/cart/presentation/bloc/cart_bloc.dart' as _i33;
import '../../src/categories/data/data_sources/remote/categories_datasource.dart'
    as _i6;
import '../../src/categories/data/repositories/categories_repo_imp.dart' as _i9;
import '../../src/categories/domain/repositories/categories_repo.dart' as _i8;
import '../../src/categories/presentation/bloc/news_bloc.dart' as _i34;
import '../../src/home/data/data_sources/home_datasource.dart' as _i14;
import '../../src/home/data/repositories/home_repo_imp.dart' as _i16;
import '../../src/home/domain/repositories/home_repo.dart' as _i15;
import '../../src/home/presentation/bloc/home_bloc.dart' as _i38;
import '../../src/nav_bar/presentation/bloc/nav_bar_bloc.dart' as _i17;
import '../../src/products/data/data_sources/remote/products_datasource.dart'
    as _i18;
import '../../src/products/data/repositories/products_repo_imp.dart' as _i20;
import '../../src/products/domain/repositories/seasons_repo.dart' as _i19;
import '../../src/products/presentation/details/bloc/product_details_bloc.dart'
    as _i39;
import '../../src/products/presentation/view/bloc/products_bloc.dart' as _i40;
import '../../src/profile/data/data_sources/profile_datasource.dart' as _i21;
import '../../src/profile/data/repositories/profile_repo_imp.dart' as _i23;
import '../../src/profile/domain/repositories/profile_repo.dart' as _i22;
import '../../src/profile/presentation/bloc/profile_bloc.dart' as _i41;
import '../../src/profile/presentation/changePhone/bloc/change_mobile_number_bloc.dart'
    as _i35;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i24;
import '../../src/settings/data/repositories/settings_repo_imp.dart' as _i26;
import '../../src/settings/domain/repositories/settings_repo.dart' as _i25;
import '../../src/settings/presentation/bloc/change_password_bloc.dart' as _i36;
import '../../src/splash/data/data_sources/splash_datasource.dart' as _i28;
import '../../src/splash/data/repositories/splash_repo.dart' as _i32;
import '../../src/splash/domain/repositories/base_splash_repo.dart' as _i31;
import '../../src/splash/domain/use_cases/splash_usecase.dart' as _i42;
import '../../src/splash/presentation/bloc/splash_bloc.dart' as _i44;
import 'injection_module.dart' as _i45;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.CartRepo>(() => _i4.CartRepoImp(gh<_i5.CartDatabase>()));
  gh.factory<_i6.CategoriesDatasource>(
      () => _i6.CategoriesDatasource(gh<_i7.Dio>()));
  gh.factory<_i8.CategoriesRepo>(
      () => _i9.CategoriesRepoImp(gh<_i6.CategoriesDatasource>()));
  gh.factory<_i10.FirebaseAuthService>(
      () => _i10.FirebaseAuthService(gh<_i7.Dio>()));
  gh.factory<_i11.ForgotPasswordDataSource>(
      () => _i11.ForgotPasswordDataSource(gh<_i7.Dio>()));
  gh.factory<_i12.ForgotPasswordRepo>(
      () => _i13.ForgotPasswordRepoImp(gh<_i11.ForgotPasswordDataSource>()));
  gh.factory<_i14.HomeDatasource>(() => _i14.HomeDatasource(gh<_i7.Dio>()));
  gh.factory<_i15.HomeRepo>(() => _i16.HomeRepoImp(gh<_i14.HomeDatasource>()));
  gh.factory<_i17.NavBarState>(() => _i17.NavBarState());
  gh.factory<_i18.ProductsDatasource>(
      () => _i18.ProductsDatasource(gh<_i7.Dio>()));
  gh.factory<_i19.ProductsRepo>(
      () => _i20.ProductsRepoImp(gh<_i18.ProductsDatasource>()));
  gh.factory<_i21.ProfileDataSource>(
      () => _i21.ProfileDataSource(gh<_i7.Dio>()));
  gh.factory<_i22.ProfileRepo>(
      () => _i23.ProfileRepoImp(gh<_i21.ProfileDataSource>()));
  gh.factory<_i24.SettingsDatasource>(
      () => _i24.SettingsDatasource(gh<_i7.Dio>()));
  gh.factory<_i25.SettingsRepo>(
      () => _i26.SettingsRepoImp(gh<_i24.SettingsDatasource>()));
  await gh.factoryAsync<_i27.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i28.SplashDatasource>(() => _i28.SplashDatasource(gh<_i7.Dio>()));
  gh.factory<_i29.AuthRepo>(
      () => _i30.AuthRepoImp(gh<_i10.FirebaseAuthService>()));
  gh.factory<_i31.BaseSplashRepo>(
      () => _i32.SplashRepo(gh<_i28.SplashDatasource>()));
  gh.factory<_i33.CartCubit>(() => _i33.CartCubit(gh<_i3.CartRepo>()));
  gh.factory<_i34.CategoriesCubit>(
      () => _i34.CategoriesCubit(gh<_i8.CategoriesRepo>()));
  gh.factory<_i35.ChangeMobileNumberCubit>(
      () => _i35.ChangeMobileNumberCubit(gh<_i22.ProfileRepo>()));
  gh.factory<_i36.ChangePasswordCubit>(
      () => _i36.ChangePasswordCubit(gh<_i12.ForgotPasswordRepo>()));
  gh.factory<_i37.ForgotPasswordCubit>(() => _i37.ForgotPasswordCubit(
        gh<_i12.ForgotPasswordRepo>(),
        gh<_i29.AuthRepo>(),
      ));
  gh.factory<_i38.HomeCubit>(() => _i38.HomeCubit(
        gh<_i15.HomeRepo>(),
        gh<_i8.CategoriesRepo>(),
        gh<_i19.ProductsRepo>(),
      ));
  gh.factory<_i39.ProductDetailsCubit>(() => _i39.ProductDetailsCubit(
        gh<_i19.ProductsRepo>(),
        gh<_i3.CartRepo>(),
      ));
  gh.factory<_i40.ProductsCubit>(
      () => _i40.ProductsCubit(gh<_i19.ProductsRepo>()));
  gh.factory<_i41.ProfileBloc>(() => _i41.ProfileBloc(
        gh<_i22.ProfileRepo>(),
        gh<_i29.AuthRepo>(),
        gh<_i12.ForgotPasswordRepo>(),
      ));
  gh.factory<_i42.SplashUseCase>(
      () => _i42.SplashUseCase(gh<_i31.BaseSplashRepo>()));
  gh.factory<_i43.AuthCubit>(() => _i43.AuthCubit(gh<_i29.AuthRepo>()));
  gh.factory<_i44.SplashCubit>(
      () => _i44.SplashCubit(gh<_i42.SplashUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i45.InjectionModule {}
