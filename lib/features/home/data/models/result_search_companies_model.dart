import 'package:tractian_challenge/features/home/domain/entities/result_company.dart';

class ResultSearchCompaniesModel extends ResultCompany {
  ResultSearchCompaniesModel({required super.id, required super.name});

  factory ResultSearchCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ResultSearchCompaniesModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
