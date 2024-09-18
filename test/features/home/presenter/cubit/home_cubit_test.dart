import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';
import 'package:tractian_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:tractian_challenge/features/home/presenter/cubit/home_cubit.dart';
import 'package:tractian_challenge/features/home/presenter/cubit/home_states.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockHomeRepository;
  late HomeCubit homeCubit;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    homeCubit = HomeCubit(mockHomeRepository);
  });

  tearDown(() {
    homeCubit.close();
  });

  group('HomeCubit', () {
    final List<ResultCompany> tCompanies = [
      ResultCompany(id: '1', name: 'Company 1'),
      ResultCompany(id: '2', name: 'Company 2'),
    ];

    blocTest<HomeCubit, HomeStates>(
      'emits [HomeLoadingState, HomeSuccessState] when getLocations is successful',
      build: () {
        when(mockHomeRepository.getCompanies())
            .thenAnswer((_) async => Right(tCompanies));
        return homeCubit;
      },
      act: (cubit) => cubit.getLocations(),
      expect: () => [
        HomeLoadingState(),
        HomeSuccessState(tCompanies),
      ],
    );

    blocTest<HomeCubit, HomeStates>(
      'emits [HomeLoadingState, HomeErrorState] when getLocations fails',
      build: () {
        when(mockHomeRepository.getCompanies())
            .thenAnswer((_) async =>  Left(Exception('Error')));
        return homeCubit;
      },
      act: (cubit) => cubit.getLocations(),
      expect: () => [
        HomeLoadingState(),
        HomeErrorState('Erro ao buscar os locais'),
      ],
    );
  });
}