import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';

void main() {
  group('ResultCompany', () {
    test('should create a ResultCompany instance with given id and name', () {
      final resultCompany = ResultCompany(id: '1', name: 'Tractian');

      expect(resultCompany.id, '1');
      expect(resultCompany.name, 'Tractian');
    });

    test('should throw an error if id or name is null', () {
      expect(() => ResultCompany(id: '', name: 'Tractian'), throwsA(isA<AssertionError>()));
      expect(() => ResultCompany(id: '1', name: ''), throwsA(isA<AssertionError>()));
    });
  });
}