import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/core/di/setup_di.dart';
import 'package:tractian_challenge/features/assets_view/presenter/assets_view_page.dart';
import 'package:tractian_challenge/features/assets_view/presenter/cubit/assets_view_cubit.dart';
import 'package:tractian_challenge/features/home/presenter/cubit/home_cubit.dart';
import 'package:tractian_challenge/features/home/presenter/home_page.dart';

final routes = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => HomePage(getIt<HomeCubit>())),
  GoRoute(
    path: '/:id/assets',
    builder: (context, state) => AssetsViewPage(getIt<AssetsViewCubit>(), id: state.pathParameters['id'] ?? ''),
  ),
]);
