import 'package:tractian_challenge/features/assets_view/domain/entities/result_location.dart';

class ResultLocationsModel extends ResultLocation {
  ResultLocationsModel({
    required super.id,
    required super.name,
    super.parentId,
  });

  factory ResultLocationsModel.fromJson(Map<String, dynamic> json) => ResultLocationsModel(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parentId": parentId,
      };
}
