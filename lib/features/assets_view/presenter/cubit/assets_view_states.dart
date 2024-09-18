import 'package:tractian_challenge/features/assets_view/domain/usecases/assets_usecase.dart';

abstract class AssetsViewStates {}

class AssetsViewLoadingState extends AssetsViewStates {}

class AssetsViewSuccessState extends AssetsViewStates {
  final TreeNode data;

  AssetsViewSuccessState(this.data);
}

class AssetsViewErrorState extends AssetsViewStates {
  final String message;

  AssetsViewErrorState(this.message);
}
