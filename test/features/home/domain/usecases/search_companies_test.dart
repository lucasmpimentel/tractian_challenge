import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';
import 'package:tractian_challenge/features/home/domain/repositories/home_repository.dart';
import 'package:tractian_challenge/features/home/domain/usecases/search_companies.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late SearchCompaniesImpl usecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = SearchCompaniesImpl(repository: mockHomeRepository);
  });

  final tCompanies = [
    ResultCompany(id: '1', name: 'Company 1'),
    ResultCompany(id: '2', name: 'Company 2'),
  ];

  test('should get list of companies from the repository', () async {
    // arrange
    when(mockHomeRepository.getCompanies())
        .thenAnswer((_) async => Right(tCompanies));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tCompanies));
    verify(mockHomeRepository.getCompanies());
    verifyNoMoreInteractions(mockHomeRepository);
  });

  test('should return an exception when the call to repository is unsuccessful', () async {
    // arrange
    when(mockHomeRepository.getCompanies())
        .thenAnswer((_) async => Left(Exception('Failed to fetch companies')));
    // act
    final result = await usecase();
    // assert
    expect(result, Left(Exception('Failed to fetch companies')));
    verify(mockHomeRepository.getCompanies());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}