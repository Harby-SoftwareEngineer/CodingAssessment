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
import 'package:shared_preferences/shared_preferences.dart' as _i29;

import '../../src/auth/data/data_sources/firebase_auth_service.dart' as _i11;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i12;
import '../../src/auth/data/repositories/auth_repo_imp.dart' as _i32;
import '../../src/auth/data/repositories/forgot_password_repo_imp.dart' as _i14;
import '../../src/auth/domain/repositories/auth_repo.dart' as _i31;
import '../../src/auth/domain/repositories/forgot_password_repo.dart' as _i13;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i45;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i39;
import '../../src/cart/data/data_sources/local/cart_database.dart' as _i5;
import '../../src/cart/data/repositories/cart_repo_imp.dart' as _i4;
import '../../src/cart/domain/repositories/cart_repo.dart' as _i3;
import '../../src/cart/presentation/bloc/cart_bloc.dart' as _i35;
import '../../src/categories/data/data_sources/local/categories_database.dart'
    as _i10;
import '../../src/categories/data/data_sources/remote/categories_datasource.dart'
    as _i6;
import '../../src/categories/data/repositories/categories_repo_imp.dart' as _i9;
import '../../src/categories/domain/repositories/categories_repo.dart' as _i8;
import '../../src/categories/presentation/bloc/news_bloc.dart' as _i36;
import '../../src/home/data/data_sources/home_datasource.dart' as _i15;
import '../../src/home/data/repositories/home_repo_imp.dart' as _i17;
import '../../src/home/domain/repositories/home_repo.dart' as _i16;
import '../../src/home/presentation/bloc/home_bloc.dart' as _i40;
import '../../src/nav_bar/presentation/bloc/nav_bar_bloc.dart' as _i18;
import '../../src/products/data/data_sources/local/products_database.dart'
    as _i22;
import '../../src/products/data/data_sources/remote/products_datasource.dart'
    as _i19;
import '../../src/products/data/repositories/products_repo_imp.dart' as _i21;
import '../../src/products/domain/repositories/seasons_repo.dart' as _i20;
import '../../src/products/presentation/details/bloc/product_details_bloc.dart'
    as _i41;
import '../../src/products/presentation/view/bloc/products_bloc.dart' as _i42;
import '../../src/profile/data/data_sources/profile_datasource.dart' as _i23;
import '../../src/profile/data/repositories/profile_repo_imp.dart' as _i25;
import '../../src/profile/domain/repositories/profile_repo.dart' as _i24;
import '../../src/profile/presentation/bloc/profile_bloc.dart' as _i43;
import '../../src/profile/presentation/changePhone/bloc/change_mobile_number_bloc.dart'
    as _i37;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i26;
import '../../src/settings/data/repositories/settings_repo_imp.dart' as _i28;
import '../../src/settings/domain/repositories/settings_repo.dart' as _i27;
import '../../src/settings/presentation/bloc/change_password_bloc.dart' as _i38;
import '../../src/splash/data/data_sources/splash_datasource.dart' as _i30;
import '../../src/splash/data/repositories/splash_repo.dart' as _i34;
import '../../src/splash/domain/repositories/base_splash_repo.dart' as _i33;
import '../../src/splash/domain/use_cases/splash_usecase.dart' as _i44;
import '../../src/splash/presentation/bloc/splash_bloc.dart' as _i46;
import 'injection_module.dart' as _i47;

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
  gh.factory<_i8.CategoriesRepo>(() => _i9.CategoriesRepoImp(
        gh<_i6.CategoriesDatasource>(),
        gh<_i10.CategoriesDatabase>(),
      ));
  gh.factory<_i11.FirebaseAuthService>(
      () => _i11.FirebaseAuthService(gh<_i7.Dio>()));
  gh.factory<_i12.ForgotPasswordDataSource>(
      () => _i12.ForgotPasswordDataSource(gh<_i7.Dio>()));
  gh.factory<_i13.ForgotPasswordRepo>(
      () => _i14.ForgotPasswordRepoImp(gh<_i12.ForgotPasswordDataSource>()));
  gh.factory<_i15.HomeDatasource>(() => _i15.HomeDatasource(gh<_i7.Dio>()));
  gh.factory<_i16.HomeRepo>(() => _i17.HomeRepoImp(gh<_i15.HomeDatasource>()));
  gh.factory<_i18.NavBarState>(() => _i18.NavBarState());
  gh.factory<_i19.ProductsDatasource>(
      () => _i19.ProductsDatasource(gh<_i7.Dio>()));
  gh.factory<_i20.ProductsRepo>(() => _i21.ProductsRepoImp(
        gh<_i19.ProductsDatasource>(),
        gh<_i22.ProductsDatabase>(),
      ));
  gh.factory<_i23.ProfileDataSource>(
      () => _i23.ProfileDataSource(gh<_i7.Dio>()));
  gh.factory<_i24.ProfileRepo>(
      () => _i25.ProfileRepoImp(gh<_i23.ProfileDataSource>()));
  gh.factory<_i26.SettingsDatasource>(
      () => _i26.SettingsDatasource(gh<_i7.Dio>()));
  gh.factory<_i27.SettingsRepo>(
      () => _i28.SettingsRepoImp(gh<_i26.SettingsDatasource>()));
  await gh.factoryAsync<_i29.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i30.SplashDatasource>(() => _i30.SplashDatasource(gh<_i7.Dio>()));
  gh.factory<_i31.AuthRepo>(
      () => _i32.AuthRepoImp(gh<_i11.FirebaseAuthService>()));
  gh.factory<_i33.BaseSplashRepo>(
      () => _i34.SplashRepo(gh<_i30.SplashDatasource>()));
  gh.factory<_i35.CartCubit>(() => _i35.CartCubit(gh<_i3.CartRepo>()));
  gh.factory<_i36.CategoriesCubit>(
      () => _i36.CategoriesCubit(gh<_i8.CategoriesRepo>()));
  gh.factory<_i37.ChangeMobileNumberCubit>(
      () => _i37.ChangeMobileNumberCubit(gh<_i24.ProfileRepo>()));
  gh.factory<_i38.ChangePasswordCubit>(
      () => _i38.ChangePasswordCubit(gh<_i13.ForgotPasswordRepo>()));
  gh.factory<_i39.ForgotPasswordCubit>(() => _i39.ForgotPasswordCubit(
        gh<_i13.ForgotPasswordRepo>(),
        gh<_i31.AuthRepo>(),
      ));
  gh.factory<_i40.HomeCubit>(() => _i40.HomeCubit(
        gh<_i16.HomeRepo>(),
        gh<_i8.CategoriesRepo>(),
        gh<_i20.ProductsRepo>(),
      ));
  gh.factory<_i41.ProductDetailsCubit>(() => _i41.ProductDetailsCubit(
        gh<_i20.ProductsRepo>(),
        gh<_i3.CartRepo>(),
      ));
  gh.factory<_i42.ProductsCubit>(
      () => _i42.ProductsCubit(gh<_i20.ProductsRepo>()));
  gh.factory<_i43.ProfileBloc>(() => _i43.ProfileBloc(
        gh<_i24.ProfileRepo>(),
        gh<_i31.AuthRepo>(),
        gh<_i13.ForgotPasswordRepo>(),
      ));
  gh.factory<_i44.SplashUseCase>(
      () => _i44.SplashUseCase(gh<_i33.BaseSplashRepo>()));
  gh.factory<_i45.AuthCubit>(() => _i45.AuthCubit(gh<_i31.AuthRepo>()));
  gh.factory<_i46.SplashCubit>(
      () => _i46.SplashCubit(gh<_i44.SplashUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i47.InjectionModule {}
