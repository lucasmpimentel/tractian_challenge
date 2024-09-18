class ResultLocation {
  final String id;
  final String name;
  final String? parentId;

  ResultLocation({
    required this.id,
    required this.name,
    this.parentId,
  });
}
