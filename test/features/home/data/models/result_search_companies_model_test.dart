import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_challenge/features/home/data/models/result_search_companies_model.dart';

void main() {
  group('ResultSearchCompaniesModel', () {
    test('should create a valid model from JSON', () {
      final json = {'id': '123', 'name': 'Test Company'};
      final model = ResultSearchCompaniesModel.fromJson(json);

      expect(model.id, '123');
      expect(model.name, 'Test Company');
    });

    test('should return a valid JSON from model', () {
      final model = ResultSearchCompaniesModel(id: '123', name: 'Test Company');
      final json = model.toJson();

      expect(json, {'id': '123', 'name': 'Test Company'});
    });

    test('should handle missing fields in JSON gracefully', () {
      final Map<String, dynamic> json = {};
      final model = ResultSearchCompaniesModel.fromJson(json);

      expect(model.id, '');
      expect(model.name, '');
    });
  });
}