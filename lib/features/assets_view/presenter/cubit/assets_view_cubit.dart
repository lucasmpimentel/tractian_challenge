import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/features/assets_view/domain/usecases/assets_usecase.dart';
import 'package:tractian_challenge/features/assets_view/presenter/cubit/assets_view_states.dart';

class AssetsViewCubit extends Cubit<AssetsViewStates> {
  TreeNode _dto;
  final AssetsUsecase usecase;

  TreeNode get dto => _dto;

  AssetsViewCubit(this.usecase, this._dto) : super(AssetsViewLoadingState());

  Future<void> getAssets(String id) async {
    emit(AssetsViewLoadingState());
    try {
      _dto = await usecase.call(id);
      emit(AssetsViewSuccessState(dto));
    } catch (e) {
      emit(AssetsViewErrorState('Erro ao buscar os ativos'));
    }
  }

  Future<void> filterByEnergy(bool isActive) async {
    try {
      if (!isActive) {
        emit(AssetsViewLoadingState());
        _dto = await usecase.filterByEnergy();
        emit(AssetsViewWithEnergyFilterState(dto));
      } else {
        emit(AssetsViewLoadingState());
        _dto = await usecase.call(_dto.id);
        emit(AssetsViewSuccessState(dto));
      }
    } catch (e) {
      emit(AssetsViewErrorState('Erro ao filtrar os ativos'));
    }
  }
}
