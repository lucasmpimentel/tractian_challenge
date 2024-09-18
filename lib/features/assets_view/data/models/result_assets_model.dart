import 'package:tractian_challenge/features/assets_view/domain/entities/result_asset.dart';

class ResultAssetsModel extends ResultAsset {
  ResultAssetsModel({
    super.gatewayId,
    super.locationId,
    super.parentId,
    super.sensorId,
    super.sensorType,
    super.status,
    required super.id,
    required super.name,
  });

  factory ResultAssetsModel.fromJson(Map<String, dynamic> json) => ResultAssetsModel(
        gatewayId: json["gatewayId"],
        locationId: json["locationId"],
        parentId: json["parentId"],
        sensorId: json["sensorId"],
        sensorType: json["sensorType"],
        status: json["status"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gatewayId": gatewayId,
        "locationId": locationId,
        "parentId": parentId,
        "sensorId": sensorId,
        "sensorType": sensorType,
        "status": status,
      };
}
