import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';

abstract class HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  final List<ResultCompany> data;

  HomeSuccessState(this.data);
}

class HomeErrorState extends HomeStates {
  final String message;

  HomeErrorState(this.message);
}
