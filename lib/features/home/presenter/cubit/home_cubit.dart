import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';
import 'package:tractian_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:tractian_challenge/features/home/presenter/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final List<ResultCompany> _locations = [];
  final HomeRepository repository;
  List<ResultCompany> get locations => _locations;

  HomeCubit(this.repository) : super(HomeLoadingState());

  Future<void> getLocations() async {
    emit(HomeLoadingState());
    try {
      await repository.getCompanies().then((value) {
        value.fold((l) {
          emit(HomeErrorState('Erro ao buscar os locais'));
        }, (r) {
          _locations.addAll(r);
          emit(HomeSuccessState(_locations));
        });
      });
    } catch (e) {
      emit(HomeErrorState('Erro ao buscar os locais'));
    }
  }
}
