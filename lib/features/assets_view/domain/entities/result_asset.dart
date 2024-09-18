class ResultAsset {
  final String? gatewayId;
  final String id;
  final String? locationId;
  final String name;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String? status;

  ResultAsset({
    this.gatewayId,
    this.locationId,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    required this.id,
    required this.name,
  });
}
