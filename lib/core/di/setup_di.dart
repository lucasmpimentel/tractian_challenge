import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tractian_challenge/features/assets_view/data/datasources/assets_datasource.dart';
import 'package:tractian_challenge/features/assets_view/data/datasources/assets_datasource_impl.dart';
import 'package:tractian_challenge/features/assets_view/data/repository/assets_repository_impl.dart';
import 'package:tractian_challenge/features/assets_view/domain/repositories/assets_repository.dart';
import 'package:tractian_challenge/features/assets_view/domain/usecases/assets_usecase.dart';
import 'package:tractian_challenge/features/assets_view/presenter/cubit/assets_view_cubit.dart';
import 'package:tractian_challenge/features/home/data/datasources/search_companies_datasource.dart';
import 'package:tractian_challenge/features/home/data/datasources/search_companies_datasource_impl.dart';
import 'package:tractian_challenge/features/home/data/repository/home_repository_impl.dart';
import 'package:tractian_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:tractian_challenge/features/home/domain/usecases/search_companies.dart';
import 'package:tractian_challenge/features/home/presenter/cubit/home_cubit.dart';

final getIt = GetIt.instance;

setupDi() {
  // Register your dependencies here
  // Home
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<SearchCompaniesDatasource>(() => SearchCompaniesDatasourceImpl(getIt<Dio>()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt<SearchCompaniesDatasource>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));
  getIt.registerLazySingleton<SearchCompanies>(() => SearchCompaniesImpl(repository: getIt<HomeRepository>()));

  // Assets
  getIt.registerLazySingleton<AssetsDatasource>(() => AssetsDatasourceImpl(getIt<Dio>()));
  getIt.registerLazySingleton<TreeNode>(() => TreeNode(id: '', name: '', type: ''));
  getIt.registerLazySingleton<AssetsRepository>(() => AssetsRepositoryImpl(getIt<AssetsDatasource>()));
  getIt.registerLazySingleton<AssetsUsecase>(() => GetAssetsImpl(repository: getIt<AssetsRepository>()));
  getIt.registerFactory<AssetsViewCubit>(() => AssetsViewCubit(
        getIt<AssetsUsecase>(),
        getIt<TreeNode>(),
      ));
}
